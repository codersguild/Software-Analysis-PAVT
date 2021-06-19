## https://theory.stanford.edu/~nikolaj/programmingz3.html#sec-using-solvers

from z3 import *
def nu_ab(R, x, y, a, b):
    x_ = [ Const("x_%d" %i, x[i].sort()) for i in range(len(x))]
    y_ = [ Const("y_%d" %i, y[i].sort()) for i in range(len(y))]
    return Or(Exists(y_, R(x+y_) != R(a+y_)), Exists(x_, R(x_+y) != R(x_+b)))

def isUnsat(fml):
    s = Solver(); s.add(fml); return unsat == s.check()

def lastSat(s, m, fmls):
    if len(fmls) == 0: return m
    s.push(); s.add(fmls[0])
    if s.check() == sat: m = lastSat(s, s.model(), fmls[1:])       
    s.pop(); return m

def mondec(R, variables):
    print(variables)
    phi = R(variables);    
    if len(variables)==1: return phi
    l = int(len(variables)/2)
    x, y = variables[0:l], variables[l:]
    def dec(nu, pi):
        if isUnsat(And(pi, phi)): 
           return BoolVal(False)
        if isUnsat(And(pi, Not(phi))): 
           return BoolVal(True)
        fmls = [BoolVal(True), phi, pi] 
        #try to extend nu
        m = lastSat(nu, None, fmls)              
        #nu must be consistent 
        assert(m != None)                         
        a = [ m.evaluate(z, True) for z in x ]
        b = [ m.evaluate(z, True) for z in y ]
        psi_ab = And(R(a+y), R(x+b))
        phi_a = mondec(lambda z: R(a+z), y)
        phi_b = mondec(lambda z: R(z+b), x)
        nu.push()
        #exclude: x~a and y~b
        nu.add(nu_ab(R, x, y, a, b))              
        t = dec(nu, And(pi, psi_ab)) 
        f = dec(nu, And(pi, Not(psi_ab)))
        nu.pop()
        return If(And(phi_a, phi_b), t, f)
    #nu is initially true
    return dec(Solver(), BoolVal(True))     
