class Fibonacci {
  function Fib(n: int): int
    decreases n;
  {
    if n < 2 then n else Fib(n-2) + Fib(n-1)
  }
}
