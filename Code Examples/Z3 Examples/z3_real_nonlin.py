import z3
w s = z3.Real("w_sym s_sym")

S = z3.Solver()
S.add(w * s == 6)
S.set("timeout", 5000)

if S.check() == z3.sat 
  m = S.model()
  
  w_frac = m[w].as_fraction()
  value = float((w_frac.numerator)) / float(
      (w_frac.denominator)
  )
  
  print("\t%s = %.10f\n" % (w, round(value, 10)))
  
  s_frac = m[s].as_fraction()
  value = float((s_frac.numerator)) / float(
      (s_frac.denominator)
  )
  
  print("\t%s = %.10f\n" % (s, round(value, 10)))

  # Write to a file 
  # fileptr.write(f"{round(value, 10):.10f}\n")
