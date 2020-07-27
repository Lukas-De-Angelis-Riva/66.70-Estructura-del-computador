
	.begin
	.org 2048
prog:	ld [x], %r1
	ld [y], %r2
	addcc %r15, %r0, %r30
	call sbradd
	jmpl %r30 + 4, %r0
x:	4
y:	9

!sbradd recibe los parametros a sumar desde %r1 y %r2, y en %r3 devuelve el valor de la suma.
sbradd:
	add %r1, %r2, %r3
	jmpl %r15 + 4, %r0
	
.end
