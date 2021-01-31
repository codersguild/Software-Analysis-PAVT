class Example {
  method M(n: int)
  {
    var i := 0;
    while (i < n)
      decreases n - i;
    {
      i := i + 1;
    }
  }
}
