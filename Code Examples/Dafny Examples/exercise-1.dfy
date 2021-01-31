// Exercise 1. Write a test method that calls your Max method from Exercise 0 and then asserts something about the result.

// use definition of Max() from before.
method Testing()
{
	var v := Max(3, 5);
	// Assertions use the pre/post-conditions to simplify
	// We don't care at all what happens inside each method
	// when we call it, as long as it satisfies its annotations.
	assert v == 5;
}
