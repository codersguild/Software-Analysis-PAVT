#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import z3

if __name__ == "__main__":
    t, x, y, x1, y1 = z3.Ints('t, x, y, x1, y1')
    solver  = z3.Solver()
    
    solver.add(x == 4)
    solver.add(y == 2)

    print(solver.check())
    print(solver.model())
    
    # Swapping constraint over three variables.
    solver.add(z3.If(x > y, t == x, x == x))
    solver.add(z3.If(t == x, x1 == y, x == x))
    solver.add(z3.If(x1 == y, y1 == t, y == y))
    
    print(solver.check())
    print(solver.model())

    # x1, y1 have the swapped values of x & y. 
    
    # sat
    # [y, = 2, x, = 4]
    # sat
    # [x, = 4, y1 = 4, y, = 2, t, = 4, x1, = 2]
