# Encoding of a Neural Network in Z3. 
from z3 import *
import numpy as np

if __name__ == "__main__":

    S = z3.Solver()

    inputs = [z3.Real(f"{i}_l1") for i in ["x_input","y_input","n_input","a_input"]]
    outputs1 = [z3.Real(f"activation_{i}") for i in range(10)]
    
    outputs = [z3.Real(f"{i}_l1") for i in ["C_0","C_1","C_2","C_3"]]
    sumVal = z3.Real("sumVal")
    loss = z3.Real("loss")
    
    layer_1_weights = [[z3.Real(f"weight_l1_{i}_{j}")
                            for j in range(10)]
                            for i in range(4)]

    layer_1_bias = [z3.Real(f"bias_l1_{i}") for i in range(10)]

    layer_2_weights = [[z3.Real(f"weight_l2_{i}_{j}")
                            for j in range(4)]
                            for i in range(10)]

    layer_2_bias = [z3.Real(f"bias_l2_{i}") for i in range(4)]
    
    weights1 = np.matrix(layer_1_weights)
    bias1 = np.matrix(layer_1_bias)
    activation1 = np.matrix(outputs1)
    weights2 = np.matrix(layer_2_weights)
    bias2 = np.matrix(layer_2_bias)
    inp = np.matrix(inputs)

    layer_1_out = weights1.T * inp.T + bias1.T
    
    for index, elems in enumerate(layer_1_out):
        rhs = elems.tolist()[0][0]
        lhs = outputs1[index]
        # ReLU Activation
        S.add(z3.If(rhs >= 0, lhs == rhs, lhs == 0))
        if index == 0:
            print(z3.If(rhs >= 0, lhs == rhs, lhs == 0))
        # print(f"{lhs} == {rhs}", end="\n\n")
    
    layer_2_out = activation1 * weights2 + bias2
    
    for index, elems in enumerate(layer_2_out):
        rhs = elems.tolist()[0][0]
        lhs = outputs[index]
        # ReLU Activation
        S.add(z3.If(rhs >= 0, lhs == rhs, lhs == 0))
        if index == 0:
            print(z3.If(rhs >= 0, lhs == rhs, lhs == 0))
        # print(f"{lhs} == {rhs}", end="\n\n")

    sumVal = z3.Sum([(inputs[index] * outputs[index]) for index in range(4)])
    print(sumVal)
    
    weights_constraint = []
    [[weights_constraint.append(j > 2) for j in i] for i in layer_1_weights]
    S.add(z3.And(weights_constraint))
    weights_constraint = []
    [[weights_constraint.append(j > 3) for j in i] for i in layer_2_weights]
    S.add(z3.And(weights_constraint))
    
    [S.add(elem > 1) for elem in layer_1_bias]
    [S.add(elem > 7) for elem in layer_2_bias]
    
    [S.add(j > 14) for j in inputs]
    [S.add(j != 0) for j in outputs]
    
    # Loss
    S.add(loss == sumVal ** 2 + 10000 * z3.If(inputs[1] - inputs[-1] >= 0, inputs[1] - inputs[-1], 0)) 
    S.add(loss == 0)
    
    # print(S.assertions())
    print(S.check())
    print(S.model())

