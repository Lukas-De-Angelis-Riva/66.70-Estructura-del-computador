# Ejercicio 10

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio10/Enunciado.JPG)


Como se puede ver en la siguiente figura, el bit al que hace referencia el ejercicio se trata del siguiente:
![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio10/MIR13.png)


Dada la tabla de condición:

|C2|C1|C0|Operación			 		|
|--|--|--|--------------------------|
| 0| 0| 0| NEXT ADDR 		 		|
| 0| 0| 1| JUMP ADDR if n = 1		|
| 0| 1| 0| JUMP ADDR if z = 1		|
| 0| 1| 1| JUMP ADDR if v = 1		|
| 1| 0| 0| JUMP ADDR if c = 1		|
| 1| 0| 1| JUMP ADDR if IR[13] = 1	|
| 1| 1| 0| JUMP ADDR 		 		|
| 1| 1| 1| DECODE	 		 		|

Por lo que, siendo que C2 = MIR[13]. De ninguna manera se le podría pedir al CSAMUX que escriba sobre el MIR la siguiente instrucción, es decir, no podría utilizar la operación NEXT ADDR, esto provocaría que no se pueda ejecutar ningún algoritmo definido en las 2048 palabras de microinstrucciones.

Dejando a la computadora en un estado inútil.