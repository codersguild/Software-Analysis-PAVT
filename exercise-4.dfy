// Exercise 4. Write a function max that returns the larger of two given integer parameters. 
// Write a test method using an assert that checks that your function is correct.

// Unlike a method, which can have all sorts of statements in its body,
// a function body must consist of exactly one expression, with the correct type.
function max (a: int, b: int) : int 
{
	// Fill in an expression here.
	if a < b then b else a
}

method Testing() {
	// Add assertions to check max here.
	assert max(1, 2) == 2;
}