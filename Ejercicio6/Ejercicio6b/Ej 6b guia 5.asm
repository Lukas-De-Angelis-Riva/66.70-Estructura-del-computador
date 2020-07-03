!Ejercicio 6 b Guia 5 - Estructura del computador
!Hacer la suma de dos numeros llamando a una subrutina
!pasarle los numeros a traves del stack


.begin
.org 2048


	ld [primer_num],%r1		!cargo los numeros de memoria
	ld [segundo_num],%r2		!en los registros

	addcc %r14,-4,%r14		!resto 4 al stack pointer 

	st %r1,%r14			!guardo en memoria el primer numero

	addcc %r14,-4,%r14		!bajo el puntero del stack

	st %r2,%r14			!cargo el otro numero en la pila

	call sumar			!llamo a la subrutina

sumar:
	ld %r14,%r3			!cargo el numero al cual apunta el puntero
					!en memoria en el registro 3

	st %r0,%r14			!pongo en 0 el lugar al cual apunta el puntero
					!no seria necesario realmente

	addcc %r14+4,%r14		!subo el puntero del stack
	ld %r14,%r4			!cargo el valor al cual apunta el puntero
					!en el registro 4
		
	st %r0,%r14			!pongo en 0 el lugar al cual apunta el puntero
					!no seria necesario realmente

	addcc %r14+4,%r14		!subo el puntero del stack

	addcc %r3,%r4,%r5		!realizo la suma y el resultado lo guardo en %r5
	st %r5,[resultado]		!guardo el resultado en memoria
	
	jmpl %r15+4,%r0		!vuelvo a donde estaba

primer_num: 10			!numeros en memoria de usuario
segundo_num: 15 
resultado:0

.end

