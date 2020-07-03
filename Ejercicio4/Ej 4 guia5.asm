!Ejercicio 4 Guia 5 - Crear 2 variables en RAM 
! e intercambiar el contenido entre ellas,
! usar el minimo posible de registros

.begin
.org 2048

x:59	!declaro los valores de las variables en memoria
y:77

ld y,%r0,%r1	!cargo las variables en los registros
ld x,%r0,%r2

st %r1,%r0,x	!intercambio de lugar las variables en memoria
st %r2,%r0,y

.end


