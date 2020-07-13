


	.begin
	.org 2048


	ld [x], %r10
	call absIEEE
	ba 0

x:	CA23CD01h
	.end





	.begin

absIEEE:
	
	ld [0En32], %r1
	and %r1, %r10, %r10				! Hago un and para poner en 0 el bit más significativo, venga lo que venga.
	jmpl %r15 + 4, %r0

0En32:	7FFFFFFFh					! Representa el 0111 1111 1111 1111 1111 1111 1111 1111
	.end
