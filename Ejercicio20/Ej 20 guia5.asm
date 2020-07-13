!Ejercicio 20 Guia 5 - Estructura del computador
!Un programa recibe via stack la dirección de inicio y el largo de un vector y devuelve su valor
!máximo y su valor mínimo también por stack. El cálculo del máximo se realiza invocando una
!subrutina declarada en el mismo módulo mientras que el cálculo del mínimo se realiza invocando
!una subrutina declarada en un módulo externo. Proponer un código para el programa principal y
!para ambas rutinas.




.begin
.org 2048
!.global main
!.extern obtener_minimo
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
!	%r3 como copia del largo del vector
!	%r16 como copia de la direccion de llamado a esta subrutina
!	%r4 para guardar la lectura del vector
!	%r5 para guardar el maximo/minimo
main:	
	pop %r1 			!Obtengo la direccion del vector
	pop %r2				!obtengo el largo del vector
	
	add %r2,%r0,%r3			!me guardo el largo en otro registro

	add %r15,%r0,%r16		!guardo la direccion de donde llamaron a esta subrutina
	call obtener_maximo
	call obtener_minimo

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

!------------------------------------------------------------------------------------------

.begin
.org 3000
!.global obtener_minimo
.macro push reg
	add %r14, -4, %r14
	st reg, %r14
.endmacro

.macro pop reg
	ld %r14, reg
	add %r14, 4,%r14
.endmacro

!-------

obtener_minimo:
	ld %r1+%r3,%r5			!leo del vector, empiezo por el final
	subcc %r3,4,%r3			!me muevo en el vector
	be termine_vector		!si solo habia un numero termine
	ba minimo			

!-------

minimo:
	ld %r1+%r3,%r4			!leo del vector
	subcc %r5,%r4,%r0		!veo el signo, si es negativo, es mmayor, si es positivo es menor
	bpos es_menor
vuelta2:
	subcc %r3,4,%r3			!me muevo en el vector
	be termine_vector
	ba minimo


es_menor:
	add %r4,%r0,%r5			!remplazo al minimo
	ba vuelta2

!-------


.end

