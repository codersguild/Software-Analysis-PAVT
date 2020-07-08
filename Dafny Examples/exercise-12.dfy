// Exercise 12. Write a method that takes an integer array, which it requires to have at least one element, 
// and returns an index to the maximum of the array's elements. 
// Annotate the method with pre- and postconditions that state the intent of the method, 
// and annotate its body with loop invariant to verify it.

method FindMax(a: array<int>) returns (max: int)
	requires 0 < a.Length
	ensures forall k :: 0 < k < a.Length ==> max >= a[k]
	ensures exists k :: 0 < k < a.Length ==> max == a[k]
{
	var index := 0;
	max := a[0]; // assume first is max
	while index < a.Length
		invariant 0 <= index <= a.Length
		invariant forall k :: 0 <= k < index ==> max >= a[k]
	{
		if a[index] >= max { max := a[index]; }
		index := index + 1;
	}
}
