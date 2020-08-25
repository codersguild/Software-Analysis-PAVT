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

"""
How to save the assertions ? 
"""
def write_assertions(filename, solver) :
    with open(filename, mode="w") as out_file : 
        for (index, x) in enumerate(solver.assertions()) : 
            out_file.write(f"Solver Assertion {index} ==>\n{x}\n\n")
