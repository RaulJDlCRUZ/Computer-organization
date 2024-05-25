#include <stdio.h>

int a[10] = {2, 8, 10, 22, 15, 4, 9, 3, 8, 1};
int b[10] = {0, 9, 5, 6, 24, 2, 1, 7, 3, 8};
int c[10];
int iterador = 0;
int aux = 0;

int main()
{
    while (iterador < 10)
    {
        if (a[iterador] > b[iterador])
        {
            c[iterador] = a[iterador];
        }
        else
        {
            c[iterador] = b[iterador];
        }
        iterador++;
    }

    iterador = 1;
    aux = c[0];

    while (iterador < 10)
    {
        if (c[iterador] >= aux)
        {
            aux = c[iterador];
        }
        iterador++;
    }
    printf("El mayor elemento del vector c es: %d\n", aux);
    return 0;
}