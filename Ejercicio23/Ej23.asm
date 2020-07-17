	.begin

loop:
	ld [reg1], %r1
	ld [reg2], %r2

	ld %r1, %r1
	ld %r2, %r2

	and %r1, 0000000fh, %r1
	sub %r1, 80, %r0
	neg %r1, %r1
	addcc %r0, %r1, %r0
	bneg prenderLed

	ba loop

prenderLed:
	sethi 100000h, %r1
	or %r2, %r1, %r2
	ld [reg2], %r1
	st %r2, %r1
fin:	ba fin


reg1:	90001d00h
reg2:	90001d04h

	.end
