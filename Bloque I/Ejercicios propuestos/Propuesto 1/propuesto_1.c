#include <stdio.h>

int main()
{
    int i;
    int a[100], b[100];
    for (i=0; i<100; i++)
        a[i] = a[i] + b[i];
    return 0;
}