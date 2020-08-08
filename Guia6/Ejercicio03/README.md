# Ejercicio 3

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia6/Ejercicio03/Enunciado.JPG)


## for
Estructura de control en C:
```C
for(i = 0; i < N; i++){
	sentencia
}
```
Equivalencia en Assembly:

```assembly
		.begin					! r1 = i
		.org 2048
N:		.equ [número]			! Asignar a N el número necesario.
		add %r0, %r0, %r1		! i = 0
		subcc %r1, N, %r0		! Actualizo flags, si está habilitado el z = 1. Quiere decir que finalizó.
for:	be fin
		sentencia				! Sin perder generalidad, supongamos que se trata de 1 sola línea.
		add %r1, 1, %r1			! i++
		subcc %r1, N, %r0		! Actualizo flags, si está habilitado el z = 1. Quiere decir que finalizó.
		ba for
fin:	...
```

Por lo que, la tabla de símbolos quedará:
|Símbolo| Valor |
|  ---	|  ---	|
|  N 	| número|
| for 	| 2056 	|
| fin 	| 2076 	|


## while
Estructura de control en C:
```C
while ((c = getchar()) == ‘ ‘ || c == ‘\n’ || c == ‘\t’) sentencia
```

```assembly
		.begin					! r1 = c
		.org 2048
		.extern getchar
sp 		.equ 32
cr: 	.equ 13
tab:	.equ 9
while:	call getchar			! getchar pondrá sobre r1 el caracter que leyó.
		subcc %r1, sp, %r0		! c == ‘ ‘
		be cod 					! ejecutá la sentencia.
		subcc %r1, cr, %r0		! c == ‘\n‘
		be cod
		subcc %r1, tab, %r0		! c == ‘\t‘
		be cod
		ba fin 					! Si ninguna se cumplió, terminá
cod:	sentencia				! Sin perder generalidad, supongamos que se trata de 1 sola línea.
		ba while				! Iterá.
fin:	...
```


Por lo que, la tabla de símbolos quedará:
|Símbolo 	| Valor 	|
|   ---		|    ---	|
| getchar 	|  [extern]	|
| sp 		|		 32 |
| cr 		|		 13	|
| tab 		|		  9	|
| while		|	   2048	|
| cod 		|	   2080	|
| fin 		|	   2088	|