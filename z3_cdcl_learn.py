# -*- coding: utf-8 -*-
from z3 import *

S = Solver()
a, b, c = Ints('a b c')

"""
A predicate which tells if a given set of values assigned to a, b, c 
satisfy the given constraints.  
"""
def check_predicate (x, y, z) : 
    if x > 243 and y > 560 and z > 21349 : 
        return True
    elif x > 124 and y > 454 and z >= 3341 : 
        return True
    elif x > 876 and y > 806 and y < 709 and z > 438 : # this z3 will never take but learn from it. 
        return True
    elif x >= 212 and y > 34314 and z >= 435900 : # z3 tries to hit this.
        return True
    else :
        return False
    
def get_value (r) : 
    """
    Convert from Z3 to python values. 
    """
    if is_int_value(r) : 
        return r.as_long()
    elif is_rational_value(r) :
        return num(r)
    elif is_algebraic_value(r) : 
        return num(r.approx(10))
    elif r is None : 
        None
    else :
        return num(r)

"""
Add the initial constraints to z3 and check SAT.
"""
S.add(a > 0, b > 0, c > 0)

S.check()
model = S.model()

"""
Assign values to a, b, c and see if the predicate is 
satisfied or not. 
"""
val_a = get_value(model[a])
val_b = get_value(model[b])
val_c = get_value(model[c])
print(S.check())

"""
While the predicate fails with values from the current model. 
Add the existing values as a blocking clause ==> They must not occur since they dont satisfy

Keep checking for new models that z3 generates and see if the predicate is satisfied.
Add any new constraints that are needed to be added. 
"""
while (check_predicate(val_a, val_b, val_c) == False and S.check() == sat) :
    model = S.model()
    val_a = get_value(model[a])
    val_b = get_value(model[b])
    val_c = get_value(model[c])
    S.add(a != val_a)
    S.add(b != val_b)
    S.add(c != val_c)
    S.add(Distinct(a, b, c))
    
"""
Print the values of the model that satisfy the predicate. 
z3 has no way to learn the predicate it just learns from 
the conflict (a.k.a failure cases) that certain values 
of a, b and c are not possible. 
"""
print(val_a, val_b, val_c)
