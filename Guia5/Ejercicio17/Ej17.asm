	.begin
	.org 2048
	
	ld [y], %r20
	call obtenerSumaRara
	jmpl %r0, %r0, %r0


x: 3100003Fh				!0011 0001 | 0000 0000 0000 0000 | 0011 1111 /// 49  | 63
y: FC00001Ah				!1111 1100 | 0000 0000 0000 0000 | 0001 1010 /// 252 | 26

	.end

	




	.begin

obtenerSumaRara:
	add %r15, %r0, %r30		!Me guardo la vuelta de la rutina
	call obtenerPrimerNumero	!Obtengo el primero numero en r1
	call obtenerSegundoNumero	!Obtengo el segundo numero en r2
	add %r1, %r2, %r20		!Los sumo y los pongo en r20
	jmpl %r30 + 4, %r0		!Vuelvo

obtenerPrimerNumero:
	ld [bitsPrimero], %r1	!Cargo FF000000h en r1
	and %r20, %r1, %r1		!Me quedo con los bits de r20 que representan el primer numero
	srl %r1, 24, %r1		!Hago un shif right logico para poner el numero en su determinada posicion
	jmpl %r15 + 4, %r0		!Vuelvo de la subrutina

obtenerSegundoNumero:		
	ld [bitsSegundo], %r2	!Cargo 000000FFh en r2
	and %r20, %r2, %r2		!Me quedo con los bits de r20 que representan el segundo numero
	jmpl %r15 + 4, %r0		!Vuelvo de la subrutina

bitsPrimero:	FF000000h		!Literalmente 1111 1111 0000 0000 0000 0000 0000 0000
bitsSegundo:	000000FFh		!Literalmente 0000 0000 0000 0000 0000 0000 1111 1111

	.end
