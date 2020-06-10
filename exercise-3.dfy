// Exercise 3. Keeping the postconditions of Abs the same as above, change the body of Abs to just y := x + 2. 

// What precondition do you need to annotate the method with in order for the verification to go through?
// We need to use x == -1 as a pre-condition
// This is the only value for x that makes sense, given the post conditions (x < 0 ==> y == -x).

method Abs(x: int) returns (y: int)
	// Add a precondition here so that the method verifies.
	// Can't use y (return value) in pre-conditions
	requires x == -1
	// Don't change the postconditions.
	ensures 0 <= y
	ensures 0 <= x ==> x == y
	ensures x < 0 ==> y == -x
{
	y := x + 2;
}

// What precondition do you need if the body is y := x + 1?
// There doesn't exist such a pre-condition.
method Abs2(x: int) returns (y: int)
	// Add a precondition here so that the method verifies.
	// Don't change the postconditions.
	ensures 0 <= y
	ensures 0 <= x ==> x == y
	ensures x < 0 ==> y == -x
{
	y := x + 1;
}

// What does that precondition say about when you can call the method?
//
// If we assume that 0 <= x, then y = x + 1 means that x can never be == y
//
// So, we have to assume that x < 0.
// If x = -1, then y can't be = 1 since -1 + 1 = 0.
// If x = -2, then y can't be = 2 since -2 + 1 = -1.
// If x = -3, then y can't be = 3 since -3 + 1 = -2.
// In general, if x == -n, then we need to find an y s.t. -n + 1 = n.
// The only way this is possible if 2n = 1 => n = 1/2, but we are limited to ints.
