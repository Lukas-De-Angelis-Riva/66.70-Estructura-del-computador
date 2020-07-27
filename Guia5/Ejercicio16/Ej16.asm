	.begin
	.org 2048

	.macro push pila, reg
		
		add pila, -4, pila
		st reg, pila

	.endmacro
	.macro pull pila, reg
	
		ld pila, reg
		add pila, 4, pila

	.endmacro
	



	add %r14, 3000, %r14			!Asigno al stack una posicion minimamente valida.


	ld [yIEEE], %r1
	push %r14, %r1
	ld [zIEEE], %r1
	push %r14, %r1	

	call cualEsMayor

	ba 0


xIEEE:	42180000h				! 38 	En flotante.	
yIEEE:	437c0000h				! 252 	En flotante.
zIEEE:	C1F00000h				! -30 	En flotante.
wIEEE: BF800000h				! -1	En flotante.
vIEEE: 00000000h				! 0	En flotante.
	.end










	.begin

	.macro push pila, reg
		
		add pila, -4, pila
		st reg, pila

	.endmacro
	.macro pull pila, reg
	
		ld pila, reg
		add pila, 4, pila

	.endmacro

!Recibe dos numeros en notacion punto flotante por la pila
!Y devuelve:
! 0 Si son iguales.
! 1 Si el ultimo elemento apilado es mas grande que el anterior.
! 2 Si el ultimo elemento apilado es mas chico que el anterior.

!Utiliza los registros: {1, 2, 3, 4, 14, 15, 30}
! r1 	-> numero1
! r2 	-> numero2
! r3 	-> signo / exponente / mantisa numero1
! r4 	-> signo / exponente / mantisa numero2
! r14	-> pila
! r15	-> jmpl de subrutinas
! r30	-> jmpl de la rutina


cualEsMayor:								
	add %r15, %r0, %r30						!Me guardo el r15 en r30 para no sobreescribir
	pull %r14, %r1						!Obtengo numero1 en r1
	pull %r14, %r2						!Obtengo numero2 en r2

	call obtenerSigno1						!Obtengo el signo del numero 1 en r3
	call obtenerSigno2						!Obtengo el signo del numero 2 en r4
	subcc %r3, %r4, %r0						!Los resto actualizando los flags
	be signosIguales						!Si da 0 entonces son iguales los signos
	ba signosDistintos						!Si no da 0 entonces no son iguales los signos

signosIguales:							!En caso de ambos tener el mismo signo
	addcc %r3, %r0, %r0
	be ambosPositivos						!Si r3 es positivos, r4 tambien entonces ambos son positivos
	ba ambosNegativos						!Idem con negativo

signosDistintos:							!Si son distintos ya tengo la respuesta
	addcc %r3, %r0, %r0
	be primeroPositivoSegundoNegativo				!Si r3 es positivos entonces r4 es negativo
	ba primeroNegativoSegundoPositivo				!Si r3 es negativo entonces r4 es positivo

ambosPositivos:							!Caso ambos signos positivos
	call obtenerExponente1					!Obtengo el exponente del numero 1 en r3
	call obtenerExponente2					!Obtengo el exponente del numero 2 en r4
	subcc %r3, %r4, %r0						!Los resto r3-r4
	be exponentesIguales						!Si da 0, ambos exponentes son iguales
	bneg exponente2MayorA1					! si r3 - r4 < 0 ---> r3 < r4
	ba exponente1MayorA2						! si r3 - r4 > 0 ---> r3 > r4

exponentesIguales:							!Caso ambos exponentes iguales
	call obtenerMantisa1						!Obtengo la mantisa (sin el 1 trivial) del numero 1 en r3
	call obtenerMantisa2						!Obtengo la mantisa (sin el 1 trivial) del numero 2 en r4
	subcc %r3, %r4, %r0						!Los resto
	be mantisasIguales						!Si da 0, ambas mantisas son iguales.
	bneg mantisa2MayorA1						! r3 - r4 < 0 ---> r3 < r4
	ba mantisa1MayorA2						! r3 - r4 > 0 ---> r3 > r4

mantisasIguales:							!Si las mantisas son iguales, tanto exponente como signo tambien lo son
	ba numerosIguales						!Por lo que ambos numeros son iguales
