// Exercise 15. Change the assignments in the body of BinarySearch 
// to set low to mid or to set high to mid - 1. In each case, what goes wrong?

predicate sorted(a: array?<int>)
	requires a != null
	reads a
{
	forall j, k :: 0 <= j < k < a.Length ==> a[j] <= a[k]
}

method BinarySearch(a: array?<int>, value: int) returns (index: int)
	requires a != null && 0 <= a.Length && sorted(a)
	ensures 0 <= index ==> index < a.Length && a[index] == value
	ensures index < 0 ==> forall k :: 0 <= k < a.Length ==> a[k] != value
{
	var low, high := 0, a.Length;
	while low < high
		invariant 0 <= low <= high <= a.Length
		invariant forall i ::
			0 <= i < a.Length && !(low <= i < high) ==> a[i] != value
	{
		var mid := (low + high) / 2;
		if a[mid] < value
		{
			low := mid + 1;
			// low := mid;
			// This causes a compilation error on having no decreasing argument
		}
		else if value < a[mid]
		{
			high := mid;
			// high := mid - 1;
			// This causes a compilation error due to invariants not holding
			// setting high = (low + high) / 2 - 1 doesn't imply 0 <= low <= high <= a.Length
		}
		else
		{
			return mid;
		}
	}
	return -1;
}
