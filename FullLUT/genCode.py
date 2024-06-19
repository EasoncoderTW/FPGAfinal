import numpy as np

filename = "fullLUT"


def sigmoid(x):
    return 1 / (1 + np.exp(-x))

def tanh(x):
    return (np.exp(x) - np.exp(-x)) / (np.exp(x) + np.exp(-x))

def silu(x):
    return x / (1 + np.exp(-x))

def to_hex(d):
    if d >= 0:
        return hex(d)[2:]
    else:
        return hex(2**16+d)[2:]




def genCode(filename, fn):

    f = open(filename+".v","w")
    f.write(f"module {filename}(\n")
    f.write("\tinput [15:0] x,\n")
    f.write("\toutput reg [15:0] y\n")
    f.write(");\n\n")
    
    f.write("\talways @(*) begin\n")
    f.write("\t\tcase(x)\n")

    for i in range(2**16):
        x = - 64 + i * (1 / 512)
        y = fn(x)
        hex_x = to_hex(int(x * 512))
        hex_y = to_hex(int(y * 512))
        f.write("\t\t\t16'h{:s}: y = 16'h{:s};\n".format(hex_x,hex_y))

    f.write("\t\t\tdefault: y = 0;\n")

    f.write("\t\tendcase\n")
    f.write("\tend\n")
    f.write("endmodule\n")
    f.close()


genCode("GenSigmoid", sigmoid)
genCode("GenSilu", silu)
genCode("GenTanh", tanh)