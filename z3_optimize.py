# -*- coding: utf-8 -*-
from z3 import *
import random 
    
score = Int('score')
x, y, z = Reals('x, y, z')

opt_solver = Optimize()
conds_simplex = x > 0, x < 90, y > 67, y < 110, z > 890, z < 1150, score == (x + y + z)

opt_solver.push()
opt_solver.add(conds_simplex)
score_bound_min = opt_solver.minimize(score)
opt_solver.check()
print(opt_solver.model())

opt_solver.pop()
opt_solver.add(conds_simplex)
score_bound_max = opt_solver.maximize(score)
opt_solver.check()
print(opt_solver.model())
