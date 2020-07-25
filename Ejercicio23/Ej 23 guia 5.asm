!Ejercicio 23 - Guia 5
!Un dispositivo de medición esta conectado a una computadora ARC y puede ser controlado a
!través de dos de sus registros, los cuales están mapeados en las direcciones de memoria
!D1=90001D00h y D2=90001D04h. El byte menos significativo de D1 refleja la medición de
!temperaturas realizada por el dispositivo (en el rango de 0 a 255 °C). El bit31 de D2 permite
!controlar el encendido de un indicador led de ese equipo (un 1 lo enciende y un 0 lo apaga).
!Escribir un programa que encienda el led sólo en caso de que la temperatura supere los 80 °C.
!Al escribir el bit31 de D2 no deben alterarse el resto de los bits de esa posición.



.begin
.org 2048
!.global main


!Usa los registros
!	%r1 -> Almacena la direccion D1 y se usa para encender el led
!	%r2 -> Se usa en caso de que haya que encender el led solamente
!	%r3 ->	Se usa para guardar el valor que se leyo de D2
main:	sethi 240007h,%r1		!Cargo la direccion de memoria de D1
	add %r1,100h,%r1		!D1=90001D00h

	ld %r1,%r3			!Cargo la lectura de la temperatura
	
	subcc %r3,80,%r0		!Veo si es mayor a 80 grados
	bpos encenderLed
	
	jmpl %r15+4,%r0			!Si no es mayor a 80 termino

encenderLed:
	add %r1,4,%r2			!Cargo la de D2=90001D04h
	ld %r2,%r3			!Cargo el valor que este en D2
	
	sethi 200000h,%r1		!Pongo en 1 el bit 31 para encender el led
	or %r3,%r1,%r3
	
	st %r3,%r2			!Devuelvo con el led encendido

	jmpl %r15+4,%r0			!Termina el programa

.end



