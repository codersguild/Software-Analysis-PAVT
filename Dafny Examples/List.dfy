class List {
  var data: int;
  var next: List;
  ghost var ListNodes: set<List>;
  function IsAcyclic(): bool
    reads *;
    decreases ListNodes;
  {
    this in ListNodes &&
    (next != null ==>
      next.ListNodes <= ListNodes && this !in next.ListNodes &&
      next.IsAcyclic())
  }

  method Singleton(x: int) returns (list: List)
    ensures list != null && list.IsAcyclic();
  {
    list := new List;
    list.data := x;
    list.next := null;
    list.ListNodes := {list};
  }

  method Prepend(x: int, tail: List) returns (list: List)
    requires tail == null || tail.IsAcyclic();
    ensures list != null && list.IsAcyclic();
  {
    list := new List;
    list.data := x;
    list.next := tail;
    list.ListNodes := if tail == null then {list} else {list} + tail.ListNodes;
  }

  function Sum(): int
    requires IsAcyclic();
    reads *;
    decreases ListNodes;
  {
    if next == null then data else data + next.Sum()
  }
}
