!Ejercicio 10 Guia 5 
!Armar un programa que devuelva -1 si hubo overflow, 0 en caso contrario
! para dos numeros en complemento a 2, 32 bits.


.begin
.org 2048

primer_num:		-2147483648		!declaro los numeros que voy a usar en memoria
segundo_num:		-214748364

hay_overflow:		-1			!los valores de retorno
no_hay_problema: 	0

		addcc %r14,-4,%r14		!muevo el puntero de la pila
		ld [primer_num],%r29		!cargo de memoria el numero que va a ir a la pila
		st %r29,%r14			!guardo en la pila

		addcc %r14,-4,%r14		!repito los pasos anteriores para la pila
		ld [segundo_num],%r29
		st %r29,%r0,%r14

		call determinar_representable	!llamo a la subrutina


determinar_representable:	ld %r14, %r1			!cargo de la pila
				addcc %r14,4,%r14		!muevo el puntero de la pila
				
				ld %r14,%r2			!repito
				addcc %r14,4,%r14
		
				addcc %r1,%r2,%r3		!hago una suma para determinar los flags
				
				bvs no_representable		!llamara a no representable si V==1

				bvc representable		!llamara a representable si V==0

no_representable:	addcc %r14,-4,%r14			!muevo el puntero
			ld [hay_overflow],%r3		!cargo el valor de retorno
			st %r3,%r14				!lo guardo en la pila
			jmpl %r15+4,%r0			!return

representable:	addcc %r14,-4,%r14			!lo mismo solo que en el otro caso
			ld [no_hay_problema],%r3
			st %r3,%r14
			jmpl %r15+4,%r0
	

.end

