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


	add %r0, 3000, %r14
	ld [x], %r1
	push %r14, %r1

	ld [y], %r1
	push %r14, %r1

	ld [z], %r1
	push %r14, %r1

	ld [w], %r1
	push %r14, %r1

	ld [v], %r1
	push %r14, %r1

	ld [u], %r1
	push %r14, %r1

	add %r0, 6, %r1
	push %r14, %r1

	call calcularCantidadDeUnos
	
	jmpl %r0, %r0, %r0

x:	01234567h				! 0000 0001 0010 0011 0100 0101 0110 0111 -> 12
y:	89ABCDEFh				! 1000 1001 1010 1011 1100 1101 1110 1111 -> 20
z:	124fCD12h				! 0001 0010 0100 1111 1100 1101 0001 0010 -> 14
w:	00000000h				! 0000 0000 0000 0000 0000 0000 0000 0000 -> 00
v:	FFFFFFFFh				! 1111 1111 1111 1111 1111 1111 1111 1111 -> 32
u:	F0F0F0F0h				! 1111 0000 1111 0000 1111 0000 1111 0000 -> 16
						! Suma total:					    94
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

!r5 -> topeDelArreglo.
!r6 -> contador.

calcularCantidadDeUnos:
	pull %r14, %r5			!Cargo sobre r5 el tope del arreglo
	add %r0, %r0, %r6			!Dejo el contador en 0
	add %r15, %r0, %r30			!Me guardo la direccion de quien me llamo
loop:
	addcc %r5, %r0, %r0			!Actualizo los flags con r5
	be finLoop				!Si es 0 entonces termine de iterar
	call cantidadDeUnos			!Llama a la subrutina que cuenta la cantidad de 1's de un numero en el stack
	pull %r14, %r3			!Cargo esa cantidad en el registro r3
	add %r6, %r3, %r6			!Y sumo el contador junto a r3 y lo dejo en r3. r6 = r6 + r3
	sub %r5, 1, %r5			!Le resto 1 al tope. r5 -= 1
	ba loop				!Vuelvo al loop
finLoop:
	push %r14, %r6			!Una vez terminado el loop cargo el contador en la pila
	jmpl %r30 + 4, %r0			!return

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

!Lee de la pila un valor en binario y devuelve por la pila la cantidad de unos que tiene su representancion
!Utilza los registros: {r1, r2, r3, r14, r15}
!r1 --> Numero
!r2 --> Iterador [Es decir, ...0001 -> ...0010 -> ...0100 -> ...1000 -> ...]
!r3 --> Contador [Es decir, 1 -> 2 -> 3 -> 4 -> 5 ->...]
!r14 -> Stack

cantidadDeUnos:
	pull %r14, %r1			!Cargo sobre r1 el valor en la pila
	add %r0, 1, %r2			!Pongo r2 en 1
	add %r0, 0, %r3			!Pongo r3 en 0
loop2:
	addcc %r2, %r0, %r2			!Me fijo el valor de r2
	be finLoop2				!Si es 0 entonces termine de iterar
	andcc %r1, %r2, %r0			!Si no, hago el and entre r1 [El numero] y r2 [El iterador]
	be noSuma				!Si el numero obtenido es 0 significa que no hay un 1 en esa posicion, entonces no suma
	ba siSuma				!De lo contrario, hay un 1 en esa posicion, entonces si suma

noSuma:					!Caso no suma
	sll %r2, 1, %r2			!Simplemente voy a la proxima posicion
	ba loop2				
siSuma:					!Caso si suma
	add %r3, 1, %r3			!Le sumo 1 al contador
	sll %r2, 1, %r2			!Y voy a la proxima posicion
	ba loop2			
finLoop2:
	push %r14, %r3 			!Cargo en la pila el valor del contador
	jmpl %r15 + 4, %r0

	.end
