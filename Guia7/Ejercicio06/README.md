# Ejercicio 6

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio06/Enunciado.JPG)


## Ciclo de búsqueda-ejecucíón:

1. Buscar en memoria la próxima instrucción a ser ejecutada

2. Decodificar el código de operación de esa instrucción

3. Ejecutar la instrucción

4. Volver a 1.

## Detalles:
Microarquitectura conformada por dos secciones

1. Sección de datos o datapath
2. Sección de control

En la sigui ente figura se podrá observar la microarquitectura de ARC.

![Micro](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio06/ComponentesMicro.JPG)

A continuación en detalle la microinstrucción:

![Microinstrucción](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio06/Microinstruccion.JPG)

1. El primer paso del ciclo de búsqueda-ejecución es buscar en memoria la próxima instrucción a ejecutar, por lo que esta se levanta de memoria según el program counter [PC] quien apunta a la próxima instrucción a ser ejecutada y esta se escribe sobre el registro %ir.

2. Se decodifica el código de la operación asociada a la instrucción escrita en %ir. De esto se encarga el CS Adress MUX.
Quien recibe como entrada la salida del componente CBL (Control branch logic)

`
	
	00: Next.
	
	01: Jump.
	
	10: Instruction decode.
	
`

En caso de que el CSAMux reciba 00 irá a la microinstrucción siguiente, es decir, 4 palabras de 41bits más adelante (Que lee desde el CSAI).

En caso de que el CSAMux reciba 01 hará la lógica para saltar a la instrucción deseada (Que lee desde la entrada 'Jump').

En caso de que el CSAMux reciba 10 tendrá que decodificar sobre los diferentes ops escritos en el registro %ir de manera tal que genere una palabra de 11bits, conformados de la siguiente manera

```
     |     op3   |   
1 _ _ _ _ _ _ _ _ 0 0
 |op | op2 |
```

De manera que se genere, para cada posible combinación de ops un código univoco que direcciona una dirección de memoria de 4 palabras de 41 bits referidas al Control Store.

De manera tal que, para cada instrucción escrita en %ir existe un algoritmo de 4 palabras escrito en microcódigo que ejecuta dicha instrucción mediante conexiones a las diferentes componentes.

3. Ejecutar la instrucción significa ejecutar las 4 líneas de microcódigo definidas de fábrica en el Control Store.

4. Para repetir el paso 1 cada instrucción de microcódigo debe terminar con una lógica que permita que automáticamente se vuelva a repetir todo. En general las instrucciones de microcódigo terminar en un GOTO 0. De manera tal que es esas primeras palabras (Que cabe aclarar están reservadas, pues aquel 1 en el DECODE así lo requiere) traen la lógica necesaria para repetir nuevamente el paso 1.
