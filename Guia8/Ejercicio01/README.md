# Ejercicio 1

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/Enunciado.JPG)


## Más bits

Para conseguir más bits por dirección se pueden disponer las memorias de la siguiente manera


![Serie1](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/MemoriasSerie.png)

De manera tal que se puedan conseguir por cada dirección de memoria 4 bits por cada memoria, por lo que habrán 8 bits, es decir 1 byte.

Por lo que, se puede representar con la siguiente memoria equivalente:
![Equivalente1](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/MemoriasEquivalente1.png)

## Más direcciones

Para conseguir más direcciones de memoria a partir de memorias de menos direccionamientos se pueden disponer dos memorias de la siguiente manera:

![Paralelo1](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/MemoriasParalelo.png)

De manera que, con el demultiplexor se podrá habilitar una memoria o la otra, dependiendo del bit más significativo ingresado. Duplicando así las direcciones de memoria disponibles.

Nuevamente lo representaremos de la siguiente manera:

![Equivalente2](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/MemoriasEquivalente2.png)

Repitiendo el mismo procedimiento pero con el equivalente recién planteado se obtiene lo siguiente:

![Paralelo2](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/MemoriasParalelo2.png)

Planteando el equivalente:

![Equivalente3](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/MemoriasEquivalente3.png)

Obteniendo así la memoria pedida en el enunciado.


Por lo que a grandes rasgos (Sin entrar en detalles) las memorias deberán estar dispuestas de la siguiente manera:

![final](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia8/Ejercicio01/final.png)
