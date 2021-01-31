from z3 import *

S = Solver()
a, b, c = Ints('a b c')

"""
How to save the assertions ? 
"""
def write_assertions(filename, solver) :
    with open(filename, mode="w") as out_file : 
        for (index, x) in enumerate(solver.assertions()) : 
            out_file.write(f"Solver Assertion {index} ==>\n{x}\n\n")
            
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
    
def check_predicate (x, y, z) : 
    if (x > 2) : 
        return True
    else : 
        return False
    
S.add(a > 0, b > 0, c > 0)

S.check()
model = S.model()

val_a = get_value(model[a])
val_b = get_value(model[b])
val_c = get_value(model[c])

constraint = (check_predicate(val_a, val_b, val_c) == True)
S.add(constraint)

print(S.check())
