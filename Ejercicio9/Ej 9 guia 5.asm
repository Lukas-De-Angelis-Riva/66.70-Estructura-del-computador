!Ejercicio 9, escribir una subrutina que reciba por stack un numero entero en complemento a 2
! y devuelva su valor absoluto

.begin
.org 2048

	ld [un_numero],%r1		!carga el numero de memoria
	
	addcc %r14,-4,%r14		!mueve el puntero del stack
	st %r1,%r14			!agrega el numero al stack
	call obtener_valor_absoluto	!llama a la subrutina

un_numero: -7				!numeros en memoria
resultado_absoluto: 0

obtener_valor_absoluto:			!subrutina
	ld %r14,%r2			!obtiene el valor que esta en la pila
	add %r14,4,%r14			!disminuye el puntero de la pila
	
	addcc %r2,%r0,%r2		!hago la suma con 0 para ver despues si es negativo(cambia flags)

	bneg invertir			!llamara a la subrutina invertir para obtener e valor absoluto
					!esto lo hace si N==1

	add %r2,%r0,%r3			!guardo en %r3 en caso de que no sea negativo el numero

	st %r3,[resultado_absoluto]	!guarda en memoria el resultado en valor absoluto

	jmpl %r15+4,%r0			!return

invertir:	
	subcc %r0,%r2,%r3		!realizara el complemento a dos, obteniendo el valor absoluto, otra forma es usando ORN
					!esto es porque el numero estaria restando

	jmpl %r0+obtener_valor_absoluto+24,%r0	!vuelvo a la funcion del valor absoluto
							!el %r15 no guarda los llamados de los if
							!por lo que utilizo la direccion de memoria
							!de la funcion + 24 bytes que es donde quiero que continue
	
.end
