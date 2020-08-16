# Ejercicio 14

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio14/Enunciado.JPG)

Simplemente con establecer lo siguiente:

| C| CMUX|
|------|-|
|000000|0|


Sería suficiente pues estoy forzando a guardar la información en el registro que establecí en C, que es `%r0` de manera tal que ningún registro de propósito general se vea afectado.

En caso de que el valor que se devuelve por la operación de la ALU deba ser almacenado en algún lugar existen (al menos 2) diferentes opciones:

1. Guardarlo en un registro temporal.

2. Guardarlo en memoria.