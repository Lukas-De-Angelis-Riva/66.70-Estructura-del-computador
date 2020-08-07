!Ejercicio 17
!Un programa recibe a través de %r20 una palabra de 32 bits que representa dos números en
!complemento a 2 en sus dos bytes más significativos y en sus dos bytes menos significativos
!respectivamente. Proponer un código para ese programa tal que devuelva (también por %r20) la
!suma de ambos valores recibidos. Considere el manejo de condiciones de fuera de rango si lo
!considera necesario.

.begin
.org 2048
	
	ld [unNumero],%r20
	
	call obtenerPrimerNumero
	call obtenerSegundoNumero
	addcc %r1,%r2,%r20	
	
	unNumero: 3100003Fh				!0011 0001 | 0000 0000 0000 0000 | 0011 1111 /// 49  | 63

obtenerPrimerNumero:
	srl %r20,24,%r1
	jmpl %r15+4,%r0
obtenerSegundoNumero:
	sll %r20,16,%r2
	srl %r2,16,%r2	
	jmpl %r15+4,%r0

.end

