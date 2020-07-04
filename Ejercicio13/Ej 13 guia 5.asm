!Ejercicio 13 Guia 5
!Proponer una rutina que recibe un número entero en el rango de 1 a 10 y devuelve su factorial o
!bien devuelve -1 en caso de que el número recibido se encuentre fuera del rango indicado.

!Factorial maximo 12, despues de eso va a haber overflow

.begin
.org 2048

				ld [x],%r29					!cargo el numero a usar
				addcc %r29,%r0,%r30				!analizo los casos borde
				be factorial_limite
	
				sub %r29,1,%r30					!consigo el anterior del numero si no es 0
				
factorial:			add %r14,-4,%r14				!guardo los numeros que se van a multiplicar en esta iteracion
				st %r30,%r14					!en la pila

				add %r14,-4,%r14
				st %r29,%r14

				call multiplicar				!llamo a la subrutina multiplicar

				ld %r14,%r29					!cargo el acumulado en esta iteracion
				add %r14,4,%r14

				subcc %r30,1,%r30				!consigo el numero anterior
				be termino_factorial
									
				ba factorial					!vuelvo por si falta

termino_factorial:		add %r14,-4,%r14				
				st %r29,%r14
				halt						!termino el programa

factorial_limite:		add %r29,1,%r29					!guardo el factorial de 0
				add %r14,-4,%r14				
				st %r29,%r14
				halt						!termino el programa

!Subrutina multiplicar, usa los registros 1,2,3 y 4
multiplicar:			ld %r14,%r1					!cargo los numeros en los registros 1 y 2
				add %r14,4,%r14

				ld %r14,%r2
				add %r14,4,%r14

				addcc %r2,%r0, %r3				!copio uno de los numeros a multiplicar para usarlo
				ba multiplico_positivos				!como guia de cuantas veces falta hacer la suma
				

multiplico_positivos:	addcc %r1,%r4,%r4					!voy sumando el primer numero al registro que acumula el total
				addcc %r3,-1,%r3				!resto uno al contador de veces para multiplicar
				be termino_multiplicacion			!si la resta da 0, ya no hay que multiplicar
				ba multiplico_positivos

termino_multiplicacion:	add %r14,-4,%r14					!guardo en la pila el numero y hago return
				st %r4,%r14
				add %r0,%r0,%r1					!limpio los registros que use
				add %r0,%r0,%r2
				add %r0,%r0,%r3
				add %r0,%r0,%r4
				jmpl %r15+4,%r0


x: 10										!numeros del factorial


.end

