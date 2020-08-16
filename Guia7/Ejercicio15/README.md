# Ejercicio 15

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio15/Enunciado.JPG)


## Primera instrucción

A: 37

AMUX: 0 -> Debo habilitar en el bus A el contenido del registro N°37 aka `%ir`

B: 0

BMUX: 0 -> Debo habilitar en el bus B el contenido del registro N°0 aka `%r0`

C: 33

CMUX: 0 -> Debo habilitar para el bus C la entrada del registro N°33 aka `%temp0`

RD: 0   -> No leer.

WR: 0   -> No escribir.

ALU: 1100h -> La instrucción a relizar es SEXT13

COND: 000 -> La próxima instrucción es la siguiente.

JUMP ADDR: 0

Por lo que, en mnemónicos quedará:
```
R[temp0] = SEXT13(R[ir]);
```

## Segunda instrucción

A: 0

AMUX: 1 -> Debo habilitar en el bus A el contenido del registro que establezca rs1

B: 33

BMUX: 0 -> Debo habilitar en el bus B el contenido del registro N°33 aka `%temp0`

C: 33

CMUX: 0 -> Debo habilitar para el bus C la entrada del registro N°33 aka `%temp0`

RD: 0   -> No leer.

WR: 0   -> No escribir.

ALU: 1000h -> La instrucción a realizar es ADD

COND: 110 -> Salto incondicional.

JUMP ADDR: -255 [Saltar 255 hacia atrás]

Por lo que, en mnemónicos quedará:
```
R[temp0] = ADD(R[rs1], R[temp0]); GOTO -255
```

## Tercera instrucción

A: 0

AMUX: 1 -> Habilitar rs1

B: 0

BMUX: 1 -> Habilitar rs2

C: 33

CMUX: 0 -> Guardar en `%temp0`

RD: 0

WR: 0

ALU: 1000h -> La instrucción a realizar es ADD 

COND: 101 -> if IR[13] = 1

JUMP ADDR: -238 [Saltar 238 hacia atrás]

Por lo que, en mnemónicos quedará:

```
R[temp0] = ADD(R[rs1], R[rs2]); IF IR[13] = 1 THEN GOTO -238
```
