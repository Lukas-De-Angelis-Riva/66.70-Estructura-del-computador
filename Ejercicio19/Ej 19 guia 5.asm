!Ejercicio 19 Guia 5
!Escribir un programa que determine la cantidad total de 1`s comprendidos en las representaciones
!binarias de todos los valores guardados en un arreglo cuyo largo y dirección de inicio son
!conocidos (estos llegan a través de la pila). Se espera que el código invoque la subrutina escrita
!como respuesta al punto 18.

.begin
.org 2048
array: .dwb 20
	
main:	add %r1,20,%r1					!uso %r1 como contador, para saber en donde estoy en el array
	
recorrer_array:	ld %r29+array,%r30			!cargo el numero del array
		
			add %r14,-4,%r14
			st %r30,%r14			!lo guardo en la pila

			subcc %r1,1,%r1			!resto 1 al indice del array
			be termino_array		!termina el programa

			add %r29,4,%r29			!me muevo 4 en el array para la siguiente iteracion

			call contar_unos		!llamo a la subrutina
			
			ld %r14,%r31
			add %r14,4,%r14
			add %r5,%r31,%r5		!agrego los 1 del numero en esa parte del array al total
			ba recorrer_array

termino_array: halt

.end

.begin
.org 2200

!uso %r9,%r2,%r10,%r11,%r3

!me viene el numero por la pila, para probar agregarlo ahi y cambiar el tope a -4
contar_unos:	ld %r14,%r9
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
	add %r0,%r0,%r9			!limpio lo que tengan los registros que use en esta subrutina
	add %r0,%r0,%r2
	add %r0,%r0,%r10
	add %r0,%r0,%r11
	add %r0,%r0,%r3
	jmpl %r15+4,%r0

.end


