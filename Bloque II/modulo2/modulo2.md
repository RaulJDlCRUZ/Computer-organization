## Ejercicio Módulo II. Simulaciones con WinMIPS64

<style>
.centered {
    display: flex;
    justify-content: center;
    width: 100%;
}
.left-aligned {
    text-align: left;
    font-family: 'Courier New';
}
</style>

Guarde el código llamado [`Codigo.s`](./Codigo.s) para simular en WINMIPS64.

### 1. Ahora realice simulaciones sin ningún tipo de optimizaciones. Observe el resultado de las mismas.

<div class="centered">
    <div class="left-aligned">
        <p><span style="color: #ff0000">Execution</span><br>
        389 Cycles<br>
        165 Instructions<br>
        2.358 Cycles Per Instruction (CPI)<br>
        <br>
        <p><span style="color: #ff0000">Stalls</span><br>
        181 RAW Stalls<br>
        0 WAW Stalls<br>
        0 WAR Stalls<br>
        20 Structural Stalls<br>
        19 Branch Taken Stalls<br>
        0 Branch Misprediction Stalls<br>
        <br>
        <p><span style="color: #ff0000">Code size</span><br>
        52 Bytes<br></p>
    </div>
</div>

>:warning: Nótese que para el resto se optimizaciones y mejoras no se tendrá en cuenta el Branch Target Buffer (Búfer de destino o predictor de saltos) por simplicidad.

### 2. Aplicando las optimizaciones realizadas en la primera clase, vuelva a simular el código y revise el resultado.

<div class="centered">
<table>
<tr>
<th> Forwarding </th>
<th> Delay Slot (DS) </th>
<th> Forwarding + Delay Slot </th>
</tr>
<tr>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    249 Cycles<br>
    165 Instructions<br>
    1.509 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    100 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    40 Structural Stalls<br>
    19 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    52 Bytes<br></p>
</div>

</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    28 Cycles<br>
    13 Instructions<br>
    2.154 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    10 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    1 Structural Stalls<br>
    0 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    52 Bytes<br></p>
</div>

</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    21 Cycles<br>
    13 Instructions<br>
    1.615 Cycles Per Instruction (CPI)<br></p>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    5 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    2 Structural Stalls<br>
    0 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br></p>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    52 Bytes<br></p>
</div>

</td>

</tr>
</table>
</div>
</div>

El DS en este punto no es viable (pese a parecer una gran mejora); en el registro `$f6` da un resultado completamente distinto dado que el bucle solo lo hace una vez, ya que el DS, cuando está activado, ejecuta la instrucción posterior a la del salto **bne**, que en este caso es **halt**, que equivale a terminar el programa. _El Delay Slot no será viable hasta que la instrucción inmediatamente posterior del salto no sea la última._

<div class="centered">
    <div class="left-aligned">
        <p>
        R0=&nbsp 0000000000000000   &nbsp F0=&nbsp 0000001.00000000<br>
        R1=&nbsp 0000000000000008   &nbsp F1=&nbsp 0000000.00000000<br>
        R2=&nbsp 00000000000000a8   &nbsp F2=&nbsp 0000000.00000000<br>
        R3=&nbsp 0000000000000014   &nbsp F3=&nbsp 0000002.00000000<br>
        R4=&nbsp 0000000000000001   &nbsp F4=&nbsp 0000000.00000000<br>
        R5=&nbsp 0000000000000000   &nbsp F5=&nbsp 0000002.00000000<br>
        R6=&nbsp 0000000000000000   &nbsp F6=&nbsp 0000000.00000000<br>
        R7=&nbsp 0000000000000000   &nbsp F7=&nbsp 0000000.00000000<br>
        R8=&nbsp 0000000000000000   &nbsp F8=&nbsp 0000000.00000000<br>
        R9=&nbsp 0000000000000000   &nbsp F9=&nbsp 0000000.00000000<br>
        R10= 0000000000000000       &nbsp F10= 0000000.00000000<br>
        R11= 0000000000000000       &nbsp F11= 0000000.00000000<br>
        R12= 0000000000000000       &nbsp F12= 0000000.00000000<br>
        R13= 0000000000000000       &nbsp F13= 0000000.00000000<br>
        R14= 0000000000000000       &nbsp F14= 0000000.00000000<br>
        R15= 0000000000000000       &nbsp F15= 0000000.00000000<br>
        R16= 0000000000000000       &nbsp F16= 0000000.00000000<br>
        R17= 0000000000000000       &nbsp F17= 0000000.00000000<br>
        R18= 0000000000000000       &nbsp F18= 0000000.00000000<br>
        R19= 0000000000000000       &nbsp F19= 0000000.00000000<br>
        R20= 0000000000000000       &nbsp F20= 0000000.00000000<br>
        R21= 0000000000000000       &nbsp F21= 0000000.00000000<br>
        R22= 0000000000000000       &nbsp F22= 0000000.00000000<br>
        R23= 0000000000000000       &nbsp F23= 0000000.00000000<br>
    </div>
