


	.begin
	.org 2048
	ld [stack], %r1
	add %r1, %r0, %r14

	ld [x], %r1
	st %r1, %r14
	
	add %r15, %r0, %r31
	call cuadrado
	jmpl %r31 + 4, %r0


stack: 20000
x: 10
	.end



! Recibe un numero por el stack y devuelve por este el valor de su cuadrado.
	.begin
cuadrado:
	add %r15, %r0, %r30
	ld %r14, %r1
	add %r14, -4, %r14
	st %r1, %r14
	call multiplicar
	jmpl %r30 + 4, %r0
	.end












.begin
.org 3000

multiplicar:	ld %r14,%r1				!cargo los numeros en los registros 1 y 2
		add %r14,4,%r14

		ld %r14,%r2
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
.end

