!Ejercicio 22 - Guia 5
!Un dispositivo mide simultáneamente 8 valores de temperatura y los almacena en ocho registros
!de 32 bits c/u los cuales se encuentran accesibles en el mapa de memoria de una computadora
!ARC mapeados a partir de la dirección B0101004(2)h. Escribir una rutina que lea estos ocho valores
!y devuelva por stack el mayor de ellos.


.begin
.org 2048
!.extern valorMaximo
.macro push registro
	add %r14, -4, %r14
	st registro, %r14
.endmacro

.macro pop registro
	ld %r14, registro
	add %r14, 4,%r14
.endmacro

!Para probarlo cargar los valores en el simulador a partir de esa posicion

!Usa los registros
!	%r32 -> almacena la direccion de los valores
!	%r30 -> tiene el largo del vector
!	%r29 -> guarda el valor final maximo
main:	sethi 2C0404h,%r31		!cargo la direccion en donde estan los valores
	add %r31,004h,%r31

	add %r0,32,%r30			!pongo el largo del vector

	push %r30			!los guardo en el stack para que los agarre la subrutina
	push %r31

	call valorMaximo

	pop %r29			!saco de la pila el valor maximo

	halt

.end


.begin
.org 2400
!.global valorMaximo

.macro push registro
	add %r14, -4, %r14
	st registro, %r14
.endmacro

.macro pop registro
	ld %r14, registro
	add %r14, 4,%r14
.endmacro

!Utiliza los registros
!	%r1 para almacenar la direccion del vector
!	%r2 para guardar el largo del vector
!	%r16 como copia de la direccion de llamado a esta subrutina
!	%r4 para guardar la lectura del vector
!	%r5 para guardar el maximo/minimo
valorMaximo:	
	pop %r1 			!Obtengo la direccion del vector
	pop %r2				!obtengo el largo del vector

	add %r15,%r0,%r16		!guardo la direccion de donde llamaron a esta subrutina
	call obtener_maximo

	jmpl %r16+4,%r0			!vuelvo a quien llamo a esta subrutina

!-------

obtener_maximo:
	ld %r1+%r2,%r5			!leo del vector, empiezo por el final
	subcc %r2,4,%r2			!me muevo en el vector
	be termine_vector		!si solo habia un numero termine
	ba maximo			

!-------

maximo:
	ld %r1+%r2,%r4			!leo del vector
	subcc %r5,%r4,%r0		!veo el signo, si es negativo, es mayor, si es positivo es menor
	bneg es_mayor
vuelta:
	subcc %r2,4,%r2			!me muevo en el vector
	be termine_vector
	ba maximo


es_mayor:
	add %r4,%r0,%r5			!remplazo al maximo
	ba vuelta

!-------

termine_vector:
	push %r5			!devuelvo el maximo/minimo por la pila
	jmpl %r15+4,%r0			!vuelvo al programa principal

.end




