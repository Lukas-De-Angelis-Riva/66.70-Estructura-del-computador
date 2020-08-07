!Ejercicio 15 
!Escribir código que recibe a través de %r10 un número en punto flotante y devuelve su valor
!absoluto (también en punto flotante).

.begin
.org 2048
	
	ld [unNumero],%r10
	ld [comparador],%r1

	and %r10,%r1,%r10
	
	unNumero: 2563CB01h	
	comparador: 7FFFFFFFh
.end

