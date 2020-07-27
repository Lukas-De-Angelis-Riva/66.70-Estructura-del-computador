!Ejercicio 18 Guia 5
!Escribir una rutina que lee del stack un valor de 32 bits, cuenta la cantidad de 1´s comprendidos
!en su representación binaria y devuelve ese valor por stack.

.begin
.org 2048

!me viene el numero por la pila, para probar agregarlo ahi y cambiar el tope a -4
main:	ld %r14,%r9
	addcc %r14,4,%r14
	
					!%r11 guarda el contenido de lo desplazado
					!%r12 se usa de forma temporal para ver si es un 1
loop:	sll %r9,%r2,%r11		!corro a la izquierda para sacarme los bits de ese lado, %r2 empieza en 0
	srl %r11,31,%r11		!acomodo a la derecha para ver si es 1
	subcc %r11,1,%r11		

	add %r2,1,%r2			!actualizo el corrimiento a izquierda
	
	be hay_uno			!si hay uno lo agrego con este branch
	subcc %r2,32,%r3		!veo de no pasarme de 32 bits que es el maximo
	be fin				!termina o vuelve al loop dependiendo el caso
	ba loop


hay_uno:add %r10,1,%r10			!agrego al contador que hay un 1
	 subcc %r2,32,%r3		!veo de no pasarme devuelta
	 be fin
	 ba loop


fin:	addcc %r14,-4,%r14		!devuelvo por la pila y hago return a quien llamo el programa
	st %r10,%r14
	jmpl %r15+4,%r0

.end

