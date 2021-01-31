// https://rise4fun.com/Dafny/5vwV
datatype Option<T> = None | Some(value : T)
datatype Tree = Leaf | Node(left : Tree, root : int, right : Tree)

predicate contains(t : Tree, v : int)
{
    match t
    case Leaf => false
    case Node(left, x, right) =>
        x == v || contains(left, v) || contains(right, v)
}

predicate sorted (s: seq<int>)
{
   forall i, j :: 0 <= i < j < |s| ==> s[i] <= s[j]
}

predicate ordered (t : Tree)
	// ensures ordered(t) == sorted(treeToSeq(t))
{
	match t 
	case Leaf => true // Leaf is always sorted.
	case Node(left, root, right) => 
		// Check for the left subtree, right subtree and 
		// the property of a BST for the root node.
		ordered(left) && ordered(right) && 
        (forall e :: contains(left, e) ==> e <= root) &&
        (forall e :: contains(right, e) ==> e > root)
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
} 

method Min(t : Tree) returns (m : Option<int>)
  requires ordered(t)
  ensures (t.Leaf?) <==> (m.None?) // tree empty.
  ensures (t.Node?) <==> (m.Some?) // tree non-empty, some value to be returned.
  ensures (t.Node?) ==> contains(t, m.value) // must return value from the tree.
  
  ensures (t.Node?) ==> 
	forall v :: contains(t, v) ==> v >= m.value; // m is minimum value in BST. Left-Most

  // TODO: Add additional post-conditions here.
{
    match t
    case Leaf => m := None;
    case Node(left, x, right) =>
      match left
		case Leaf => m := Some(x);
		case Node(left_subtree, root, right_subtree) => 
			m := Min(left);
}
