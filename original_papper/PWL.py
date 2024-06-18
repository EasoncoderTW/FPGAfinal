import numpy as np
import matplotlib.pyplot as plt

FRACTION_BIT = 9

def to_hex(d):
    if d >= 0:
        return hex(d)[2:]
    else:
        return hex(2**16+d)[2:]
    
def fix(x):
    return int(x*(2**FRACTION_BIT)) / (2**FRACTION_BIT)

class PWL(object):
    def __init__(self, function, boundary_error,shift_bit = 3 ,approx_range = (-8,8)) -> None:
        assert(callable(function)),  "Function should be callable"
        self.origin_function = function
        self.boundary_error = boundary_error
        self.slope_bound = []
        self.bias_bound = []
        self.approx_range = approx_range
        self.shift_bit = shift_bit
        self.slope_bound_cnt = 0
        self.bias_bound_cnt = 0
        self.shift_bit = shift_bit
        self.run_PWL()
    
    def run_PWL(self):
        print("Runing PWL approximate...", end ="")
        X = list(np.linspace(-8, 8, (2**6)*16+1))
        Y = [self.origin_function(x) for x in X]
        Y_dif = [(y[1]-y[0])/(x[1]-x[0]) for x,y in zip(zip(X[:-1],X[1:]),zip(Y[:-1],Y[1:]))]
        
        def find_slope(y_dif):
            p = [0,0.125] #+ [2**i for i in list(range(-self.shift_bit,self.shift_bit))]
            s = min(p,key=lambda t: abs(t-abs(y_dif)))
            return s

        approx_slope = [find_slope(y_dif) for y_dif in Y_dif]
        
        self.slope_bound = []
        self.bias_bound = []
        current_slope = None
        current_slope_bound = X[0]
        current_bias = 0
        self.slope_bound_cnt = 0
        self.bias_bound_cnt = 0
        for x,slope,y in zip(X[:-1],approx_slope,Y[:-1]):
            if slope != current_slope:
                self.slope_bound_cnt += 1
                current_slope = fix(slope)
                #current_bias = (int((y - current_slope*(x-current_slope_bound))*(2**FRACTION_BIT)) / (2**FRACTION_BIT))
                current_slope_bound = fix(x)
                self.slope_bound.append([current_slope_bound, current_slope])
                #self.bias_bound.append([x, current_bias])
                
            y_approx = fix(fix(current_slope*fix(x-current_slope_bound))+current_bias)
            if abs(y_approx-y) > self.boundary_error:
                self.bias_bound_cnt += 1
                current_bias = (fix((y - fix(current_slope*fix(x-current_slope_bound)) + self.boundary_error*0.7))) if y_approx < y else (fix((y - fix(current_slope*(x-current_slope_bound)) - self.boundary_error*0.7)))
                #current_bias =  (int(y//(2**-8)) * (2**-8))
                self.bias_bound.append([fix(x), current_bias])

        
        print("Done")
    
    def __call__(self,x):  
        y = 0
        for (bound,slope),(bound_next, _) in zip(self.slope_bound[:-1],self.slope_bound[1:]):
            if x >= bound and x < bound_next:
                y = fix(slope)*fix(x-bound)
                break
        else:
            if x < self.slope_bound[0][0]:
                y = fix(self.slope_bound[0][1])*fix((x-self.slope_bound[0][0]))
            else:
                y = fix(self.slope_bound[-1][1])*fix(x-self.slope_bound[-1][0])
        y = fix(y)
        for (bound,bias),(bound_next, _) in zip(self.bias_bound[:-1],self.bias_bound[1:]):
            if x >= bound and x < bound_next:
                y = fix(y + bias)
                break    
        else:
            if x >= self.bias_bound[-1][0]:
                y = fix(y + self.bias_bound[-1][1])
        return y

    @property
    def entry(self):
        return len(self.bias_bound)

    def gen_verilog(self, filename = "auto_gen.v"):
        f = open(filename+".v","w")
        f.write(f"module {filename}(\n")
        f.write("\tinput clk,\n")
        f.write("\tinput rst,\n")
        f.write("\tinput [15:0] x,\n")
        f.write("\toutput wire [15:0] y\n")
        f.write(");\n\n")
        f.write("reg signed [{:d}:0] slope, slope_stage_reg;\n".format(int(np.log2(self.slope_bound_cnt)+1)))
        f.write("reg signed [{:d}:0] bias, bias_stage_reg;\n".format(int(np.log2(self.bias_bound_cnt)+1)))
        f.write("reg signed [15:0] x_delta, x_stage_reg;\n")
        f.write("reg zero, zero_stage_reg;\n")
        f.write("always @(posedge clk) begin\n")
        f.write("\tif(~rst) begin\n")
        f.write("\t\tslope_stage_reg <= 0;\n")
        f.write("\t\tbias_stage_reg <= 0;\n")
        f.write("\t\tx_stage_reg <= 0;\n")
        f.write("\t\tzero_stage_reg <= 0;\n")
        f.write("\tend else begin\n")
        f.write("\t\tslope_stage_reg <= slope;\n")
        f.write("\t\tbias_stage_reg <= bias;\n")
        f.write("\t\tx_stage_reg <= (x - x_delta);\n")
        f.write("\t\tzero_stage_reg <= zero;\n")
        f.write("\tend\n")
        f.write("end\n")
        f.write("assign y = (zero_stage_reg)? 0: ({{16{x_stage_reg[15]}},x_stage_reg} >> slope_stage_reg) + bias_stage_reg;\n")
        f.write("/**************** Compare and LUT *****************/\n")
        f.write("always @(*) begin\n")
        b = [i[0] for i in self.slope_bound]
        s = [i[1] for i in self.slope_bound]
        for bound,slope,bound_n in zip(b,[0,] + s[:-1], [b[0],]+b[:-1]):
            f.write("\tif(x < $signed(16'h{:s})) begin // {:f} \n".format(to_hex(int(bound*(2**FRACTION_BIT))),bound))
            if slope == 0:
                f.write("\t\tslope = 16'h{:d};\n".format(0))
                f.write("\t\tzero = {:d};\n".format(1))
            else:
                try:
                    f.write("\t\tslope = 16'h{:s}; // {:f}\n".format(to_hex(int(-np.log2(slope))),slope))
                    f.write("\t\tzero = {:d};\n".format(0))
                except:
                    f.write("\t\tslope = 16'h{:d}; // {:f}\n".format(0,slope))
                    f.write("\t\tzero = {:d};\n".format(1))
            f.write("\t\tx_delta = 16'h{:s};\n".format(to_hex(int(bound_n*(2**FRACTION_BIT)))))
            f.write("\tend else ")
        f.write("begin\n\t\tslope = 16'h{:s};\n\t\tzero = 0;\n\t\tx_delta = 16'h{:s};\n\tend\n\n".format(to_hex(int(s[-1])),to_hex(int(bound*(2**FRACTION_BIT)))))
        
        b = [i[0] for i in self.bias_bound]
        bi = [i[1] for i in self.bias_bound]
        for bound,bias in zip(b,[0,] + bi[:-1]):
            f.write("\tif(x < $signed(16'h{:s})) begin // {:f}\n".format(to_hex(int(bound*(2**FRACTION_BIT))),bound))
            f.write("\t\tbias = 16'h{:s}; // {:f} \n".format(to_hex(int(bias*(2**FRACTION_BIT))),bias))
            f.write("\tend else ")
        f.write("begin\n\t\tbias = 16'h{:s}; // {:f} \n\tend\nend\n\n".format(to_hex(int(bi[-1]*(2**FRACTION_BIT))),bias))
        f.write("endmodule\n")
        f.close()
            
        
    
