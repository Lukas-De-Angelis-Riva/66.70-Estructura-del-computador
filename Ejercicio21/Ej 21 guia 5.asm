!Ejercicio 21 - Guia 5 - Estructura del Computador
!Un programa declara un array de 30 elementos de 32 bits y le pasa a una subrutina su largo y
!localización en memoria. Esta subrutina determina si la suma de todos los elementos del array es!
!un número par (devuelve un 1) o impar (devuelve un 0). En caso de que la suma excediese el
!rango de representación del sistema la rutina devuelve -1.
!El programa debe inicializar a FFFFh todos los elementos del array en caso de determinar que su
!suma sea par o bien poner todos en cero si su suma excede el rango de representación.
!Proponer un código para el programa principal y para la subrutina considerando las variantes de
!que ambos están declarados en el mismo módulo o en módulos diferentes.



.begin
.org 2048
.macro push registro
	add %r14, -4, %r14
	st registro, %r14
.endmacro

.macro pop registro
	ld %r14, registro
	add %r14, 4,%r14
.endmacro

!.global determinar_suma_par_o_impar

!Los registros que usa son:
!	%r1	->	Guarda el largo del vector
!	%r2	->	Guarda la posicion en memoria del vector
!	%r3	->	Copia del largo del vector
!	%r4	->	Guarda el valor leido del vector
!	%r5	->	Acumula el total, y se usa para el valor devuelto dependiendo el caso
datermina_suma_par_o_impar:
	pop %r1			!cargo el largo del vector (120 bytes segun el ej)
	pop %r2			!cargo la posicion en memoria del vector
	add %r1,%r0,%r3		!copio el largo del vector
	
	add %r0,%r0,%r5		!inicializo en 0 el total
	
	ba sumar_elementos

termine:
	jmpl %r15+4,%r0

sumar_elementos:
	ld %r2+%r3,%r4		!leo un numero del vector
	addcc %r4,%r5,%r5	!lo sumo al total
	bvs overflow			
	subcc %r3,4,%r3		!reduzco el indice del vector
	be termine_vector
	ba sumar_elementos

termine_vector:
	sll %r5,31,%r5		!me deshago de todos los bits que no me sirven
	srl %r5,31,%r5		!me quede con el bit menos significativo
	subcc %r5,1,%r0		!veo si es par o no
	be es_impar
	add %r0,1,%r5		!pongo en %r5 el valor pedido a devolver (1)
	push %r5		!lo devuelvo por la pila
	sethi 3Fh,%r5		!inicializo %r5 con el valor que va a ir en el vector
	add %r5,3FFh,%r5		
es_par:
	st %r5,%r2+%r1		!guardo FFFFh en un lugar del vector		
	subcc %r1,4,%r1		!reduzco el indice del vector
	be termine
	ba es_par	

es_impar:
	push %r0		!devuelvo 0 si es impar y termino el programa
	ba termine
	
overflow:
	add %r0,-1,%r5		!pongo en -1 lo que se va a devoler
	push %r5
	ba poner_en_cero_el_vector		

poner_en_cero_el_vector:
	st %r0,%r2+%r1		!guardo en una posicion del vector un 0		
	subcc %r1,4,%r1		!reduzco el indice del vector
	be termine
	ba poner_en_cero_el_vector

.end