mantisa2MayorA1:							!Si man2 > man1
	ba mayorSegundo						!Entonces num2 > num1
mantisa1MayorA2:							!Si man2 < man1
	ba mayorPrimero						!Entonces num2 < num1

exponente2MayorA1:							!Si exp2 > exp1
	ba mayorSegundo						!Entonces num2 > num1
exponente1MayorA2:							!Si exp2 < exp1
	ba mayorPrimero						!Entonces num2 < num1


ambosNegativos:							!Caso ambos signos negativos [Logica contraria a la de arriba]
	call obtenerExponente1					!Obtengo el exponente del numero 1 en r3
	call obtenerExponente2					!Obtengo el exponente del numero 2 en r4
	subcc %r3, %r4, %r0						!Los resto
	be exponentesIgualesNEG					!Si da 0 ambos exponentes son iguales, y los numeros son negativos.
	bneg mayorPrimero						!Si exp1 - exp2 < 0 --> exp2 > exp1 --> num2 < num1
	ba mayorSegundo						!Si exp1 - exp2 > 0 --> exp2 < exp1 --> num2 > num1
									! [Ya que ambos numeros son negativos]

exponentesIgualesNEG:						!Caso ambos signos negativos y exponentes iguales.
	call obtenerMantisa1						!Obtengo la mantisa (sin el 1 trivial) del numero 1 en r3
	call obtenerMantisa2						!Obtengo la mantisa (sin el 1 trivial) del numero 2 en r4
	subcc %r3, %r4, %r0						!Los resto
	be mantisasIguales						!Si da 0, ambas mantisas son iguales.
	bneg mayorPrimero						!Si man1 - man2 < 0 ---> man1 < man2 ---> num1 > num2
	ba mayorSegundo						!Si man1 - man2 > 0 ---> man1 > man2 ---> num1 < num2

primeroPositivoSegundoNegativo:					!Caso sg1 = 0 y sg2 = 1
	ba mayorPrimero						!Entonces num1 > num2

primeroNegativoSegundoPositivo:					!Caso sg1 = 1 y sg2 = 0
	ba mayorSegundo						!Entonces num2 > num1



mayorPrimero:								!num1 > num2
	add %r0, 1, %r1						!Pongo un 1 en r1
	push %r14, %r1						!Hago push del 1 en la pila
	jmpl %r30+4, %r0						!return

mayorSegundo:								!num2 > num1
	add %r0, 2, %r1						!Pongo un 2 en r1
	push %r14, %r1						!Hago push del 2 en la pila
	jmpl %r30+4, %r0						!return

numerosIguales:							!num2 = num1
	push %r14, %r0						!Hago push del 0 en la pila
	jmpl %r30+4, %r0						!return





obtenerSigno1:							!Carga el signo del numero 1 en el registro 3

	ld [bitsSigno], %r3
	and %r1, %r3, %r3
	srl %r3, 31, %r3
	jmpl %r15+4, %r0

obtenerSigno2:							!Carga el signo del numero 2 en el registro 4

	ld [bitsSigno], %r4
	and %r2, %r4, %r4
	srl %r4, 31, %r4
	jmpl %r15+4, %r0

obtenerExponente1:							!Carga el exponente del numero 1 en el registro 3
	ld [bitsEXP], %r3
	and %r1, %r3, %r3
	srl %r3, 23, %r3
	jmpl %r15+4, %r0
obtenerExponente2:							!Carga el exponente del numero 2 en el registro 4
	ld [bitsEXP], %r4
	and %r2, %r4, %r4
	srl %r4, 23, %r4
	jmpl %r15+4, %r0

obtenerMantisa1:							!Carga la mantisa del numero 1 en el registro 3
	ld [bitsMAN], %r3
	and %r1, %r3, %r3
	jmpl %r15+4, %r0
obtenerMantisa2:							!Carga la mantisa del numero 2 en el registro 4
	ld [bitsMAN], %r4
	and %r2, %r4, %r4
	jmpl %r15+4, %r0

bitsMAN:	007FFFFFh						!Literalmente 0000 0000 0111 1111 1111 1111 1111 1111
bitsEXP:	7F800000h						!Literalmente 0111 1111 1000 0000 0000 0000 0000 0000
bitsSigno:	80000000h						!Literalmente 1000 0000 0000 0000 0000 0000 0000 0000
	.end
