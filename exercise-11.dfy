// Exercise 11. In the loop above, the invariant i <= n and the negation of the 
// loop guard allow us to conclude i == n after the loop (as we checked previously with an assert. 
// Note that if the loop guard were instead written as i != n (as in Exercise 8), then the negation of the guard 
// immediately gives i == n after the loop, regardless of the loop invariant. 
// Change the loop guard to i != n and delete the invariant annotation. Does the program verify? What happened?

method m()
{
	var i, n := 0, 20;
	while i != n
		invariant 0 <= i <= n
		// If we comment out the invariant, Dafny cannot conclude that
		// 0 <= n - i, i.e. that the decreasing argument is bound below by 0
		decreases n - i
	{
		i := i + 1;
	}
}
