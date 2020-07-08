// Exercise 2. Using a precondition, change Abs to say it can only be called on negative values. 
// Simplify the body of Abs into just one return statement and make sure the method still verifies.

method Abs(x: int) returns (y: int)
	// Add a precondition here.
	requires x < 0
	ensures 0 <= y
	ensures 0 <= x ==> x == y
	ensures x < 0 ==> y == -x
{
	// Simplify the body to just one return statement
	//if x < 0
		{ return -x; }
	//else
	//	{ return x; }
}