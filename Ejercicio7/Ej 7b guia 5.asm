!Ejericio 7 b Guia 5
!igual al anterior solamente que en distintos modulos el sumar y el programa principal
 

.begin		
.org 2048
	
	ld [primer_num],%r1		!cargo de memoria los numeros
	ld [segundo_num],%r2

	addcc %r14,-4,%r14		!resto 4 al puntero del stack
	st %r1,%r14			!guardo el primer numero en el stack
	addcc %r14,-4,%r14		!muevo devuelta el puntero
	st %r2,%r14			!guardo el segundo numero en el stack

	call sumar			!llamo a la subrutina sumar

primer_num:10				!numeros en memoria
segundo_num:5
resultado:0	

.end	


.begin				
.org 2400				!en otra posicion de memoria el modulo de suma

sumar: ld %r14,%r3			!cargo el elemento que esta al tope de la pila
	addcc %r14,4,%r14		!muevo el puntero
	ld %r14,%r4			!repito los mismos pasos
	addcc %r14,4,%r14		

	addcc %r3,%r4,%r5		!sumo los numeros
	st %r5,[resultado]		!guardo el resultado en memoria
	jmpl %r15+4,%r0			!return
					!termina este modulo
.end

