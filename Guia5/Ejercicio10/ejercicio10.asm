!Ejercicio 10
!Recibo por stack 2 numeros en complemento a 2 y determino si al sumarlos se pueden representar en 32bits

.begin
.org 2048
	
	ld [unNumero],%r1
	addcc %r14,-4,%r14
	st %r1,%r14

	ld [otroNumero],%r2
	addcc %r14,-4,%r14
	st %r2,%r14
	
	call esRepresentable

	unNumero: 2147483647
	otroNumero: 1
	puedoRepresentar:0
	noPuedoRepresentar:-1

esRepresentable:

	ld %r14,%r3
	addcc %r14,4,%r14

	ld %r14,%r4
	addcc %r14,4,%r14
	
	addcc %r3,%r4,%r5

	bvs noRepresentable
	
	bvc Representable
		
noRepresentable:
	ld [noPuedoRepresentar],%r6
	jmpl %r15+4,%r0

Representable:
	ld [puedoRepresentar],%r6
	jmpl %r15+4,%r0
.end
