# Ejercicio 6 [Incompleto]

![Enunciado](https://github.com/Lukas-De-Angelis-Riva/Estructura-Assembly/blob/master/Guia6/Ejercicio06/Enunciado.JPG)


## Algoritmo A:
```C
#define Largo 25
#define Ancho 10
int main(){
	int Vol = 6*Ancho*Largo;
}
```
## Algoritmo B:
```C
#define Cte1 25
int main(){
	int Vol = 6*Cte1*10;
}
```
## Algoritmo C:
```C
#define Largo 25
#define Ancho 10
#define Sup Ancho*Largo
int main(){
	int Vol = 6*Sup;
}
```
## Algoritmo D:
```C
#define Cte1 25
#define Cte2 0xB001A012
int main (){
	int Vol = 6*Cte1*Cte2;
}
```

¿Son igual de rápidos? ¿Cuál es la diferencia? Los define se resuelven en tiempo de compilación...