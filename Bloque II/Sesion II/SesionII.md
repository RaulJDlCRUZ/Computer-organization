## Sesión II WinMIPS64

### Reordenación

**Adelantamiento de instrucciones** para evitar paradas por dependencias. En lugar de estar esperando "sin hacer nada", adelantamos instrucciones.

#### Simulación [`Reord-ej1.s`](./Reord/Reord-ej1.s)

<div align="center">
	<table>
		<th> Sin forwarding </th>
		<th> Con forwarding </th>
		</tr>
		<tr>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    21 Cycles<br>
                    9 Instructions<br>
                    2.333 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    8 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    0 Structural Stalls<br>
                    0 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    36 Bytes<br>
				</p>
			</td>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    15 Cycles<br>
                    9 Instructions<br>
                    1.667 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    2 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    0 Structural Stalls<br>
                    0 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    36 Bytes<br>
				</p>
			</td>
		</tr>
	</table>
    Pese a habilitar el forwarding, siguen habiendo esperas. ¿Qué sucede? Instrucción I3: <code>dadd r3,r2,r1</code>, requiere <code>r1</code> y <code>r2</code>, y hasta que no esté la información cargada la operación queda esperando. Esto repercute en la instrucción I4: <code>sd r3, C(r0)</code>, que necesita el contenido de <code>r3</code>.
    <i>Para las instrucciones I5 a I8 se repite lo anterior, solo que en I5: <code>ld r4, D(r0)</code> se acumulan las esperas anteriores, y los recursos de la ALU quedan bloqueados</i>
</div>

#### Simulación [`Reord-ej2.s`](./Reord/Reord-ej2.s)

<div align="center">
	<table>
		<th> Sin forwarding </th>
		<th> Con forwarding </th>
		</tr>
		<tr>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    17 Cycles<br>
                    9 Instructions<br>
                    1.889 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    4 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    0 Structural Stalls<br>
                    0 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    36 Bytes<br>
				</p>
			</td>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    13 Cycles<br>
                    9 Instructions<br>
                    1.444 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    0 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    0 Structural Stalls<br>
                    0 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    36 Bytes<br>
				</p>
			</td>
		</tr>
	</table>
    Este código se ha reordenado de tal forma que se ha atrasado la suma <code>dadd r3,r2,r1</code> un paso (I3 ahora es I4), y <code>sd r3, C(r0)</code> dos pasos (I4 ahora es I6). Esto es para dejar "espacio" a cargar los datos en <code>r1</code> y <code>r2</code>, a su vez se esperan los ciclos necesarios para que la suma finalice y almacene su resultado, para que este pueda ser leído sin esperas por <code>sd r3, C(r0)</code>.
</div>

### Desenrollado de bucles

|Ventajas|Desventajas|
|:-------|:----------|
Reduce el número de comprobaciones de salto|Mayor tamaño del programa|
Código más fácilmente paralelizable|Uso de mayor número de registros|

#### Paso 0 - Ejemplo base ([BeforeLoopUnroll.s](./Desenrrollado/BeforeLoopUnroll.s))

- ¿Cuántas veces se ejecutará el bucle?
    - Veinte veces (Condición de parada: `r1==r2` $\equiv$ `i<20`). Demostrado con Branch Taken Stalls (19)
- Incremento del iterador.
    - De ocho en ocho (cada _double_ en memoria ocupa 8 posiciones). Al final de ejecución: `r1=00000000 000000a0` = 160


#### Paso 1 ([LoopUnroll_Step1.s](./Desenrrollado/LoopUnroll_Step1.s)): Replicar código

- ¿Cuántas veces se ejecutará el bucle?
    - Considerando que se ha replicado el contenido del bucle 3 veces (un total de 4 iteraciones desenrrolladas), el bucle se ejecutará 5 veces
- Direcciones utilizadas en base al iterador:
    - `[0(r1), 8(r1), 16(r1), 24(r1)]`
- Incremento del iterador.
    - Con `daddi r1,r1,32` se entiende que aumenta 4x el incremento, ya que originalmente se incrementa en 8

#### Paso 2 ([LoopUnroll_Step2.s](./Desenrrollado/LoopUnroll_Step2.s)): Utilizar más registros

Datos importantes:
- Identificar operaciones de carga y almacenamiento.
- Utilizar distintos registros para dichas instrucciones.
    - Los registros empleados cambiarán entre iteraciones, de esta forma se reducen las interdependencias

#### Paso 3 ([LoopUnroll_Step3.s](./Desenrrollado/LoopUnroll_Step3.s)): Agrupar instrucciones

Datos importantes:
- Identificar operaciones de carga y almacenamiento.
- Agrupar dichas instrucciones.

#### Paso 4 ([LoopUnroll_Step4.s](./Desenrrollado/LoopUnroll_Step4.s)): Re-ordenar instrucciones

