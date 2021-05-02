from z3 import *

n, y = z3.Ints("n y")
prob = z3.Real("prob")

optimizer = z3.Optimize()
optimizer.set("timeout", 1000)

optimizer.add(1 <= n)
optimizer.add(n <= 1000)
optimizer.add(1 <= y)
optimizer.add(y <= 100)

optimizer.add(0.00001 <= prob)
optimizer.add(prob <= 1)

optimizer.maximize(5 * y - prob * n * y)

print(optimizer.check())
print(optimizer.model())
