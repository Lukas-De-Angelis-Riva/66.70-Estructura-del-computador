# Ejercicio 1

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio07/Enunciado.JPG)

```assembly
	addcc %r10, 48, %r1
```
Esta instrucción luego del proceso de ensamblado tendrá la siguiente palabra asociada:

```assembly
	8282A030
```

Se puede ver en la siguiente tabla:
|op1|rd	  |op3   |rs1  |i|simm13|
|---|-----|------|-----|-|------|
|10 |00001|010000|01010|1|0000000110000|

-	Multiplexor de direcciones de la memoria de control:
		
		La entrada indicará un `10` pues deberá activar la instruction decode.
		La salida indicará un `11001000000`.

-	Incrementador de direcciones de la memoria de control:
		Tanto la entrada como la salida indicarán un `11001000001` pues es la dirección siguiente a la salida del CSAMux
-	Multiplexor bus A:

		La entrada:
			Select: `1` Indicando que el valor se toma del campo `rs1` de `%ir`
			A field: `000000` pues no es necesario poner nada.
			0,rs1: `001010` que es el resultado de concatenar 0 con rs1.
		La salida [Decodificador Bus A]: `001010`

-	Multiplexor bus B:

		La entrada:	
			Select: `0` Indicando que el valor se toma del campo `B` de `MIRir`
			B field: `100001` Que refiere al registro `%temp0` en el cual se cargó el valor que estaba contenido en simm13.
			0, rs2:	`010000`
		La salida [Decodificador Bus B]: `100001`

-	Multiplexor bus C:

		La entrada:
			Select: `1` Indicando que el valor se toma del campo `rd` de `%ir`
			C field: `000000` pues no necesario poner nada.
			0, rd: `000001` que es el resultado de concatenar 0 con rd.
		La salida [Decodificador Bus C]: `000001`

-	Bus de datos A B y C:

		El enunciado dice que `%r1 = 0` Por lo que:
		Bus A: `0x00000000h`
		Bus B: `0x00000030h`
		Bus C: `0x00000030h`

-	Entrada de direcciones del módulo de memoria RAM

		RD: `0`
		WR: `0`
		Data In: `0x00000030h` Pues es igual al bus B
		Adress: `0x00000000h`  Pues es igual al bus A
		Data Out: `0x00000000h` Pues no se leyó memoria porque `RD = 0`.
