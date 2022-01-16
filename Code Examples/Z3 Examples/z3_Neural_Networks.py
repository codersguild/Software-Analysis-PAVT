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
    print(layer_2_out.tolist()[0][0])
    
    for index, elems in enumerate(layer_2_out):
        rhs = elems.tolist()[0][0]
        lhs = outputs[index]
        # ReLU Activation
        S.add(z3.If(rhs >= 0, lhs == rhs, lhs == 0))
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
    S.add(loss == sumVal + 10000 * z3.If(inputs[1] - inputs[-1] >= 0, inputs[1] - inputs[-1], 0)) 
    S.add(loss == 0)
    
    # print(S.assertions())
    print(S.check())
    print(S.model())
