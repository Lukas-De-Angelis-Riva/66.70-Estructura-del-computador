.begin

bla:	ld  %r1, 3020, %r5
       st  %r5, %r1 + 4
	sub %r1, 4, %r1
	be blu
	subcc %r1, 0, %r0
	ba bla
blu:
.end
