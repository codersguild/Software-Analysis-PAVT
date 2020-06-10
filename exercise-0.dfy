// Exercise 0. Write a method Max that takes two integer 
// parameters and returns their maximum. 
// Add appropriate annotations and make sure your code verifies.

method Max (a: int, b: int) returns (c: int)
	ensures a >= b ==> c == a
	ensures a < a ==> c != a && c == b
{
	if (a >= b) {
		c := a;
	} else {
		c := b;
	}
}