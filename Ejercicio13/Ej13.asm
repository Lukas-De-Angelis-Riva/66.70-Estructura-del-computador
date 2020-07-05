	.begin
	.org 2048
	ld [stack], %r1
	add %r0, %r1, %r14
	ld [x], %r1

	add %r14, -4, %r14

	st %r1, %r14

	call fact

	ld %r14, %r1

	add %r14, 4, %r14			! Pongo la pila en el valor que tenia antes.

stack: 20000
x:	10
	.end




! Modulo factorial
! Recibe un numero por la pila y devuelve por esta el factorial de este numero

	.begin
	.org 3000
fact:
	add %r15, %r0, %r30
	ld %r14, %r20

for_fact:
	addcc %r20, -1, %r20
	be fin_fact
	add %r14, -4, %r14
	st %r20, %r14
	call prod
	ld %r14, %r21
	add %r14, 8, %r14
	st %r21, %r14
	ba for_fact

fin_fact:
	jmpl %r30 + 4, %r0
	.end








!Hace el producto entre dos numeros que recibe desde la pila.
!Utiliza los registros %r1, %r2, %r3 y %r4

!r1 es 1; 2; 4; 8 ... potencias de 2 o en binario: 0...0001 ;0...0010; 0...0100; ... ; 010...0 ; 10...0
!r2 tiene a y
!r3 tiene a x
!r4 tiene la suma parcial


	.begin
	.org 5000
prod:
	ld %r14, %r2				! Cargo y en r2
	add %r14, 4, %r14			! Voy a la siguiente posicion de la pila
	ld %r14, %r3				! Cargo x en r3
	add %r14, -4, %r14			! Vuelvo a la posicion que tenia la pila

	add %r0, 1, %r1			! Pongo un 1 en r1
	add %r0, %r0, %r4			! Me aseguro que r4 comience en 0

for:						! Linea de iteracion

	addcc %r1, %r0, %r1			
	be fin					! Me aseguro que r1 no sea 0 para seguir iterando, de lo contrario termino

	andcc %r3, %r1, %r0			! Me fijo si debo sumar o no.
	be noSumo

sumo:					

	addcc %r2, %r4, %r4			

	bvs overflow				! Si hubo un overflow implica que el producto no se pudo hacer.
	
	sll %r1, 1, %r1			! Aplico un shift left a r1, para conseguir la proxima potencia de 2
	sll %r2, 1, %r2			! Aplico un shift left a r2 [y] consiguiendo el proximo valor ponderado.
	ba for					! Vuelvo a iterar.

noSumo:

	sll %r1, 1, %r1			! Aplico un shift left a r1, para conseguir la proxima potencia de 2
	sll %r2, 1, %r2			! Aplico un shift left a r2 [y] consiguiendo el proximo valor ponderado.
	ba for					! Vuelvo a iterar.


fin:						! Termine de multiplicar.

	add %r14, -4, %r14			! Hago un lugar en la pila
	st %r4, %r14				! Guardo el producto
	jmpl %r15 + 4, %r0			! Vuelvo


overflow:					! Hubo un overflow y por lo tanto, el producto no es representable.

	add %r14, -4, %r14			! Hago un lugar en la pila.
	add %r0, -1, %r1			! Pongo r1 en -1
	st %r1, %r14				! Guardo el -1 en r14
	jmpl %r15 + 4, %r0			! Vuelvo.
	

.end
