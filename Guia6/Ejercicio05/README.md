# Ejercicio 5

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia6/Ejercicio05/Enunciado.JPG)

## Tabla de símbolos A

| Símbolo | Valor |
| --- | --- |
| subrut | 2048 |

## Tabla de símbolos B

| Símbolo | Valor |
| --- | --- |
| subrut | extern |
| main | 2048 |
| x | 2064 |
| y | 2068 |

## Definiciones:
Link-editor:
`Produce una versión linkeada del programa que normalmente es guardada en archivo para ser ejecutada en otro momento.`

Linking loader:
`Linkea en tiempo de carga.
Relocaliza, busca automáticamente bibliotecas, linkea y carga el
programa en memoria para su ejecución.`

## Cambios por linker editor 	
El linker deberá resolver la colisión y aquellos los símbolos que fueron marcados como externos.

Por lo que, el nuevo archivo será el siguiente:

## Representación cuantitativa en assembly // Código objeto (Lo que realmente se resuelve)
```assembly
	.begin									
		.org 2048								
	u	.equ 1									
2048 subrut:	orncc %r3, %r0, %r3		86b0c000
2052		addcc %r3, u, %r3		8680e001
2056		jmpl %r15, 4, %r0		81c3e004
		.end									
		.begin									
		.org 2060								
2060 main:	ld [x], %r2			c400281c
2064		ld [y], %r3			c6002820
2068		call subrut			7ffffffb
2072		jmpl %r15, 4, %r0		81c3e004
2076		x:	2			00000002
2080		y:	10			0000000a
	.end											
```


## Cambios por linker Loader


## Representación cuantitativa en assembly // Código objeto (Lo que realmente pasa)
```assembly


```
