### Ejemplo (2/4)

Escriba un programa que calcule el mayor de dos números enteros:

```c
int a, b, c;
int main(){
    a = 10;
    b = 5;
    max = 0;
    if (a == b)
        printf("%d and %d are equal");
    else {
        if (a > b)
            max = a;
        else
            max = b; 
        printf("The maximum between %d and %d is %d",a,b,max);
    }
}
```