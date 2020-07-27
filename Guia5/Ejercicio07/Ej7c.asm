
	.begin
	.org 2048
prog:
	ld [stackPointer], %r14

	ld [n1], %r1			!Tengo un numero en r1.
	ld [n2], %r2			!Tengo otro numero en r2.

	st %r1, [vectorSuma]		!Guardo el sumando1
	st %r2, [vectorSuma + 4]	!Guardo el sumando2

	addcc %r15, %r0, %r30	!No pierdo la referencia a quien me llamó
	call sbradd			!Llamo a la función de sumar dos números.

	ld [vectorSuma + 8], %r3	!Me guardo en r3 la suma.
	jmpl %r30 + 4, %r0


n1:	4
n2:	9
n3:	0
stackPointer:	6000 !Es para asignar un valor a r14 y que tenga sentido pasar cosas por el stack.
	.end

!Suma los dos numeros que están en las posiciones vectorSuma, vectorSuma+4 y guarda la suma en vectorSuma+8.

!Se utilizan los registros r1 y r2, estos seran sobreescritos.
	.begin
sbradd:
	ld [vectorSuma], %r1 	!Agarro el sumando 1
	ld [vectorSuma+4], %r2 	!Agarro el sumando 2
	add %r1, %r2, %r2		!Sumo y guardo en el r2
	st %r2, [vectorSuma+8]	!Guardo la suma en vectorSuma+8
	jmpl %r15 + 4, %r0		!vuelvo

vectorSuma: .dwb 3
	
	.end
