!Ejercicio 8 Igual al 6 solamente que usando un macro y con pasaje por registro
!Tampoco le gustan los comentarios en .macro y .endmacro

!macro se remplaza en ensamblado en todas las partes del codigo
!subrutina se llama en ejecucion

!macro le pongo sus parametros y los remplaza
!subrutina le llegan en ejecucion

!macro como remplaza el codigo se utiliza mas memoria (cada lugar en donde esta)
!subrutina lugar especifico de memoria

.begin
.org 2048
		

.macro	sumar a,b,resultado		
					!inicio el macro, le pongo un nombre y sus parametros
	addcc a,b,resultado		!operaciones
					!termina la macro
.endmacro				

	ld [primer_num],%r1		!cargo los numeros de memoria
	ld [segundo_num],%r2

	sumar %r1,%r2,%r3		!llamo al macro, le paso los registros como parametro
	
	st %r3,[resultado]		!guardo en memoria el resultado

primer_num: 8				!numeros en memoria
segundo_num:2
resultado:0

.end

