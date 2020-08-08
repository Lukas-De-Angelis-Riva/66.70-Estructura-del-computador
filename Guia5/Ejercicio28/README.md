# Ejercicio 28

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia5/Ejercicio28/Enunciado.JPG)


## Resolución:
![Resolucion](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia5/Ejercicio28/Resolucion.JPG)

El código tiene dos problemas:

* add %r0, Dir, %r1. Siendo que Dir = 10000 > 8096. Por lo que no es posible.

* ld [array + 4], %r2. Siendo array = A1010002h > 1FFFh. Por lo que, tampoco es posible.
