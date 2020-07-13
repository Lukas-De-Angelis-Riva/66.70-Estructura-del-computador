
	.begin
	.org 2048
prog:
	ld [stackPointer], %r14		!Le asigno un valor con sentido al stack
	ld [n1], %r2				!Agrego el número a calcular el módulo
	
	add %r14, -4, %r14			!Muevo la pila
	st %r2, %r14				!Agrego el número a la pila

	add %r15, %r0, %r30			!Me guardo el %r15 para no perder la referencia a quien me llamó
	call compl2_a_absoluto		!Llamo a la subrutina correspondiente

	ld %r14, %r2				!Agrego el resultado en %r1 para luego trabajarlo

	jmpl %r30 + 4, %r0			!Vuelvo.

n1: 	-15
stackPointer:	6000 !Es para asignar un valor a r14 y que tenga sentido pasar cosas por el stack.

!Esta función recibe un número en complemento a 2 por la pila y devuelve en la misma posición de la pila su valor absoluto.
!Esta función utiliza el registro 1. Este será sobreescrito.

compl2_a_absoluto:

	ld %r14, %r1				!Me cargo el valor a utilizar en r1
	addcc %r1, %r0, %r1			!Agrego los flags para mi número
	bneg nega				!Si es negativo saltá a nega

posi:	jmpl %r15 + 4, %r0			!Vuelvo.
nega:	neg %r1, %r1				!Niego el número para conseguir su complemento
	st %r1, %r14				!Lo guardo en la pila.
	ba posi				!Salta a posi, que es volver.
	
	.end

