# Ejercicio 17

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio17/Enunciado.JPG)

## Microinstrucción de call 4 líneas.
```assembly
1280:	R[15] 		= AND(R[pc], R[pc]);			! Guarda R[pc] en R[15]
1281:	R[temp0] 	= ADD(R[ir], R[ir]);			! Multiplica por 2 a ir.
1282:	R[temp0]	= ADD(R[temp0], R[temp0]);		! Multiplica por 4 a ir.
1283:	R[pc]		= ADD(R[pc], R[temp0]); GOTO 0	! Cambia la dirección de R[pc]
```

## Microinstrucción de call en 3 líneas.

```assembly
1280:	R[15] 		= AND(R[pc], R[pc]);
1281:	R[temp0] 	= LSHIFT2(R[ir]);				! Mutiplica por 4 a ir
1282:	R[pc]		= ADD(R[pc], R[temp0]); GOTO 0
1283:
```