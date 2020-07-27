!Ejercicio 14 Guia 5 
!Proponer una rutina que recibe un número entero y devuelve el cuadrado del mismo. 
!En caso de que el resultado no pueda ser representado con 32 bits debe devolver -1.

.begin
.org 2048

main:   ld [x],%r30					!cargo el numero del cuadrado
	add %r14,-4,%r14				!y los paso a la pila usando
	st %r30,%r14					!el registro 30
	
	add %r15,%r0,%r16				!me guardo la posicion de quien llamo al programa
	call cuadrado					!llamo a la subrutina
	jmpl %r16+4,%r0					!termino el programa


!Subrutina cuadrado, usa los registros 1,2,3
!El registro 1 es para el numero del cuadrado
!El 2 es donde se va a ir acumulando el resultado
!Y el 3 se usa como contador
cuadrado:	ld %r14,%r1				!cargo el numero 
		add %r14,4,%r14

		addcc %r1,%r0, %r3			!copio el numero del cuadrado para usarlo
		bneg cuadrado_negativos			!como guia de cuantas veces falta hacer la suma
		ba cuadrado_positivos			!tambien me fijo si es que era negativo, para invertirlo despues

cuadrado_positivos: 	addcc %r1,%r2,%r2		!voy sumando el numero al registro que acumula el total
			bvs no_es_representable		!si hay overflow salta en este branch
			addcc %r3,-1,%r3		!resto uno al contador de veces para sumar
			be termino_cuadrado		!si la resta da 0, ya tengo el cuadrado
			ba cuadrado_positivos

cuadrado_negativos:	addcc %r1,%r2,%r2		!voy sumando el numero al registro que acumula el total
			bvs no_es_representable		!si hay overflow salta en este branch
			addcc %r3,1,%r3			!resto uno al contador de veces para sumar
			be termino_cuadrado_n		!si la resta da 0, ya tengo el cuadrado
			ba cuadrado_negativos


termino_cuadrado:	add %r14,-4,%r14		!guardo en la pila el numero y hago return
			st %r2,%r14
			jmpl %r15+4,%r0

termino_cuadrado_n:	add %r14,-4,%r14		!guardo en la pila el numero y hago return
			sub %r0,%r2,%r2			!consiguiendo el negado, ya que es el resultado final
			st %r2,%r14
			jmpl %r15+4,%r0

no_es_representable:	addcc %r0,-1,%r4		!guardo -1 si no se pudo representar en 32 bits
			st %r4,%r14

x: 5							!numeros para el cuadrado


.end
