# Ejercicio 9

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio09/Enunciado.JPG)

La entrada `ACK` del término _Acknowledge_ está conectada estratégicamente:

Murdocca página 208: _Una operación de lectura requiere normalmente más tiempo para completar su ejecución que el tiempo requerido para la ejecución de una microinstrucción. El tiempo de acceso a la memoria principal varía según la organización de la memoria... Con el objeto de considerar las variaciones en los tiempos de acceso de la memoria, el circuito que incrementa las direcciones de la memoria de control (CSAI) no lleva a cabo el incremento de la dirección hasta que no se haya recibido una señal de reconocimiento (ACK) que indique que la memoria ha completado su operación_

Por lo que:

1. Suponiendo que la señal de reconocimiento indica que se completo la operación con un 1:

	El CSAI no verá nunca una señal de reconocimiento y por tanto no incrementará las direcciones provocando que la computadora quede congelada.

2. Suponiendo que la señal de reconocimiento indica que se completo la operación con un 0:
	
	El CSAI verá constantemente la señal de reconocimiento por lo que avanzará sin esperar a los retardos de la memoria RAM. Esto además de trivialmente dejar en desuso a la memoria RAM pues sus datos nunca llegarán en el momento indicado podría provocar sobreescrituras inesperadas sobre esta misma.

En ambos casos no sería una buena idea D:
