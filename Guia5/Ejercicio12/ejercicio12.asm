!Ejercicio 12
!Implementacion de la multiplicacion

.begin
.org 2048
	
	ld [unNumero],%r1
	addcc %r14,-4,%r14
	st %r1,%r14

	ld [otroNumero],%r2
	addcc %r14,-4,%r14
	st %r2,%r14

	add %r15,%r0,%r16
	
	call multiplicar

	jmpl %r16+4,%r0	

	unNumero: 123
	otroNumero: -2	
	noPuedoRepresentar:-1

multiplicar:

	ld %r14,%r3
	addcc %r14,4,%r14

	ld %r14,%r4
	addcc %r14,4,%r14
	
	addcc %r4,%r0,%r5
	
	bneg multiplicoNegativos
	ba multiplicoPositivos

multiplicoNegativos:
	addcc %r3,%r6,%r6
	bvs noRepresentable
	addcc %r5,1,%r5
	be terminoMultiplicacionNegativos
	ba multiplicoNegativos

multiplicoPositivos:
	addcc %r3,%r6,%r6
	bvs noRepresentable
	addcc %r5,-1,%r5
	be terminoMultiplicacion
	ba multiplicoPositivos

terminoMultiplicacion:
	jmpl %r16+4,%r0

terminoMultiplicacionNegativos:
	sub %r0,%r6,%r6
	jmpl %r16+4,%r0
		
noRepresentable:
	ld [noPuedoRepresentar],%r7
	jmpl %r16+4,%r0


.end
