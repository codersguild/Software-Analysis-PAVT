// Exercise 13. Modify the definition of the sorted predicate so that it returns true 
// exactly when the array is sorted and all its elements are distinct.

predicate sorted(a: array<int>)
   reads a
{
   forall j, k :: 0 <= j < k < a.Length ==> a[j] < a[k]
}
