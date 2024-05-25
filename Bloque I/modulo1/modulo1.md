## Ejercicio Módulo I. Ensamblador

Considere tres vectores `a`, `b` y `c`, compuestos de _n_ enteros positivos de tamaño _palabra_. Los vectores a y b se inicializan con valores dados. Escriba un programa en Ensamblador del MIPS32, tal que:
> `c[n] = mayor(a[n], b[n])`

Tomando a y b los valores:
- a = (2, 8, 10, 22, 15, 4, 9, 3, 8,1)
- b = (0, 9, 5, 6, 24, 2, 1,7, 3, 8)

Antes de finalizar su ejecución, el programa debe imprimir por pantalla el siguiente mensaje:
- _El número mayor del vector c es: <n_max>_

Consideraciones:
- Se valora que cada comprobación llame a una subrutina que equivalga a la función:
    - `C[n] = devuelveMayor(A[n], B[n])`

## Cuestiones
### 1. Describa en lenguaje de programación de alto nivel o pseudocódigo el programa.
El código en lenguaje C se encuentra [aquí](/Bloque%20I/modulo1/modulo1.c)
### 2. Tabla según la memoria del simulador:
<div align="center">
<table><thead>
  <tr>
    <th></th>
    <th colspan="2"><center>A</center></th>
    <th colspan="2"><center>B</center></th>
    <th colspan="2"><center>C</center></th>
  </tr></thead>
<tbody>
  <tr>
    <td><i>n</i></td>
    <td>Dirección de memoria</td>
    <td>Valor (decimal)</td>
    <td>Dirección de memoria</td>
    <td>Valor (decimal)</td>
    <td>Dirección de memoria</td>
    <td>Valor (decimal)</td>
  </tr>
  <tr>
    <td>0</td>
    <td>0x200000</td>
    <td>2</td>
    <td>0x200028</td>
    <td>0</td>
    <td>0x200050</td>
    <td>2</td>
  </tr>
  <tr>
    <td>1</td>
    <td>0x200004</td>
    <td>8</td>
    <td>0x20002C</td>
    <td>9</td>
    <td>0x200054</td>
    <td>9</td>
  </tr>
  <tr>
    <td>2</td>
    <td>0x200008</td>
    <td>10</td>
    <td>0x200030</td>
    <td>5</td>
    <td>0x200058</td>
    <td>10</td>
  </tr>
  <tr>
    <td>3</td>
    <td>0x20000C</td>
    <td>22</td>
    <td>0x200034</td>
    <td>6</td>
    <td>0x20005C</td>
    <td>22</td>
  </tr>
  <tr>
    <td>4</td>
    <td>0x200010</td>
    <td>15</td>
    <td>0x200038</td>
    <td>24</td>
    <td>0x200060</td>
    <td>24</td>
  </tr>
  <tr>
    <td>5</td>
    <td>0x200014</td>
    <td>4</td>
    <td>0x20003C</td>
    <td>2</td>
    <td>0x200064</td>
    <td>4</td>
  </tr>
  <tr>
    <td>6</td>
    <td>0x200018</td>
    <td>9</td>
    <td>0x200040</td>
    <td>1</td>
    <td>0x200068</td>
    <td>9</td>
  </tr>
  <tr>
    <td>7</td>
    <td>0x20001C</td>
    <td>3</td>
    <td>0x200044</td>
    <td>7</td>
    <td>0x20006C</td>
    <td>7</td>
  </tr>
  <tr>
    <td>8</td>
    <td>0x200020</td>
    <td>8</td>
    <td>0x200048</td>
    <td>3</td>
    <td>0x200070</td>
    <td>8</td>
  </tr>
  <tr>
    <td>9</td>
    <td>0x200024</td>
    <td>1</td>
    <td>0x10004C</td>
    <td>8</td>
    <td>0x200074</td>
    <td>8</td>
  </tr>
</tbody></table>
</div>

### 3. ¿Cuántos bytes ocupa la estructura de datos a?

La estructura de datos de tipo _array_ `a` ocupa un **total 40 bytes**, ya que cada tamaño de palabra es de 4 bytes (4 direcciones de memoria), y cada array le asigno 10 elementos o espacios. Por lo tanto, son $10 ∗ 4 = 40$ direcciones de memoria.

### 4. Indique los valores de los registros `$a0` y `$v0` al finalizar la ejecución del programa. ¿Qué significa?

Al finalizar la ejecución del programa, el registro `$v0` tendrá el valor **10**, código numérico para la _llamada de servicio a sistema que se encargará de finalizar el programa_.

Por otro lado, el registro `$a0` será del **24**. Esto se debe a que, para _imprimir un entero por pantalla_, éste se debe pasar a `$a0` (registro que almacena argumentos), tras pasar al registro `$v0` el código de servicio "1" y hacer una llamada a sistema o '_syscall_'. 

### 5. Escriba el código del programa CONVENIENTEMENTE COMENTADO en Ensamblador de MIPS32.

El código en lenguaje ensamblador se encuentra [aquí](/Bloque%20I/modulo1/PB_RJ_modulo1.s)