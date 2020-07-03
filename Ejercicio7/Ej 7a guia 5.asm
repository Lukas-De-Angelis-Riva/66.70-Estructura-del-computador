!Ejericio 7 a Guia 5
!igual al anterior solamente que en distintos modulos el sumar y el programa principal
!no le gustan los comentarios en el .begin y .end 
!con distintos modulos se refiere realmente a que esten en otros archivos
! y utilizar .extern y .global, pero estos no se encuentran en el simulador ARC

.begin		
.org 2048
	
	ld [primer_num],%r1	!cargo de memoria los numeros
	ld [segundo_num],%r2
	call sumar		!llamo a la subrutina sumar

primer_num:10			!numeros en memoria
segundo_num:5
resultado:0	
.end	


.begin				
.org 2400			!en otra posicion de memoria el modulo de suma

sumar: addcc %r1,%r2,%r3	!sumo los numeros(paso por registros)
	st %r3,[resultado]	!guardo el resultado en memoria
	jmpl %r15+4,%r0	!return
				!termina este modulo
.end
