# Ejercicio 13

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia7/Ejercicio13/Enunciado.JPG)

## Microinstrucción

```assembly
	60:	R[temp0] = NOR(R[0], R[temp0]); IF Z THEN GOTO 64
	61:	R[rd] = INC(R[rs1]);
```

La primera instrucción básicamente sobreescribe el registro temp0 por su negado.
Es decir, si antes poseía el valor de por ejemplo
`0xAEFF01A5h`
Ahora tendrá el valor de:
`0x5100fE5Ah`
sin actualizar los flags.

Luego se fija en el valor Z para saltar, por lo que, el registro de microinstrucción deberá quedar de la siguiente manera:

|   |A|AMUX|B|BMUX|C|CMUX     |RD|WR|ALU|COND| JUMP ADDR|
|---|------|-|------|-|------|-|-|-|----|---|-----------|
|60:|100001|0|000000|0|100001|0|0|0|0111|010|00001000000|
|61:|000000|1|000000|0|000000|1|0|0|1011|000|00000000000|

Remarcar que en la segunda línea