# 5
def sigmoid(x):
    return 1 / (1 + np.exp(-x))
# 2
def silu(x):
    return x / (1 + np.exp(-x))
# 4
def tanh(x):
    return  (np.exp(x) - np.exp(-x)) / (np.exp(x) + np.exp(-x))

def main():
    function_pwl = PWL(tanh,boundary_error = 0.01,shift_bit=4)
    
    X = list(np.linspace(-8,8,(2**6)*16+1))
    Y = [function_pwl.origin_function(x) for x in X]
    Y_pwl = [function_pwl(x) for x in X]
    err = [y_pwl-y for y,y_pwl in zip(Y,Y_pwl)]
    print("[Entry] {:2d} [Slope] {:2d} [Bias] {:2d}".format(function_pwl.entry,function_pwl.slope_bound_cnt, function_pwl.bias_bound_cnt))
    
    #for x,slope in function_pwl.slope_bound:
    #    print(x, slope)


    fig, ax1 = plt.subplots()
    ax1.plot(X, Y, label = "origin")
    ax1.plot(X, Y_pwl, label = "PWL")

    ax2 = ax1.twinx()  # instantiate a second Axes that shares the same x-axis

    ax2.scatter(X, err, label = "error", s = 0.5)
    ax2.set_ylim(-0.02,0.02)

    fig.tight_layout()  # otherwise the right y-label is slightly clipped

    plt.show()

def test():
    x = list(range(1,32))
    y_slope = []
    y_bias = []
    y_entry = []
    for s in x:
        function_pwl = PWL(tanh,boundary_error = 0.01,shift_bit=s)
        y_slope.append(function_pwl.slope_bound_cnt)
        y_bias.append(function_pwl.bias_bound_cnt)
        y_entry.append(function_pwl.entry)
        print(" {:3d} [Entry] {:2d} [Slope] {:2d} [Bias] {:2d}".format(s,function_pwl.entry,function_pwl.slope_bound_cnt, function_pwl.bias_bound_cnt))
    
    print(x[np.argmin(y_entry)],min(y_entry))

    plt.figure()
    plt.plot(x, y_slope, label = "slope")
    plt.plot(x, y_bias, label = "bias")
    plt.plot(x, y_entry, label = "total")
    plt.legend()
    plt.tight_layout()  # otherwise the right y-label is slightly clipped

    plt.show()

def code_gen():
    function_pwl = PWL(tanh,boundary_error = 0.01,shift_bit=4)
    function_pwl.gen_verilog("tanhPWL")
    function_pwl = PWL(silu,boundary_error = 0.01,shift_bit=2)
    function_pwl.gen_verilog("siluPWL")
    function_pwl = PWL(sigmoid,boundary_error = 0.01,shift_bit=5)
    function_pwl.gen_verilog("original_papper\sigmoidPWL")
    
    
if __name__ == "__main__":
    #main()
    #test()
    code_gen()
