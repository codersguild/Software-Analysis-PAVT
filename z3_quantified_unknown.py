from z3 import *

x, y, z = Reals('x y z')
m, n, l = Reals('m n l')
u, v = Ints('u v')

S = SolverFor("NRA")

S.add(x >= 0)
S.add(y >= 30, z <= 50)
S.add(m >= 5, n >= 5)
S.add(m * x + n * y + l > 300)
print(S.check())
print(S.model())

S.add(ForAll((u, v), Implies(m * u + n * v + l > 400, u + v + z <= 100)))

print(S.check())
print(S.reason_unknown())
print(S.sexpr())