</div>

<div align="center">
	<br>
	<a href="https://github.com/RaulJDlCRUZ/Computer-organization/blob/master/res/example.svg">
		<img src="example.svg" width="800" height="400" alt="¡Imagen original aquí!">
	</a>
	<br>
</div>

<center>Banco de registros tras ejecutarse Codigo1.s con DS</center>

### 3. Aplique la técnica de desenrrollado de bucles al código anterior
> guarde el resultado en un fichero diferente, llamado `Codigo2.s`

#### Paso 1

El primer paso para poder desenrollar un bucle será replicar código, copiando las instrucciones que se ejecutarán en una misma iteración. En este caso, vamos a desenroscar el bucle en ‘cuatro bloques’, de manera que en una misma iteración vamos a utilizar 8 direcciones de memoria en lugar de 2 e incrementar el registro iterador de cuatro en cuatro. Con esto logramos pasar por la instrucción de salto 4 veces menos. El código resultante se encuentra [aquí](./Pasos%20intermedios/Desenrollado.s)

<div class="centered">
<table>
<tr>
<th> Sin forwarding </th>
<th> Con forwarding </th>
</tr>
<tr>
<td>


<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    269 Cycles<br>
    105 Instructions<br>
    2.562 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    151 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    5 Structural Stalls<br>
    4 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>


</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    159 Cycles<br>
    105 Instructions<br>
    1.514 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    85 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    25 Structural Stalls<br>
    4 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>

</td>
</tr>
</table>
</div>

Tenemos un menor número de instrucciones, número de ciclos, menores RAW Stalls y Structural Stalls, a cambio de un mayor tamaño de código (reflejado en el Code size). La activación del Forwarding disminuye drásticamente el número de RAW, aunque aumenten los Structural Stalls.

#### Paso 2

El siguiente paso para nuestro desenrollado es **utilizar más registros** (en este caso registros de tipo coma flotante) en la medida de lo posible, para _evitar esperas de lectura y escritura de los mismos registros_ (en este caso `$f0` y `$f2`). De nuevo, a costa del aumento de recursos de memoria, aceleramos la velocidad de ejecución. El código resultante se encuentra [aquí](./Pasos%20intermedios/Registros.s)

<div class="centered">
<table>
<tr>
<th> Sin forwarding </th>
<th> Con forwarding </th>
</tr>
<tr>
<td>


<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    269 Cycles<br>
    105 Instructions<br>
    2.562 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    151 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    5 Structural Stalls<br>
    4 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>


</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    159 Cycles<br>
    105 Instructions<br>
    1.514 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    85 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    25 Structural Stalls<br>
    4 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>

</td>
</tr>
</table>
</div>

