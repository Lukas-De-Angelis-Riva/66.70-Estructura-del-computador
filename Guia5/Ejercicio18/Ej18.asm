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
	call cantidadDeUnos
	jmpl %r0, %r0, %r0

x:	F124FAC1h				!1111 0001 0010 0100 1111 1010 1100 0001 Debera tener 4 + 1 + 1 + 1 + 4 + 2 + 2 + 1 = 16
y:	4173847Ch				!0100 0001 0111 0011 1000 0100 0111 1100 Debera tener 1 + 1 + 3 + 2 + 1 + 1 + 3 + 2 = 14
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
loop:
	addcc %r2, %r0, %r2			!Me fijo el valor de r2
	be finLoop				!Si es 0 entonces termine de iterar
	andcc %r1, %r2, %r0			!Si no, hago el and entre r1 [El numero] y r2 [El iterador]
	be noSuma				!Si el numero obtenido es 0 significa que no hay un 1 en esa posicion, entonces no suma
	ba siSuma				!De lo contrario, hay un 1 en esa posicion, entonces si suma

noSuma:					!Caso no suma
	sll %r2, 1, %r2			!Simplemente voy a la proxima posicion
	ba loop				
siSuma:					!Caso si suma
	add %r3, 1, %r3			!Le sumo 1 al contador
	sll %r2, 1, %r2			!Y voy a la proxima posicion
	ba loop			
finLoop:
	push %r14, %r3 			!Cargo en la pila el valor del contador
	jmpl %r15 + 4, %r0

	.end
