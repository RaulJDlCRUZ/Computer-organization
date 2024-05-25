### Ejemplo (3/4)

Realice un programa que calcule la suma de los diez primeros números e imprima su valor
> Este ejemplo asume que el primer número es el cero y no el uno (0 al 9 y no del 1 al 10)
```c
int i = 0, s = 0;
while (i < 10){
    s = s + i;
    i = i + 1;
}
printf("%d",s);
```