Como podemos apreciar, **no hay ninguna mejora en comparación con el paso anterior**. Esto se debe a que, aunque usemos más registros, _las instrucciones de suma no están colocadas de manera eficiente junto con las instrucciones de carga en registro_, tal y como sucede en el Paso 1.

#### Paso 3

Para este tercer paso, **se han agrupado todas las instrucciones de carga de registro y de suma**, con el fin de, junto con el mayor uso de registros, _disminuir el número de Stalls_. El código de este paso se encuentra [aquí](./Pasos%20intermedios/Reorganizacion.s)

<div class="centered">
<table>
<tr>
<th> Sin forwarding </th>
<th> Con forwarding </th>
</tr>
<tr>
<td>


<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    229 Cycles<br>
    105 Instructions<br>
    2.181 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    111 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    5 Structural Stalls<br>
    4 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>


</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    173 Cycles<br>
    105 Instructions<br>
    1.648 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    65 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    10 Structural Stalls<br>
    4 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>

</td>
</tr>
</table>
</div>

Como podemos comprobar, _sin forwarding_, del segundo al tercer paso, tenemos una _mejoría_ tanto en número de ciclos como en Stalls.<br>
Con _forwarding hay una leve empeora en el número de ciclos_. Esto se debe a que del paso 2 al paso 3 _hemos quitado las instrucciones intermedias  que existían entre acumulaciones en el registro `$f6`_.
La consecuencia de esto es que **el procesador esperará más tiempo a que se complete la suma en `$f6` y no puede ejecutar tantas instrucciones entre medias**. Esto lo solucionaremos en el cuarto paso, con el adelantamiento de instrucciones y uso del desplazamiento negativo en los `l.d`.

#### Paso 4 (el actual [`Codigo2.s`](/Bloque%20II/modulo2/Codigo2.s))

<p>El cuarto y último paso será <b>reordenar instrucciones</b>. Dado a que se presentan algunos Stalls por la constante adición de números en el registro <code>f6</code>, vamos a adeltantar algunas instrucciones para evitar esperas innecesarias.</p>

<p>Así pues, <i>adelantaremos cargas de registros</i>, algunas sumas e incrementos de direcciones de memoria. Esto implica en alguna ocasión de usar un desplazamiento negativo para poder acceder al espacio de memoria correcto.</p>

También <i>se ha colocado una instrucción después del salto, por lo que <u>para ejecutar este código requerirá de tener activado el Delay Slot</u>, de lo contrario el resultado del programa será incorrecto</i>. Por ello, se presentará una comparación de la ejecución del código, activando o no el forwarding (DS siempre activado):

<div class="centered">
<table>
<tr>
<th> Sin forwarding </th>
<th> Con forwarding </th>
</tr>
<tr>
<td>


<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    171 Cycles<br>
    105 Instructions<br>
    1.629 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    45 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    29 Structural Stalls<br>
    0 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>


</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    126 Cycles<br>
    105 Instructions<br>
    1.200 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    5 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    29 Structural Stalls<br>
    0 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    100 Bytes<br></p>
</div>

</td>
</tr>
</table>
</div>

Como se puede apreciar, han disminuido considerablemente los ciclos y Stalls, **obteniendo finalmente 126 ciclos**, la cifra más baja de ciclos, con una ejecución correcta y realista.
<p>
Esto se debe a que <i>hemos minimizado todo lo posible las esperas de escritura en <code>$f6</code>, sacrificando para ello las paradas de tipo Structural</i>. Las únicas paradas que quedan de tipo RAW se deben a las insuficientes instrucciones que hay entre <code>add.d f6,f6,f18</code> y <code>add.d f6,f6,f24</code>. 
</p>

### Diferencia de Rendimiento

$$
\dfrac{Nciclos_{anterior}}{Nciclos_{nuevo}}=\dfrac{389}{126}=3,087302
$$

<h3 style="text-align: center;"><b>El nuevo programa ensamblador es 3 veces más rápido que el base</b></h3>