# -*- coding: utf-8 -*-
from z3 import *
import random 

    def get_z3_result (self) : 
        """
        Get Z3 Results 
        """
        __check = self.main_solver.check() 
        if __check == sat :
            return self.main_solver.model()
        elif __check == unknown :
            print(self.main_solver.reason_unknown())
            return __check
        elif __check == unsat :
            return __check
        
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
