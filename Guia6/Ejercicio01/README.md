# Ejercicio 1

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia6/Ejercicio01/Enunciado.JPG)

## Tabla de símbolos:
| Símbolo| Valor |
| --- | --- |
| main | 2048 |
| MiFun | [externa] |
| cte22 | 2621440 |
| cte10 | 16 |
| set | 2060 |
| fin | 2084 |
| Disp | 10485764 |

Aquellas líneas de código que no tendrán representación en RAM serán las directivas de ensamblador:

```assembly
	.org 		2048
	.global 	main
	.extern 	MiFun
cte22 	.equ 		280000h
cte10 	.equ 		010h
	.org 		A00004h
Disp: 	.dwb 		1
```

Pues se resuelven en tiempo de ensamblado.
