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
Se reemplazan las definiciones en tiempo de compilación: 
```C
int main(){
	int Vol = 6*10*25;
}
```
Y en caso de que se pueda resolver la multiplicación en tiempo de compilación se hace, por lo que:
```C
int main(){
	int Vol = 1500;
}
```
Por lo que en tiempo de ejecución sólo estará el tiempo de asignación de una variable. Ninguna multiplicación.




## Algoritmo B:
```C
#define Cte1 25
int main(){
	int Vol = 6*Cte1*10;
}
```
Ídem caso Algoritmo A
```C
#define Cte1 25
int main(){
	int Vol = 6*25*10;
}
```
```C
#define Cte1 25
int main(){
	int Vol = 1500;
}
```




## Algoritmo C:
```C
#define Largo 25
#define Ancho 10
#define Sup Ancho*Alto
int main(){
	int Vol = 6*Sup;
}
```
Al no existir una definición de Alto esta quedará sin definir por lo que quedará una vez compilado:
```C
int main(){
	int Vol = 6*10*Alto;
}
```
y luego
```C
int main(){
	int Vol = 60*Alto;
}
```
Y entonces se resolvió una multiplicación en tiempo de compilación y otra se resolverá en tiempo de ejecución cuando sea definido Alto.




## Algoritmo D:
```C
#define Cte1 25
#define Cte2 0xB001A012
int main (){
	int Vol = 6*Cte1*Cte2;
}
```
En tiempo de compilación se resuelven las constantes
```C
int main (){
	int Vol = 6*25*0xB001A012;
}
```
Ahora, en tiempo de compilación también se resuelve aún esté un término expresado en hexadecimal, por lo que:
```C
int main (){
	int Vol = 1500;
}
```
Y en tiempo de ejecución tardará lo mismo que el Algoritmo A y el Algoritmo B.

Por lo que, ordenados según tiempo de ejecución:

|Ranking| Algoritmo|
|---|---|
|1|A|
|1|B|
|1|D|
|4|C|
