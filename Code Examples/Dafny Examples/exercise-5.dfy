// Exercise 5. Change your test method from Exercise 4 to capture the value of max to a variable, 
// then do the checks from Exercise 4 using the variable. 
// Dafny will reject this program because you are calling max from real code. 
// Fix this problem using a function method.
// One caveat of functions is that not only can they appear in annotations
// they can only appear in annotations.
function method max(a: int, b: int) : int 
{
	if a < b then b else a
}

method Testing(a : int, b : int)
{
	assert max(1, 2) == 2;
	var v := max(1, 2);
	assert v == 2;
}
