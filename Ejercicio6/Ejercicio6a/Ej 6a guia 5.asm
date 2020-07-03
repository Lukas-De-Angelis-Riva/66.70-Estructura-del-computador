
!Ejercicio 6 guia 5

.begin
.org 2048

	ld primer_numero,%r0,%r1	!cargo de memoria los dos numeros
	ld segundo_numero,%r0,%r2
	call sumar			!llamo a la subrutina sumar 
					!(los numeros estan en los registros)

sumar:
	addcc %r1,%r2,%r3		!los sumo a los numeros guardando flags
	st %r3,%r0,lugar_guardado	!guardo el numero
	jmpl %r15 + 4,%r0		!vuelvo a la linea 10 despues del llamado a sumar
					!(return)(al volver se queda ejecutando esto)

primer_numero: 13			!variables declaradas en memoria
segundo_numero: 74
lugar_guardado:0

.end


