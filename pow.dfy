// Usual recursive definition of n^e
function method power(A:int, N:nat):int
{
	if (N==0) then 1 else A * power(A,N-1)
}

method pow(A:int, N:int) returns (x:int)
	requires N >= 0
	ensures x == power(A, N)
{
	x := 1;
	var i := N;

	while i != 0
		invariant x == power(A, (N-i))
	{ 
		x := x * A;
		i := i - 1;
	}
} 

method Main() {
	print power(2, 4);
}
