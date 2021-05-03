import z3
       
z3.set_option(
  precision=15,
  rational_to_decimal=True,
  max_args=10000000,
  max_lines=1000000,
  max_depth=10000000,
  max_visited=1000000,
)
    
def num(r):
    """
    Convert from Z3 to python float values.
    """
    return float(r.numerator_as_long()) / float(r.denominator_as_long())


def get_value(r):
    """
    Convert from Z3 to python values.
    """
    if z3.is_int_value(r):
        return r.as_long()
    elif z3.is_algebraic_value(r):
        return round(num(r.approx(15)), 10)
    elif z3.is_rational_value(r):
        return r.as_decimal(20)
    elif r is None:
        None
    else:
        return num(r)
      
# # https://z3prover.github.io/api/html/classz3py_1_1_rat_num_ref.html#a1012d6314d35530c58f9c018269ec867