# [weight_l1_3_3 = 131073/65536,
#  weight_l2_2_2 = 4,
#  n_input_l1 = 15,
#  a_input_l1 = 15,
#  weight_l2_2_3 = 4,
#  weight_l1_0_6 = 33/16,
#  weight_l2_9_0 = 4,
#  weight_l2_3_1 = 4,
#  weight_l1_0_7 = 33/16,
#  weight_l1_0_2 = 33/16,
#  weight_l2_3_2 = 4,
#  weight_l1_1_5 = 513/256,
#  weight_l1_3_6 = 131073/65536,
#  weight_l2_3_0 = 4,
#  weight_l1_3_0 = 131073/65536,
#  bias_l1_1 = 65537/65536,
#  bias_l1_4 = 65537/65536,
#  weight_l1_3_1 = 131073/65536,
#  bias_l1_8 = 65537/65536,
#  C_1_l1 = -1,
#  weight_l1_2_5 = 8193/4096,
#  weight_l2_8_0 = 4,
#  C_3_l1 = -4888,
#  weight_l1_2_2 = 8193/4096,
#  bias_l1_0 = 65537/65536,
#  weight_l1_1_4 = 513/256,
#  y_input_l1 = 15,
#  weight_l1_2_4 = 8193/4096,
#  weight_l1_2_6 = 8193/4096,
#  weight_l1_3_5 = 131073/65536,
#  x_input_l1 = 15,
#  bias_l2_0 = 8,
#  weight_l1_0_4 = 33/16,
#  bias_l1_6 = 65537/65536,
#  weight_l1_0_1 = 33/16,
#  weight_l1_1_8 = 513/256,
#  weight_l1_3_9 = 131073/65536,
#  bias_l1_2 = 65537/65536,
#  weight_l1_0_9 = 33/16,
#  bias_l1_3 = 65537/65536,
#  weight_l1_0_8 = 33/16,
#  weight_l1_2_8 = 8193/4096,
#  weight_l2_4_0 = 4,
#  weight_l2_5_0 = 4,
#  weight_l1_2_0 = 8193/4096,
#  weight_l1_3_7 = 131073/65536,
#  C_2_l1 = 1,
#  weight_l1_1_0 = 513/256,
#  weight_l1_2_7 = 8193/4096,
#  weight_l1_3_4 = 131073/65536,
#  weight_l2_1_0 = 4,
#  bias_l1_9 = 65537/65536,
#  weight_l1_1_3 = 513/256,
#  weight_l2_6_0 = 4,
#  weight_l1_3_2 = 131073/65536,
#  weight_l1_3_8 = 131073/65536,
#  weight_l1_2_3 = 8193/4096,
#  weight_l1_1_9 = 513/256,
#  bias_l1_5 = 65537/65536,
#  weight_l1_2_9 = 8193/4096,
#  weight_l1_0_0 = 33/16,
#  weight_l1_1_2 = 513/256,
#  weight_l2_0_2 = 4,
#  weight_l1_1_7 = 513/256,
#  weight_l2_0_0 = 4,
#  weight_l2_2_0 = 4,
#  weight_l2_0_3 = 4,
#  weight_l2_1_1 = 4,
#  weight_l1_2_1 = 8193/4096,
#  weight_l1_1_1 = 513/256,
#  weight_l1_1_6 = 513/256,
#  weight_l2_1_2 = 4,
#  weight_l2_7_0 = 4,
#  weight_l2_1_3 = 4,
#  weight_l1_0_5 = 33/16,
#  weight_l1_0_3 = 33/16,
#  weight_l2_2_1 = 4,
#  bias_l1_7 = 65537/65536,
#  weight_l2_0_1 = 4,
#  bias_l2_3 = 8,
#  bias_l2_2 = 8,
#  bias_l2_1 = 8,
#  weight_l2_9_3 = 4,
#  weight_l2_9_2 = 4,
#  weight_l2_9_1 = 4,
#  weight_l2_8_3 = 4,
#  weight_l2_8_2 = 4,
#  weight_l2_8_1 = 4,
#  weight_l2_7_3 = 4,
#  weight_l2_7_2 = 4,
#  weight_l2_7_1 = 4,
#  weight_l2_6_3 = 4,
#  weight_l2_6_2 = 4,
#  weight_l2_6_1 = 4,
#  weight_l2_5_3 = 4,
#  weight_l2_5_2 = 4,
#  weight_l2_5_1 = 4,
#  weight_l2_4_3 = 4,
#  weight_l2_4_2 = 4,
#  weight_l2_4_1 = 4,
#  weight_l2_3_3 = 4,
#  C_0_l1 = 4888,
#  loss = 0,
#  activation_9 = 122,
#  activation_8 = 122,
#  activation_7 = 122,
#  activation_6 = 122,
#  activation_5 = 122,
#  activation_4 = 122,
#  activation_3 = 122,
#  activation_2 = 122,
#  activation_1 = 122,
#  activation_0 = 122]
