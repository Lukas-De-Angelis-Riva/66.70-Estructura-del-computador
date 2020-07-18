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


				
	call leerPresion	!r2
	call leerTemp		!r3
	call leerSal		!r4

	call cond1		!r6
	call cond2		!r7
	call cond3		!r8

	or %r6, %r7, %r9
	orcc %r9, %r8, %r9
	be noHabilitar
	ba habilitar

pres:	81000000h		!Todo el numero
temp:	81000004h		!Todo el numero
sales:	81000008h		!El bit mas significativo: 1 -> ok, 0 -> ¬ok
prima:	81000008h		!El bit menos significativo: 1 -> ok, 0 -> ¬ok
	


cond1:
	subcc %r3, 300, %r0
	bneg cond1Falso
	addcc %r2, -10, %r0
	bneg cond1True
	ba cond1Falso
cond1Falso:
	add %r0, 0, %r6
	jmpl %r15 + 4, %r0
cond1True:
	add %r0, 1, %r6
	jmpl %r15 + 4, %r0


cond2:
	addcc %r0, %r4, %r0
	be cond2Falso
	subcc %r3, 300, %r0
	bneg cond2Falso
	ba cond2True
cond2Falso:
	add %r0, 0, %r7
	jmpl %r15 + 4, %r0
cond2True:
	add %r0, 1, %r7
	jmpl %r15 + 4, %r0

cond3:
	subcc %r2, 10, %r0
	bneg cond3Falso
	addcc %r4, %r0, %r0
	be cond3True
	ba cond3Falso
cond3Falso:
	add %r0, 0, %r8
	jmpl %r15 + 4, %r0
cond3True:
	add %r0, 1, %r8
	jmpl %r15 + 4, %r0
leerPresion:
	ld [pres], %r1
	ld %r1, %r1
	add %r0, %r1, %r2
	jmpl %r15 + 4, %r0
leerTemp:
	ld [temp], %r1
	ld %r1, %r1
	add %r0, %r1, %r3
	jmpl %r15 + 4, %r0

leerSal:
	ld [sales], %r1
	ld %r1, %r1
	srl %r1, 31, %r1
	add %r0, %r1, %r4
	jmpl %r15 + 4, %r0

habilitar:
	ld [prima], %r1
	ld %r1, %r2
	or %r2, 1, %r2
	st %r2, %r1

noHabilitar:
	ld [prima], %r1
	ld %r1, %r2
	or %r2, 0, %r2
	st %r2, %r1

	.end
