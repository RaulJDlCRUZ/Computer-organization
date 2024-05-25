### Ejemplo (4/4)

Escriba un programa en ensamblador que calcule el número de caracteres en una cadena (string) definida por el programador

```c
#include <stdio.h>

int main()
{
    char* cadena = "Esto es una cadena";
    int i=0;
    while (*cadena != '\0'){
        i = i + 1;
        *cadena++;
    }
    printf("%d",i);
    return 0;
}
```