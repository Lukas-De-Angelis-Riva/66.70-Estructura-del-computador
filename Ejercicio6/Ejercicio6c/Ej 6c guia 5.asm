
!Ejercicio 6 c guia 5

.begin
.org 2048

	ld [primer_num],%r1		!cargo los numeros de memoria
	ld [segundo_num],%r2
	st %r1,[2000]			!los guardo a partir de la pos 2000
	st %r2,[2004]			!se puede usar %r0+2000 tambien
	call sumar			!llamo a la subrutina

sumar:
	ld [2000],%r3			!cargo los numeros del lugar de memoria
	ld [2004],%r4			!que elegi (2000 y 2004)
	addcc %r3,%r4,%r5		!sumo los numeros ahora(ya estan en los registros)
	st %r5,[resultado]		!guardo el resultado
	jmpl %r15+4,%r0			!return
	

primer_num: 24
segundo_num:24
resultado:0

.end

