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

#### Paso 2 ([LoopUnroll_Step2.s](./Desenrrollado/LoopUnroll_Step2.s)): Utilizar más registros

#### Paso 3 ([LoopUnroll_Step3.s](./Desenrrollado/LoopUnroll_Step3.s)): Agrupar instrucciones

#### Paso 4 ([LoopUnroll_Step4.s](./Desenrrollado/LoopUnroll_Step4.s)): Re-ordenar instrucciones

WIP