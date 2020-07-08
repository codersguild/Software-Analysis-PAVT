// Exercise 8. With the original loop invariant, change the loop guard from i < n to i != n. 
// Do the loop and the assertion after the loop still verify? Why or why not?
method m(n: nat)
{
	var i: int := 0;
	while i != n  // Change this. What happens?
	// The assertion still holds, since we have that i <= n and i == n, so
	// Dafny can conclude that i == n.
		invariant 0 <= i <= n
	{
		i := i + 1;
	}
	assert i == n;
}