# Ejercicio 19

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio19/Enunciado.JPG)

## Direcciones 1584 - 1588 en microcódigo

```assembly
1584:	R[temp0] = SEXT13(R[ir]); IF IR[13] THEN GOTO 1586

1585:	R[temp0] = OR(R[0], R[rs2]);

1586:	R[temp0] = NOR(R[temp0], R[0]);

1587:	R[temp0] = INC(R[temp0]);

1588:	R[rd] = ADDCC(R[rs1], R[temp0]); GOTO 2047;
```

## 1584

```

A:		100101		! ir
AMUX:	0
B:		000000		! r0
BMUX:	0
C:		100001		! temp0
CMUX:	0
RD:		0
WR:		0
ALU:	1100		! SEXT13(A);
COND:	101			! if IR[13]
JUMP:	00000000010	! Saltar 2 hacia adelante

10010100000000100001000110010100000000010

```

## 1585

```

A:		000000		! r0
AMUX:	0
B:		000000		!
BMUX:	1			! rs2
C:		100001		! temp0
CMUX:	0
RD:		0
WR:		0
ALU:	0110		! OR(A, B);
COND:	000			! NEXT
JUMP:	00000000000

00000000000001100001000011000000000000000

```

## 1586
```

A:		100001		! temp0
AMUX:	0
B:		000000		! r0
BMUX:	0
C:		100001		! temp0
CMUX:	0
RD:		0
WR:		0
ALU:	0111		! OR(A, B);
COND:	000			! NEXT
JUMP:	00000000000

10000100000000100001000011100000000000000

```


## 1587

1587:	R[temp0] = INC(R[temp0]);
```

A:		100001		! temp0
AMUX:	0
B:		000000		! r0
BMUX:	0
C:		100001		! temp0
CMUX:	0
RD:		0
WR:		0
ALU:	1101		! INC(A);
COND:	000			! NEXT
JUMP:	00000000000

10000100000000100001000110100000000000000

```

## 1588

```

A:		000000		!
AMUX:	1			! rs1
B:		100001		! temp0
BMUX:	0
C:		000000		!
CMUX:	1			! rd
RD:		0
WR:		0
ALU:	0011		! ADDCC(A,B);
COND:	110			! Jump always.
JUMP:	00111001011	! 2047 - 1588 = +459

00000011000010000000100001111000111001011
```


## Contenido binario:

| address | contenido|
| ---- | ----------------------------------------|
| 1584 |10010100000000100001000110010100000000010|
| 1585 |00000000000001100001000011000000000000000|
| 1586 |10000100000000100001000011100000000000000|
| 1587 |10000100000000100001000110100000000000000|
| 1588 |00000011000010000000100001111000111001011|