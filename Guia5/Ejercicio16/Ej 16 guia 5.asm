!Ejercicio 16 Guia 5
!Escribir un programa que recibe a través de la pila dos números en punto flotante simple
!precisión, los compara y devuelve respectivamente un 1 o un 2 según sea mayor el primero o el
!segundo.

.begin
.org 2048
!.global flotanteMayor
.macro push reg
	add %r14, -4, %r14
	st reg, %r14
.endmacro
.macro pop reg
	ld %r14, reg
	add %r14, 4, %r14
.endmacro

.macro obtenerSigno registroConNumero,registroDestino		
	srl registroConNumero, 31, registroDestino			!Consigo el signo con un desplazamiento a derecha
.endmacro

.macro obtenerExponente registroConNumero,registroDestino
	sethi 1fe00h,registroDestino					!Cargo con 0111 1111 1000 0000 0000 0000 0000 0000 para quedarme con el exponente
	and registroConNumero, registroDestino, registroDestino
	srl registroDestino, 23, registroDestino
.endmacro

.macro obtenerMantisa registroConNumero,registroDestino
	sethi 001fffh,registroDestino					!Cargo con 0000 0000 0111 1111 1111 1111 1111 1111 para quedarme con la mantisa
	add registroDestino,2ffh,registroDestino
	and registroConNumero, registroDestino, registroDestino
.endmacro

!Utiliza los registros:
! r1 	-> guarda el primer numero
! r2 	-> guarda el segundo numero
! r3 	-> se utiliza para analizar signo, exponente, mantisa del primer numero
! r4 	-> se utiliza para analizar signo, exponente, mantisa del segundo numero
flotanteMayor:								
	pop %r1								!Obtengo el primer numero en r1
	pop %r2								!Obtengo el segundo numero en r2

	obtenerSigno %r1,%r3
	obtenerSigno %r2,%r4
	
	subcc %r3, %r4, %r0						!Los resto para ver si uno ya es mayor que el otro

	be signosIguales						!Si da 0 entonces son iguales los signos
	ba signosDistintos						!Si no da 0 entonces no son iguales los signos

signosDistintos:							
	addcc %r3, %r0, %r0
	be primeroEsMayor						!Si r3 es positivo entonces r4 es negativo
	ba segundoEsMayor						!Si r3 es negativo entonces r4 es positivo

signosIguales:								!Si tienen el mismo signo, tengo que seguir analizando. Primero el exponente y despues la mantisa si es necesario
	obtenerExponente %r1,%r3
	obtenerExponente %r2,%r4
	subcc %r3, %r4, %r0						!Los resto para ver si uno ya es mayor que el otro
	be exponentesIguales						
	ba exponentesDistintos

exponentesDistintos:							
	subcc %r3, %r4, %r0						!Si r3 es mayor, el resultado va a ser positivo
	bpos primeroEsMayor						
	ba segundoEsMayor	

exponentesIguales:							!Caso ambos exponentes iguales
	obtenerMantisa %r1,%r3
	obtenerMantisa %r2,%r4
	subcc %r3, %r4, %r0						!Resto las mantisas
	be numerosIguales						!Si da 0 significa que los numeros son iguales
	bneg segundoEsMayor						! r3 - r4 < 0 ---> r3 < r4
	ba primeroEsMayor						! r3 - r4 > 0 ---> r3 > r4

primeroEsMayor:								!num1 > num2
	add %r0, 1, %r1							!Pongo un 1 en r1
	push %r1							!Hago push del 1 en la pila
	jmpl %r15+4, %r0						!return

segundoEsMayor:								!num2 > num1
	add %r0, 2, %r1							!Pongo un 2 en r1
	push %r1							!Hago push del 2 en la pila
	jmpl %r15+4, %r0						!return

numerosIguales:								!num2 = num1
	push %r0							!Se devuelve 0 ya que los numeros son iguales
	jmpl %r15+4, %r0						!return


.end
