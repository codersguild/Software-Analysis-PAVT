"""
New Problem
"""
x, y, z = Bools('x y z')

nS = Solver()

def bool_predicate (x, y, z) : 
    return Or(And(x, y), z)

nS.add(And(x, y, z))

print(nS.check())
print(nS.model())
