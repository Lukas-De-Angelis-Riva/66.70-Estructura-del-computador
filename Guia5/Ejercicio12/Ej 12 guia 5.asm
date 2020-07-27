!Ejercicio 12 Guia 5 
!La multiplicación no forma parte de las operaciones aritméticas incluidas en el set de
!instrucciones ARC. Escriba una subrutina que recibe por la pila los números a multiplicar y
!devuelve por la pila su producto (la multiplicación no necesariamente debe ser implementada
!siguiendo un método óptimo). En caso de que el producto de ambos números no pueda ser
!representado en 32 bits, la subrutina devuelve -1.

.begin
.org 2048

main:  ld [x],%r30				!cargo los numeros a multiplicar
	add %r14,-4,%r14			!y los paso a la pila usando
	st %r30,%r14				!el registro 30

	ld [y],%r30
	add %r14,-4,%r14
	st %r30,%r14
	
	add %r15,%r0,%r16			!me guardo la posicion de quien llamo al programa
	call multiplicar			!llamo a la subrutina
	jmpl %r16+4,%r0			!termino el programa


!Subrutina multiplicar, usa los registros 1,2,3 y 4
multiplicar:	ld %r14,%r1				!cargo los numeros en los registros 1 y 2
		add %r14,4,%r14

		ld %r14,%r2
		add %r14,4,%r14

		addcc %r2,%r0, %r3			!copio uno de los numeros a multiplicar para usarlo
		bneg multiplico_negativos		!como guia de cuantas veces falta hacer la suma
		ba multiplico_positivos

multiplico_positivos:addcc %r1,%r4,%r4			!voy sumando el primer numero al registro que acumula el total
			bvs no_es_representable		!si hay overflow salta en este branch
			addcc %r3,-1,%r3		!resto uno al contador de veces para multiplicar
			be termino_multiplicacion	!si la resta da 0, ya no hay que multiplicar
			ba multiplico_positivos

multiplico_negativos:addcc %r1,%r4,%r4			!voy sumando el primer numero al registro que acumula el total
			bvs no_es_representable		!si hay overflow salta en este branch
			addcc %r3,1,%r3			!resto uno al contador de veces para multiplicar
			be termino_multiplicacion_n	!si la resta da 0, ya no hay que multiplicar
			ba multiplico_negativos


termino_multiplicacion:	add %r14,-4,%r14		!guardo en la pila el numero y hago return
				st %r4,%r14
				jmpl %r15+4,%r0

termino_multiplicacion_n:	add %r14,-4,%r14	!guardo en la pila el numero y hago return
				sub %r0,%r4,%r4
				st %r4,%r14
				jmpl %r15+4,%r0

no_es_representable:	addcc %r0,-1,%r4		!guardo -1 si no se pudo representar en 32 bits
			st %r4,%r14

x: -7							!numeros a multiplicar
y: -2

.end
