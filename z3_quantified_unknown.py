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

S = SolverFor("NRA")

S.add(x >= 0)
S.add(y >= 30, z <= 50)
S.add(m >= 5, n >= 5)
S.add(m * x + n * y + l > 300)

S.add(ForAll([u, v], Implies(m * u + n * v + l > 300, u + v + z <= 50)))

print(S.check())
print(S.sexpr())

print(S.to_smt2())

"""
(set-logic ALL)
(set-option :produce-models true)
(declare-fun x () Real)
(declare-fun y () Real)
(declare-fun z () Real)
(declare-fun m () Real)
(declare-fun n () Real)
(declare-fun l () Real)
(assert (>= x 0.0))
(assert (>= y 30.0))
(assert (<= z 50.0))
(assert (>= m 5.0))
(assert (>= n 5.0))
(assert (not (<= (+ (* m x) (* n y) l) 300.0)))
(assert (forall ((u Int) (v Int))
  (let ((a!1 (<= (+ (* m (to_real u)) (* n (to_real v)) l) 300.0)))
    (or (<= (+ (to_real u) (to_real v) z) 50.0) a!1))))
(check-sat)
(get-model)
"""

"""
(set-logic ALL)
(set-option :produce-models true)
(declare-fun x () Real)
(declare-fun y () Real)
(declare-fun z () Real)
(declare-fun m () Real)
(declare-fun n () Real)
(declare-fun l () Real)
(assert
 (>= x 0.0))
(assert
 (>= y 30.0))
(assert
 (<= z 50.0))
(assert
 (>= m 5.0))
(assert
 (>= n 5.0))
(assert
 (not (<= (+ (* m x) (* n y) l) 300.0)))
(assert
 (forall ((u Int) (v Int) )(or (<= (+ (to_real u) (to_real v) z) 50.0) (<= (+ (* m (to_real u)) (* n (to_real v)) l) 300.0)))
 )
(check-sat)
(get-model)
"""
