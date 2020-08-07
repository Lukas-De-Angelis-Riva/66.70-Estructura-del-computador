!Ejercicio 14 
!Proponer una rutina que recibe un número entero y devuelve el cuadrado del mismo. 
!En caso de que el resultado no pueda ser representado con 32 bits debe devolver -1.

.begin
.org 2048
	
	ld [unNumero],%r30
	add %r14,-4,%r14
	st %r30,%r14

	add %r15,%r0,%r16
	call cuadrado
	jmpl %r16,4,%r0
	
	unNumero: -5	
	noPuedoRepresentar:-1

cuadrado: 
	ld %r14,%r1
	add %r14,4,%r14

	addcc %r1,%r0,%r3
	bneg cuadradoNegativo
	ba cuadradoPositivo

cuadradoPositivo:
	addcc %r1,%r2,%r2
	bvs noRepresentable
	addcc %r3,-1,%r3
	be terminoCuadrado
	ba cuadradoPositivo

cuadradoNegativo:
	addcc %r1,%r2,%r2
	bvs noRepresentable
	addcc %r3,1,%r3
	be terminoCuadradoNegativo
	ba cuadradoNegativo

terminoCuadrado:
	jmpl %r15+4,%r0

terminoCuadradoNegativo:
	sub %r0,%r2,%r2
	jmpl %r15+4,%r0
		
noRepresentable:
	ld [noPuedoRepresentar],%r4
	jmpl %r15+4,%r0

.end

