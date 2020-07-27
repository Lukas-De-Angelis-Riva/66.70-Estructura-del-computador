!Ejercicio 15 Guia 5
!Escribir código que recibe a través de %r10 un número en punto flotante y devuelve su valor
!absoluto (también en punto flotante).

.begin
.org 2048

!Devuelve el valor absoluto en %r2
main:	
	sethi 0x1FFFFF,%r1		!cargo el primer registro con todos los bits siendo 1 menos el MSB,
	add %r1,0x3FF,%r1		! ese es 0
	andcc %r10,%r1,%r2		!al realizar AND con el registro que me dan (bit a bit)
					! queda el resultado en valor absoluto, ya que si es 0 y 0 -> 0
					! 0 y 1 -> 0 1 y 1 -> 1

	jmpl %r15+4,%r4			!vuelvo a quien llamo el programa


.end

