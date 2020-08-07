!Ejercicio 9
!Recibo por stack un numero entero en complemento a 2 y devuelvo su valor absoluto

.begin
.org 2048
	
	ld [unNumero],%r1
	addcc %r14,-4,%r14
	st %r1,%r14
	call valorAbsoluto
	unNumero: -3
	resultado:0

valorAbsoluto:
	ld %r14,%r2
	addcc %r14,4,%r14
	
	addcc %r2,%r0,%r2

	bneg convertirAPositivo
	
	addcc %r2,%r0,%r3

	st %r3,[resultado]
	
	jmpl %r15+4,%r0	

convertirAPositivo:
	subcc %r0,%r2,%r3

	jmpl %r0+valorAbsoluto+24,%r0
.end
