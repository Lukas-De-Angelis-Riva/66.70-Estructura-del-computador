# Ejercicio 4

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia6/Ejercicio04/Enunciado.JPG)


## Código:
```assembly
		.begin
		.org 2048
main: 		or %r0, %r15, %r16
		ld %r14, %r1
		call separa
		st %r2, %r14
		add %r14, -4, %r14
		st %r3, %r14
		jmpl %r16, 4, %r0
separa:		sra %r1, 16, %r2
		sll %r1, 16, %r3
		sra %r3, 16, %r3
		jmpl %r15, 4, %r0
		.end
```

## Tabla de símbolos

| Símbolos | Valor |
|---|---|
| main   | 2048   |
| separa | 2076 |

## Código ensamblado // Código objeto

```assembly
2048 main:		or %r0, %r15, %r16			a010000f
2052			ld %r14, %r1 				c2038000
2056			call separa				40000005
2060			st %r2, %r14				c4238000
2064			add %r14, -4, %r14			9c03bffc
2068			st %r3, %r14				c6238000
2072			jmpl %r16, 4, %r0			81c42004
2076 separa:		sra %r1, 16, %r2			85386010
2080			sll %r1, 16, %r3			87286010
2084			sra %r3, 16, %r3			8738e010
2088			jmpl %r15, 4, %r0			81c3e004
```

Por lo que, el archivo con código objeto pesa 44 bytes.



## Código:
```assembly
		.begin
		.org 2048
		.macro separa Reg1, Reg2, Reg3
			sra Reg1, 16, Reg2
			sll Reg1, 16, Reg3
			sra Reg3, 16, Reg3
		.endmacro
main:		ld %r14, %r1
		separa %r1, %r2, %r3
		st %r2, %r14
		add %r14, -4, %r14
		st %r3, %r14
		jmpl %r15, 4, %r0
		.end
```

Primera pasada del ensamblador, extiende las macros:

## Código con extensión de macros

```assembly
		.begin
		.org 2048
main:		ld %r14, %r1
		sra %r1, 16, %r2
		sll %r1, 16, %r3
		sra %r3, 16, %r3
		st %r2, %r14	
		add %r14, -4, %r14
		st %r3, %r14
		jmpl %r15, 4, %r0
		.end
```


## Tabla de símbolos

| Símbolos | Valor |
|---|---|
| main   | 2048   |

## Código ensamblado // Código objeto

```assembly
2048 main:		ld %r14, %r1 				c2038000
2052			sra %r1, 16, %r2 			85386010
2056			sll %r1, 16, %r3 			87286010
2060			sra %r3, 16, %r3 			8738e010
2064			st %r2, %r14				c4238000
2068			add %r14, -4, %r14 			9c03bffc
2072			st %r3, %r14 				c6238000
2076			jmpl %r15, 4, %r0 			81c3e004
```

Por lo que, el archivo con código objeto pesa 32 bytes.

[No encontré cómo utilizar en reloj del simulador, sin embargo es notable que el segundo algoritmo será más eficiente]