Datos importantes:
- Analizar paradas en paso anterior.
- Adelantar instrucciones en caso de espera.
- Controlar siempre las direcciones utilizadas en base al iterador
    - `[0(r1), 8(r1), -16(r1), -8(r1), etc]`
- Utilizar "Delay Slot" si es posible.

### Simular las 5 versiones de código

<div align="center">
	<table>
		<th> 'Before' </th>
		<th> Paso 1 </th>
		<th> Paso 2 </th>
		<th> Paso 3 </th>
		<th> Paso 4 </th>
		</tr>
		<tr>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    312 Cycles<br>
                    105 Instructions<br>
                    2.971 Cycles Per Instruccion (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    184 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    0 Structural Stalls<br>
                    19 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    40 Bytes<br>
				</p>
			</td>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    237 Cycles<br>
                    75 Instructions<br>
                    3.160 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    154 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    0 Structural Stalls<br>
                    4 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    76 Bytes<br>
				</p>
			</td>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    237 Cycles<br>
                    75 Instructions<br>
                    3.160 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    154 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    0 Structural Stalls<br>
                    4 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    76 Bytes<br>
				</p>
			</td>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    112 Cycles<br>
                    75 Instructions<br>
                    1.493 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    24 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    5 Structural Stalls<br>
                    4 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    76 Bytes<br>
				</p>
			</td>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    108 Cycles<br>
                    75 Instructions<br>
                    1.521* Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    24 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    5 Structural Stalls<br>
                    4 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    76 Bytes<br>
				</p>
			</td>
		</tr>
	</table>
</div>

*Si se aplica la fórmula $CPI=C/I$ realmente CPI = 1.440, lo cual tiene más sentido

#### ¿Cuántas veces se ejecuta el bucle en las versiones desenrolladas?

Medible a través de la estadística Branch Taken Stalls:

<div align="center">
	<table>
		<th> 'Before' </th>
		<th> Paso 1 </th>
		<th> Paso 2 </th>
		<th> Paso 3 </th>
		<th> Paso 4 </th>
		</tr>
		<tr>
			<td>
				<p>
                    19 Branch Taken Stalls<br>
				</p>
			</td>
			<td>
				<p>
                    4 Branch Taken Stalls<br>
				</p>
			</td>
			<td>
				<p>
                    4 Branch Taken Stalls<br>
				</p>
			</td>
			<td>
				<p>
                    4 Branch Taken Stalls<br>
				</p>
			</td>
			<td>
				<p>
                    4 Branch Taken Stalls<br>
				</p>
			</td>
		</tr>
	</table>
</div>

#### ¿Qué versión tiene un mejor rendimiento?¿Por qué?

Considerando como medida de rendimiento de un procesador los CPI (**número promedio de ciclos de reloj tomados para ejecutar una instrucción de un programa**), el mejor resultado es obtenido para el paso 3, pero un pequeño matiz con el número de ciclos cabe esperar que el paso 4 resulta ser en un programa con menor número de ciclos en el momento de ejecución, y calculando a mano el CPI resulta ser un número menor, por lo que <ins>es el último paso con mejor rendimiento</ins>.

#### La simulación de `LoopUnroll_Step4.s` es correcta si no habilitamos "Delay Slot"?

Afirmativo, tras ejecutar el mismo programa cambiando el estado de la mejora, el contenido del registro F16 es el mismo:

|Sin DS|Con DS|
|:----:|:----:|
|F16= 0000001.74000000|F16= 0000001.74000000|

Y las diferencias de rendimiento son notorias:

<div align="center">
	<table>
		<th> DS Apagado </th>
		<th> DS Encendido </th>
		</tr>
		<tr>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    108 Cycles<br>
                    75 Instructions<br>
                    1.521 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    24 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    5 Structural Stalls<br>
                    4 Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    76 Bytes<br>
				</p>
			</td>
			<td>
				<p>
                    <span style="color: #ff0000">Execution</span><br>
                    108 Cycles<br>
                    75 Instructions<br>
                    1.440 Cycles Per Instruction (CPI)<br>
                    <br>
                    <p><span style="color: #ff0000">Stalls</span><br>
                    24 RAW Stalls<br>
                    0 WAW Stalls<br>
                    0 WAR Stalls<br>
                    5 Structural Stalls<br>
                    0* Branch Taken Stalls<br>
                    0 Branch Misprediction Stalls<br>
                    <br>
                    <p><span style="color: #ff0000">Code size</span><br>
                    76 Bytes<br>
				</p>
			</td>
		</tr>
	</table>
</div>
*Debido a que el DS está activado, se decide si el código salta a la dirección de memoria de <code>loop</code> mucho antes, debido al "slot" extra que se ejecuta por delante. Se salta un total de 4 veces igualmente, ¡pero no hay esperas para ello!

#### ¿En qué porcentaje aumenta el tamaño del código?

$$
\dfrac{76 \text{\ bytes}}{40 \text{\ bytes}} - 1 = 0.9 \equiv +90\% \text{\ aumentó el tamaño del código}
$$