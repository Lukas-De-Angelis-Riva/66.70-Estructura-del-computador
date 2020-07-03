!Ejercicio 17 Guia 5
!Un programa recibe a través de %r20 una palabra de 32 bits que representa dos números en
!complemento a 2 en sus dos bytes más significativos y en sus dos bytes menos significativos
!respectivamente. Proponer un código para ese programa tal que devuelva (también por %r20) la
!suma de ambos valores recibidos. Considere el manejo de condiciones de fuera de rango si lo
!considera necesario.


.begin
.org 2048

!para probarlo cargar los numeros en hexadecimal en el simulador
main: 	srl %r20,16,%r1		!saco el numero que estaria a la derecha
				! y me quedo con el de los dos bytes mas significativos
	sll %r20,16,%r2		!saco el numero que estaria a la izquierda para quedarme con el de los
				!menos significativos
	srl %r2,16,%r2		!acomodo el numero ya que queda corrido

	addcc %r1,%r2,%r20	!hago la  suma de los numeros

	jmpl %r15+4,%r0
.end


