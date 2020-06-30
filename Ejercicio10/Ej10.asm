	
.begin
	.org 2048
	stack .equ 1000
	add %r0, stack, %r14		!Dejo al stack en un valor con sentido.

	ld [n1], %r1			!Cargo n1 en r1.
	ld [n2], %r2			!Cargo n2 en r2.
	
	add %r14, -4, %r14
	st %r1, %r14
	add %r14, -4, %r14
	st %r2, %r14

	add %r15, %r0, %r30		!Me guardo el r15 en r30 para no perder la referencia.
	call es_suma_valida		!Hago el llamado a la subrutina para saber si son sumables
	
	add %r14, 12, %r14
	jmpl %r30 + 4, %r0
	

n1:	2147483647
n2:	214748364

!Utiliza los registro %r22 y %r23 Estos se veran sobreescritos.
es_suma_valida:
	
	ld %r14, %r22
	ld %r14 + 4, %r23	
	addcc %r22, %r23, %r23
	bvs overFlow

return:
	jmpl %r15 + 4, %r0

overFlow:
	add %r14, -4, %r14
	add %r0, -1, %r22	
	st %r22, %r14
	ba return
noOverFlow:

	add %r14, -4, %r14
	st %r0, %r14
	ba return
.end

