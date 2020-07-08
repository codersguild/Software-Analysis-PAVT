// Exercise 7. Change the loop invariant to 0 <= i <= n+2. Does the loop still verify? 
// Does the assertion i == n after the loop still verify?

method m(n: nat)
{
	var i: int := 0;
	while i < n
		invariant 0 <= i <= n+2  
		// Change this. What happens?
		// If we change this from 0 <= i <= n to 0 <= i <= n + 2
		// then the Dafny cannot conclude the assertion i == n anymore.
		// From the loop guard we have that n <= i and i <= n + 2
		// As far as Dafny knows, it is possible that i somehow became much
		// larger than n at some point during the loop. All it knows after the
		// loop exits is that the loop guard failed, and the invariants hold.
		// In this case, this amounts to i <= n (loop guard) and i <= n+2 (loop invariant).
		// But this is not enough to guarantee that i == n, just that i <= n+2.
	{
		i := i + 1;
	}
	assert i <= n+2;
}
