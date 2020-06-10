class Ackermann {
  function F(m: int, n: int): int
    decreases m, n;
  {
    if m <= 0 then
      n + 1
    else if n <= 0 then
      F(m - 1, 1)
    else
      F(m - 1, F(m, n - 1))
  }
}
