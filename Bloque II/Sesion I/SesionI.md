## Sesión I WinMIPS64

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

Código ensamblador tomado: **Producto Escalar**.
- 2 vectores de doble precisión.
- 10 elementos cada vector.

### [`ProdEsc.s`](ProdEsc.s)
Simular el ejemplo `ProdEsc.s` sin ninguna mejora:
- Branch Target Buffer
- Delay Slot

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
    228 Cycles<br>
    73 Instructions<br>
    3.123 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    142 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    0 Structural Stalls<br>
    9 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    40 Bytes<br></p>
</div>


</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    110 Cycles<br>
    73 Instructions<br>
    1.507 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    90 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    1 Structural Stalls<br>
    9 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    40 Bytes<br></p>
</div>

</td>
</tr>
</table>
</div>

<center>¿Cuando puede utilizar mult.d el dato en <code>$f2</code>? En el ciclo 10 sin forwarding, en el ciclo 6 con forwarding.</center>

### [`ProdEsc_b.s`](ProdEsc_b.s)

Simular el ejemplo ProdEsc_b.s habilitando "Delay Slot".


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
    217 Cycles<br>
    74 Instructions<br>
    2.932 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    139 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    0 Structural Stalls<br>
    0 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    44 Bytes<br></p>
</div>


</td>
<td>

<div class="left-aligned">
    <p><span style="color: #ff0000">Execution</span><br>
    111 Cycles<br>
    74 Instructions<br>
    1.500 Cycles Per Instruction (CPI)<br>
    <br>
    <p><span style="color: #ff0000">Stalls</span><br>
    90 RAW Stalls<br>
    0 WAW Stalls<br>
    0 WAR Stalls<br>
    10 Structural Stalls<br>
    0 Branch Taken Stalls<br>
    0 Branch Misprediction Stalls<br>
    <br>
    <p><span style="color: #ff0000">Code size</span><br>
    44 Bytes<br></p>
</div>

</td>
</tr>
</table>
</div>

<p>En comparación con la simulación de <code>PordEsc.s</code> <u>sin mejoras</u> se ahorra 9 "Brach taken stall" y 3 dependencias RAW. Lo único a considerar de este código es que sin DS no ejecuta la siguiente instrucción hasta después de ID (en ese momento sabe si se va a saltar o no), mientras que con DS <u>SIEMPRE</u> ejecuta la instrucción posterior al salto
 </p>