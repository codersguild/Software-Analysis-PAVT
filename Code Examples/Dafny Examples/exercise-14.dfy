// Exercise 14. What happens if you remove the precondition a != null? 
// Change the definition of sorted so that it allows its argument to be null but returns false if it is.

predicate sorted(a: array?<int>)
   reads a
{
   // Change this definition to treat null arrays as "not sorted".
   // (i.e. return false for null arrays)
   a == null ==> false
   &&
   forall j, k :: 0 <= j < k < a.Length ==> a[j] == a[k] 
}
