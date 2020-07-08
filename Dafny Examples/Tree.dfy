datatype Option<T> = None | Some(value : T)
datatype Tree = Leaf | Node(left : Tree, root : int, right : Tree)

// https://rise4fun.com/Dafny/YM6v
// https://rise4fun.com/Dafny/5slex1
// https://rise4fun.com/Dafny/5vwV
// Can there be repeats in the Binary Search tree Case?  (Element repeating more than once.) ==> Yes.
// Try doing some Inductive Proofs on Tree like we do for Lists.

// Checks if a seq<int> [a] is sorted or not. 
// All elements at higher indices is greater than 
// or equal to (allow repeat) elements at lower indices.
predicate sorted (s: seq<int>)
{
   forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
}

// Stronger Check that sequence is indeed sorted.
// Comparing adjecent elements to show sortedness. 
method SortedCheck (s : seq<int>) returns (y : bool)
	requires sorted(s) 
	ensures y == true <==> y == sorted(s)
	ensures y == false <==> y != sorted(s)
{
	var i := 0;
	while i < |s| - 1
		decreases |s| - i;
		invariant 0 <= i <= |s|
	{
		assert s[i] <= s [i + 1];
		i := i + 1;
	}
}

// Checks if Binary Tree contains element "v".
function Contains(t : Tree, v : int) : bool
{
    match t
    case Leaf => false
    case Node(left, x, right) =>
        x == v || Contains(left, v) || Contains(right, v)
}

// Computes the size of the Binary Tree.
// Excludes counting the leaves.
function Size (t : Tree) : nat 
	ensures (t.Node?) ==> Size(t) >= 0 // If tree contains atleast one node, size > 0;
	ensures (t.Leaf?) ==> Size(t) == 0 // If tree is empty (contains leaf only), size == 0;
{
	match t
	case Leaf => 0
	case Node(left, x, right) => 1 + Size(left) + Size(right)
}

// Finds the number of occurances (frequency) of an 
// element in the Binary Tree.  
function Count(t : Tree, v : int) : nat
	// Count of element is always greater than or equal to zero. 
	ensures Count(t, v) >= 0; 
	// If the count is Zero ==> The element does not exist in the tree.
	ensures Count(t, v) == 0 ==> forall x :: (x in traversal(t) ==> x != v)
{
	match t 
		case Leaf => 0
		case Node(left, x, right) =>
			if (x == v) 
				then 1 + Count(left, v) + Count(right, v)
			else 
				Count(left, v) + Count(right, v)
}

// This lemma is correct.
lemma Lemma_CountEquivContains(t : Tree, v : int)
	// If Tree contains element, count is more than zero. 
	ensures Contains(t, v) <==> (Count(t, v) > 0)
	// If the Count of an element is zero, tree does not contain it. 
	ensures Count(t, v) == 0 <==> Contains(t, v) == false
{
	// P <==> Q ==> {P ==> Q} && {Q ==> P}
    assert Contains(t, v) ==> (Count(t, v) > 0) && (Count(t, v) > 0) ==> Contains(t, v);
	assert !Contains(t, v) ==> (Count(t, v) == 0) && (Count(t, v) == 0) ==> !Contains(t, v);
}

/*
method Insert(t : Tree, v : int) returns (tp : Tree)
  requires Ordered(t)
  ensures Ordered(tp)
  ensures Count(tp, v) > 0 // Inserted if not already existing.
  ensures Count(t, v) > 0 <==> Count(tp, v) >= Count(t, v) // Elements in the tree may repeat. 
  ensures Count(tp, v) > 0 <==> Count(tp, v) >= Count(t, v) // Occurance of v must be more now. 
  ensures Count(tp, v) > 0 <==> Size(tp) >= Size(t) // Insert increases tree Size
  // TODO: Add additional post-conditions here.
{
	
}
*/

/*
method Remove(t : Tree, v : int) returns (tp : Tree)
  requires Ordered(t)
  ensures Ordered(tp)
  ensures Count(tp, v) == 0 // All occurances are removed.
  ensures Count(t, v) > 0 ==> Count(tp, v) == 0 // Since the element was present earlier, all occurances were defintely removed.
  ensures Count(t, v) > 0 ==> Size(tp) < Size(t) // Size of the tree decreases.
  // A condition with Min() also comes in. 
  // TODO: State remaining post-conditions. 
{
	
}
*/

// In-Order Traversal of a Binary Tree.
// Gives Seq of Options<T> from Tree.
function traversal (t : Tree) : seq<int> 
	ensures |traversal(t)| == Size(t)
{
	match t 
		case Leaf => []
		case Node(left, x, right) => 
			traversal(left) + [x] + traversal(right)
}

// In-order Traversal of a Binary Tree 
// Converts to seq of Ints.
method treeToSeq (t : Tree) returns (s : seq<int>)
    ensures Ordered(t) ==> sorted(s)
    ensures (forall i :: 0 <= i < |s| ==> Contains(t, s[i]))
    decreases t
{
	match t
	case Leaf => 
        s := [];
	case Node(left, x, right) => 
        var ls := treeToSeq(left);
        var rs := treeToSeq(right);
		s := ls + [x] + rs;
		// Check if s holds BST Property.
		// ls ==> BST
		// rs ==> BST
		// Does not mean s ==> Will be BST.
} 

predicate recursiveOrdered (t : Tree)
	// ensures recursiveOrdered(t) == sorted(treeToSeq(t))
{
	match t 
	case Leaf => true // Leaf is always sorted.
	case Node(left, root, right) => 
		// Check for the left subtree, right subtree and 
		// the property of a BST for the root node.
		recursiveOrdered(left) && recursiveOrdered(right) && CheckOrder(left, root, right)
}

// Primary Property of a BST.
// All elements to the right ==> root < right_elems;
// All elements to the left ==> root >= left_elems;
predicate CheckOrder (left_subtree : Tree, root : int, right_subtree : Tree)
{
	(forall elems :: Contains(left_subtree, elems) ==> elems <= root) &&
	(forall elems :: Contains(right_subtree, elems) ==> elems > root)
}

predicate Ordered (t : Tree)
	// ensures ordered(t) == sorted(treeToSeq(t))
	// No Method Calls
{
	match t 
	case Leaf => true // Leaf is always sorted.
	case Node(left, root, right) => 
		// Check for the left subtree, right subtree and 
		// the property of a BST for the root node.
		Ordered(left) && Ordered(right) && 
        (forall e :: Contains(left, e) ==> e <= root) &&
        (forall e :: Contains(right, e) ==> e > root)
		// Inductive Proofs
}

// Find the minimum element in the BST.
method Min(t : Tree) returns (m : Option<int>)
  requires Ordered(t)
  ensures (t.Leaf?) <==> (m.None?) // tree empty.
  ensures (t.Node?) <==> (m.Some?) // tree non-empty, some value to be returned.
  ensures (t.Node?) ==> Contains(t, m.value) // must return value from the tree.

  // m is minimum value in BST. Left-Most
  ensures (t.Node?) ==> 
	forall v :: Contains(t, v) ==> v >= m.value;

  // Min element less than alll elements in the right subtrees  
  // of any node in the tree. 
  ensures (t.Node?) ==> 
	match t 
		case Node(left, x, right) => 
			(forall a :: Contains(right, a) ==> m.value <= a)	
{
    match t
    case Leaf => m := None;
    case Node(left, x, right) =>
      match left
		case Leaf => m := Some(x);
		case Node(left_subtree, root, right_subtree) => 
			m := Min(left);
}