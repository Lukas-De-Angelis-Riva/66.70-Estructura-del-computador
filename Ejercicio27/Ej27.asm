!Cargar constantes: {1000, 50000}|10 = {3e8, c350}
	.begin

!Cargar constante 3e8
	
	!Forma1:
	add %r0, 3e8h, %r1
	
	
	!Forma2:
	sethi 3e8h, %r2
	srl %r2, 10, %r2

	
	!Forma3:
	ld [x], %r3

!Cargar constante c350h
	!Forma1:
	!add %r0, c350h, %r4, no funciona pues 50000 > 8192
	
	!Forma2:
	sethi c350h, %r5
	srl %r5, 10, %r5

	!Forma3:
	ld [y], %r6

x:	3e8h
y:	c350h
	.end
