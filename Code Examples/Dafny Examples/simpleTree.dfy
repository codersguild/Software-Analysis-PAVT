datatype Option<T> = None | Some(value : T)
datatype Tree = Leaf | Node(left : Tree, root : int, right : Tree)

predicate contains(t : Tree, v : int)
{
    match t
    case Leaf => false
    case Node(left, x, right) =>
        x == v || contains(left, v) || contains(right, v)
}

// Checks if a seq<int> [a] is sorted or not. 
// All elements at higher indices is greater than 
// or equal to (allow repeat) elements at lower indices.
predicate sorted (s: seq<int>)
{
   forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
}

predicate ordered (t : Tree)
	// ensures ordered(t) == sorted(treeToSeq(t))
	// No Method Calls
{
	match t 
	case Leaf => true // Leaf is always sorted.
	case Node(left, root, right) => 
		// Check for the left subtree, right subtree and 
		// the property of a BST for the root node.
		ordered(left) && ordered(right) && 
        (forall e :: contains(left, e) ==> e <= root) &&
        (forall e :: contains(right, e) ==> e > root)
		// Inductive Proofs
}

method treeToSeq (t : Tree) returns (s : seq<int>)
    ensures ordered(t) ==> sorted(s)
    ensures (forall i :: 0 <= i < |s| ==> contains(t, s[i]))
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

method Min(t : Tree) returns (m : Option<int>)
  requires ordered(t)
  ensures (t.Leaf?) <==> (m.None?) // tree empty.
  ensures (t.Node?) <==> (m.Some?) // tree non-empty, some value to be returned.
  ensures (t.Node?) ==> contains(t, m.value) // must return value from the tree.
  
  ensures (t.Node?) ==> 
	forall v :: contains(t, v) ==> v >= m.value; // m is minimum value in BST. Left-Most
    
  // Min element less than alll elements in the right subtrees  
  // of any node in the tree. 
  ensures (t.Node?) ==> 
	match t 
		case Node(left, x, right) => 
			(forall a :: contains(right, a) ==> m.value <= a)
{
    match t
    case Leaf => m := None;
    case Node(left, x, right) =>
      match left
		case Leaf => m := Some(x);
		case Node(left_subtree, root, right_subtree) => 
			m := Min(left);
}