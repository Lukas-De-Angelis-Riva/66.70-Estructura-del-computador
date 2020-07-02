!Un programa en assembler ARC declara un arreglo de 20 elementos enteros signados
! y lo completa con los primeros 20 valores negativos leidos de un dispositivo 
!de entrada que esta mapeado en la direccion A0010124h. 
!Una vez completado el arreglo el programa termina

.begin
.org 2048
array: .dwb 20			!puedo cargarle los valores desde el simulador

main:	add %r4,20,%r4			!pongo el limite del array
	ld [direccion], %r2		!posicion al dispositivo

 
loop:	ld %r2, %r3			!leo del dispositivo
	addcc %r3,%r0,%r3		!veo los flags del numero
	bneg agregar_al_array		!salto para agregar si es negativo
	ba loop				!no es negativo, sigo iterando

agregar_al_array:	st %r3,%r1+array	!guardo en array
			add %r1,4,%r1		!muevo la posicion en el array
			addcc %r4,-1,%r4	!resto al tope
			be array_lleno		!veo si se lleno el array
			ba loop			!vuelvo al loop si no esta lleno

array_lleno:	jmpl %r15+4,%r0		!return a quien llamo el programa

direccion: 0xA0010124

.end


