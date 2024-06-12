## Sesión I Monitorización del rendimiento en tiempo de ejecución

```console
perf (apt-get install linux-tools-common linux-tools-generic)
gcc (apt-get install gcc)
```

---
**Herramienta perf**

Performance Events for Linux: herramienta estándar en Linux para análisis de rendimiento (profiling). Perf accede a los contadores hardware de rendimiento.
- Son registros de la CPU que cuentan eventos como instrucciones ejecutadas, fallos de caché o bifurcaciones mal predichas, etc.

Las capacidades de perf **dependen de las propiedades de la CPU**.


### Indique tamaño caché de su equipo

Para ello puede usar los siguientes comandos:
```console
lshw
lscpu
dmidecode -t cache
```

#### `lshw`
```console
$ lshw
WARNING: you should run this program as super-user.
kali
    description: Computer
    width: 64 bits
    capabilities: smp vsyscall32
  *-core
       description: Motherboard
       physical id: 0
     *-memory
          description: System memory
          physical id: 0
          size: 16GiB
     *-cpu
          product: Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
          vendor: Intel Corp.
          physical id: 1
          bus info: cpu@0
          version: 6.158.10
          size: 3799MHz
          capacity: 4100MHz
          width: 64 bits
          capabilities: fpu fpu_exception wp vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp x86-64 constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology nonstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefetch cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d arch_capabilities cpufreq
          configuration: microcode=240
     *-pci
          description: Host bridge
          product: 8th Gen Core 4-core Processor Host Bridge/DRAM Registers [Coffee Lake H]
          vendor: Intel Corporation
          physical id: 100
          bus info: pci@0000:00:00.0
          version: 07
          width: 32 bits
          clock: 33MHz
          configuration: driver=skl_uncore
          resources: irq:
  ...
```

#### `lscpu`
```console
$ lscpu
Architecture:            x86_64
  CPU op-mode(s):        32-bit, 64-bit
  Address sizes:         39 bits physical, 48 bits virtual
  Byte Order:            Little Endian
CPU(s):                  8
  On-line CPU(s) list:   0-7
Vendor ID:               GenuineIntel
  Model name:            Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz
    CPU family:          6
    Model:               158
    Thread(s) per core:  2
    Core(s) per socket:  4
    Socket(s):           1
    Stepping:            10
    CPU(s) scaling MHz:  59%
    CPU max MHz:         4100,0000
    CPU min MHz:         800,0000
    BogoMIPS:            4800.00
    Flags:               fpu vme de pse tsc msr pae mce cx8 apic sep mtrr pge mca cmov pat pse36 clflush dts acpi mmx fxsr sse sse2 ss ht tm pbe syscall nx pdpe1gb rdtscp lm constant_tsc art arch_perfmon pebs bts rep_good nopl xtopology n
                         onstop_tsc cpuid aperfmperf pni pclmulqdq dtes64 monitor ds_cpl vmx est tm2 ssse3 sdbg fma cx16 xtpr pdcm pcid sse4_1 sse4_2 x2apic movbe popcnt tsc_deadline_timer aes xsave avx f16c rdrand lahf_lm abm 3dnowprefet
                         ch cpuid_fault epb invpcid_single pti ssbd ibrs ibpb stibp tpr_shadow vnmi flexpriority ept vpid ept_ad fsgsbase tsc_adjust bmi1 avx2 smep bmi2 erms invpcid mpx rdseed adx smap clflushopt intel_pt xsaveopt xsavec
                         xgetbv1 xsaves dtherm ida arat pln pts hwp hwp_notify hwp_act_window hwp_epp md_clear flush_l1d arch_capabilities
Virtualization features:
  Virtualization:        VT-x
Caches (sum of all):
  L1d:                   128 KiB (4 instances)
  L1i:                   128 KiB (4 instances)
  L2:                    1 MiB (4 instances)
  L3:                    8 MiB (1 instance)
NUMA:
  NUMA node(s):          1
  NUMA node0 CPU(s):     0-7
Vulnerabilities:
  Itlb multihit:         KVM: Mitigation: VMX disabled
  L1tf:                  Mitigation; PTE Inversion; VMX conditional cache flushes, SMT vulnerable
  Mds:                   Mitigation; Clear CPU buffers; SMT vulnerable
  Meltdown:              Mitigation; PTI
  Mmio stale data:       Mitigation; Clear CPU buffers; SMT vulnerable
  Retbleed:              Mitigation; IBRS
  Spec store bypass:     Mitigation; Speculative Store Bypass disabled via prctl
  Spectre v1:            Mitigation; usercopy/swapgs barriers and __user pointer sanitization
  Spectre v2:            Mitigation; IBRS, IBPB conditional, RSB filling, PBRSB-eIBRS Not affected
  Srbds:                 Mitigation; Microcode
  Tsx async abort:       Not affected

```

#### `dmidecode -t cache`
```console
$ sudo dmidecode -t cache
[sudo] contraseña para raulillo137:
# dmidecode 3.4
Getting SMBIOS data from sysfs.
SMBIOS 3.2.0 present.

Handle 0x001B, DMI type 7, 27 bytes
Cache Information
	Socket Designation: L1 Cache
	Configuration: Enabled, Not Socketed, Level 1
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 256 kB
	Maximum Size: 256 kB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Parity
	System Type: Unified
	Associativity: 8-way Set-associative

Handle 0x001C, DMI type 7, 27 bytes
Cache Information
	Socket Designation: L2 Cache
	Configuration: Enabled, Not Socketed, Level 2
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 1 MB
	Maximum Size: 1 MB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Single-bit ECC
	System Type: Unified
	Associativity: 4-way Set-associative

Handle 0x001D, DMI type 7, 27 bytes
Cache Information
	Socket Designation: L3 Cache
	Configuration: Enabled, Not Socketed, Level 3
	Operational Mode: Write Back
	Location: Internal
	Installed Size: 8 MB
	Maximum Size: 8 MB
	Supported SRAM Types:
		Synchronous
	Installed SRAM Type: Synchronous
	Speed: Unknown
	Error Correction Type: Multi-bit ECC
	System Type: Unified
	Associativity: 16-way Set-associative
```

### Caso I: estudio del tamaño de línea

- Análisis de acceso a la cache: tamaño de la línea
- Recorrido de un vector de forma salteada

```c
volatile unsigned char A[BUFFER_SIZE];
  ...
    for (i = 0; i < BUFFER_SIZE; i += STRIDE)
      A[i]++;
```
Código completo: [cache_size.c](./Caso%201/cache_size.c)

#### Recompilar código variando el valor de la macro STRIDE
```console
gcc -O0 -DSTRIDE=<valor> -o cache_size cache_size.c
```
#### Mide el efecto sobre la cache L1
```console
perf stat -r 10 -e instructions:u,L1-dcache-loads-misses:u,L1-dcache-loads:u ./cache_size
```
#### Ejercicio 1
<!-- - El tamaño del buffer excede al de la cache L1 -->
<!-- - Variando el stride (salto) debería observarse una variación anormal en la tasa de fallos -->
**Ejecute el comando perf con la configuración indicada, para obtener los valores de tasa de fallo variando el parámetro STRIDE. Adjunte la salida de texto de todas las ejecuciones**
<!-- - ¿Por qué razón? -->
##### STRIDE = 01
```console
Performance counter stats for './cachesize' (10 runs):

         7.965.576      instructions:u                                                       ( +-  0,00% )
            11.447      L1-dcache-loads-misses           #    0,35% of all L1-dcache accesses  ( +-  0,47% )
         3.299.920      L1-dcache-loads

          0,002660 +- 0,000142 seconds time elapsed  ( +-  5,34% )
```
##### STRIDE = 02
```console
Performance counter stats for './cachesize' (10 runs):

         4.033.416      instructions:u                                                       ( +-  0,00% )
            11.041      L1-dcache-loads-misses           #    0,66% of all L1-dcache accesses  ( +-  0,41% )
         1.661.520      L1-dcache-loads                                                      ( +-  0,00% )

         0,0015205 +- 0,0000442 seconds time elapsed  ( +-  2,91% )
```
##### STRIDE = 04
```console
Performance counter stats for './cachesize' (10 runs):

         2.067.337      instructions:u                                                       ( +-  0,00% )
            11.080      L1-dcache-loads-misses           #    1,32% of all L1-dcache accesses  ( +-  0,09% )
           842.320      L1-dcache-loads

         0,0014902 +- 0,0000692 seconds time elapsed  ( +-  4,64% )
```
##### STRIDE = 08
```console
Performance counter stats for './cachesize' (10 runs):

         1.084.295      instructions:u                                                       ( +-  0,00% )
            11.088      L1-dcache-loads-misses           #    2,56% of all L1-dcache accesses  ( +-  0,46% )
           432.327      L1-dcache-loads                                                      ( +-  0,01% )

         0,0031738 +- 0,0000245 seconds time elapsed  ( +-  0,77% )
```
##### STRIDE = 16
```console
Performance counter stats for './cachesize' (10 runs):

           592.775      instructions:u                                                       ( +-  0,00% )
            11.044      L1-dcache-loads-misses           #    4,85% of all L1-dcache accesses  ( +-  0,42% )
           227.920      L1-dcache-loads

         0,0009686 +- 0,0000263 seconds time elapsed  ( +-  2,72% )
```
##### STRIDE = 32
```console
Performance counter stats for './cachesize' (10 runs):

           347.016      instructions:u                                                       ( +-  0,00% )
            11.407      L1-dcache-loads-misses           #    9,09% of all L1-dcache accesses  ( +-  0,52% )
           125.520      L1-dcache-loads

         0,0008139 +- 0,0000201 seconds time elapsed  ( +-  2,47% )
```
##### STRIDE = 64
```console
Performance counter stats for './cachesize' (10 runs):

           224.137      instructions:u                                                       ( +-  0,00% )
            11.047      L1-dcache-loads-misses           #   14,86% of all L1-dcache accesses  ( +-  0,47% )
            74.320      L1-dcache-loads                                                      ( +-  0,00% )

         0,0006961 +- 0,0000106 seconds time elapsed  ( +-  1,52% )
```
##### STRIDE = 128
```console
Performance counter stats for './cachesize' (10 runs):

           162.693      instructions:u                                                       ( +-  0,00% )
             6.985      L1-dcache-loads-misses           #   14,34% of all L1-dcache accesses  ( +-  1,28% )
            48.719      L1-dcache-loads                                                      ( +-  0,00% )

         0,0007801 +- 0,0000193 seconds time elapsed  ( +-  2,47% )
```
##### STRIDE = 256
```console
Performance counter stats for './cachesize' (10 runs):

           131.975      instructions:u                                                       ( +-  0,00% )
             4.289      L1-dcache-loads-misses           #   11,94% of all L1-dcache accesses  ( +-  0,44% )
            35.918      L1-dcache-loads                                                      ( +-  0,00% )

          0,001341 +- 0,000114 seconds time elapsed  ( +-  8,51% )
```
#### Ejercicio 2
**A la vista del resultado, comente razonadamente la evolución de la tasa de fallos de caché.**

<div align="center">
	<table>
		<th> <b>VALOR DE MACRO STRIDE</b> </th>
		<th> <b>TASA FALLOS EN CACHÉ L1 (%)</b> </th>
		</tr>
		<tr>
			<td>
				<p align="right">
          1
				</p>
			</td>
			<td>
				<p>
          0.35
				</p>
			</td>
    </tr>
    <tr>
			<td>
				<p align="right">
          2
				</p>
			</td>
			<td>
				<p>
          0.66
				</p>
			</td>
		</tr>
    <tr>
			<td>
				<p align="right">
          4
				</p>
			</td>
			<td>
				<p>
          1.32
				</p>
			</td>
		</tr>
    <tr>
			<td>
				<p align="right">
          8
				</p>
			</td>
			<td>
				<p>
          2.56
				</p>
			</td>
		</tr>
    <tr>
			<td>
				<p align="right">
          16 
				</p>
			</td>
			<td>
				<p>
          4.85
				</p>
			</td>
		</tr>
    <tr>
			<td>
				<p align="right">
          32
				</p>
			</td>
			<td>
				<p>
          9.09
				</p>
			</td>
		</tr>
    <tr>
			<td>
				<p align="right">
          <b>64</b>
				</p>
			</td>
			<td>
				<p>
          <b>14.86</b>
				</p>
			</td>
		</tr>
    <tr>
			<td>
				<p align="right">
          128 
				</p>
			</td>
			<td>
				<p>
          14.34
				</p>
			</td>
		</tr>
    <tr>
			<td>
				<p align="right">
          256
				</p>
			</td>
			<td>
				<p>
          11.94
				</p>
			</td>
		</tr>
	</table>
</div>

El extracto completo de terminal se encuentra [aquí](./Caso%202/terminal_outputs/estudio2filas.txt)

Hemos recopilado toda la información y la hemos adjuntado en la tabla que se puede ver arriba. Como podemos apreciar, la tasa de fallos para el acceso a caché L1d alcanza su valor máximo para el valor de la macro **STRIDE = 64**.
La caída repentina se produce para STRIDE=256, cuando ya se ha excedido el valor de nuestra caché L1d (=128 KiB).

---

### Caso II: recorrido en estructuras 2D

Las matrices en C se almacenan en memoria por filas (row_major):
  - (lexicographical access order), zero-based indexing

<div align="center">
	
|Dirección `x + N_x*y`|Acceso `A[y][x]`|Valor $a_{y,x}$|
|--------------------:|:--------------:|:--------------|
|0                    |`A[0][0]`       |$a_{11}$       |
|1                    |`A[0][1]`       |$a_{12}$       |
|2                    |`A[0][2]`       |$a_{13}$       |
|3                    |`A[1][0]`       |$a_{21}$       |
|4                    |`A[1][1]`       |$a_{22}$       |
|5                    |`A[1][2]`       |$a_{23}$       |

</div>

En memoria:
```mermaid
  graph LR
    A["A[0][0]"] --> B["A[0][1]"] --> C["A[0][2]"] --> D["A[1][0]"] --> E["A[1][1]"] --> F["A[1][2]"]
```


#### Recorrido por filas (tal y como almacena la caché)

```c
for (i = 1; i < ROWS; i++)      
  for (j = 1; j < COLS; j++)
    A[i][j] = A[i - 1][j - 1];
```
Código completo: [cache_row_major.c](./Caso%202/cache_row_major.c)

> Recompilar código variando el valor de las macros COLS y ROWS:<br>
> `gcc -O0 -DROWS=<valor> -DCOLS=<valor> -o cache_row_major cache_row_major.c`

<div align="center">
  <table>
    <th><b>ROW\COLS</b></th>
    <th><b>1</b></th>
    <th><b>100</b></th>
    <th><b>200</b></th>
    <th><b>300</b></th>
    <th><b>500</b></th>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>1</b>
        </p>
      </td>
      <td>
        <p>
          7.61
        </p>
      </td>
      <td>
        <p>
          7.58
        </p>
      </td>
      <td>
        <p>
          7.59
        </p>
      </td>
      <td>
        <p>
          9.09
        </p>
      </td>
      <td>
        <p>
          7.47
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>100</b>
        </p>
      </td>
      <td>
        <p>
          6.79
        </p>
      </td>
      <td>
        <p>
          1.04
        </p>
      </td>
      <td>
        <p>
          0.93
        </p>
      </td>
      <td>
        <p>
          0.90
        </p>
      </td>
      <td>
        <p>
          <i>0.87</i>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>1000</b>
        </p>
      </td>
      <td>
        <p>
          3.28
        </p>
      </td>
      <td>
        <p>
          <i>0.84</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.82</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.82</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.82</i>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>5000</b>
        </p>
      </td>
      <td>
        <p>
          1.03
        </p>
      </td>
      <td>
        <p>
          <i>0.82</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.86</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.87</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.88</i>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>10000</b>
        </p>
      </td>
      <td>
        <p>
          <i><mark>0.53</mark></i>
        </p>
      </td>
      <td>
        <p>
          <i>0.82</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.86</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.87</i>
        </p>
      </td>
      <td>
        <p>
          <i>0.88</i>
        </p>
      </td>
    </tr>
  </table>
</div>

El extracto completo de terminal se encuentra [aquí](./Caso%202/terminal_outputs/estudio2columnas.txt)

#### Recorrido por columnas

```c
for (j = 1; j < COLS; j++)      
  for (i = 1; i < ROWS; i++)
    A[i][j] = A[i - 1][j - 1];
```
Código completo: [cache_column_major.c](./Caso%202/cache_column_major.c)

> Recompilar código variando el valor de las macros COLS y ROWS:<br>
> `gcc -O0 -DROWS=<valor> -DCOLS=<valor> -o cache_column_major cache_column_major.c`

<div align="center">
  <table>
    <th><b>ROW\COLS</b></th>
    <th><b>1</b></th>
    <th><b>100</b></th>
    <th><b>200</b></th>
    <th><b>300</b></th>
    <th><b>500</b></th>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>1</b>
        </p>
      </td>
      <td>
        <p>
          7.50
        </p>
      </td>
      <td>
        <p>
          6.47
        </p>
      </td>
      <td>
        <p>
          5.85
        </p>
      </td>
      <td>
        <p>
          5.38
        </p>
      </td>
      <td>
        <p>
          4.57
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>100</b>
        </p>
      </td>
      <td>
        <p>
          7.43
        </p>
      </td>
      <td>
        <p>
          <i><mark>0.85</mark></i>
        </p>
      </td>
      <td>
        <p>
          1.02
        </p>
      </td>
      <td>
        <p>
          0.98
        </p>
      </td>
      <td>
        <p>
          0.95
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>1000</b>
        </p>
      </td>
      <td>
        <p>
          7.46
        </p>
      </td>
      <td>
        <p>
          <strike>15.12</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>15.12</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>15.15</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>15.17</strike>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>5000</b>
        </p>
      </td>
      <td>
        <p>
          7.62
        </p>
      </td>
      <td>
        <p>
          <strike>15.13</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>16.31</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>16.71</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>17.19</strike>
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p align="right">
          <b>10000</b>
        </p>
      </td>
      <td>
        <p>
          9.19
        </p>
      </td>
      <td>
        <p>
          <strike>15.14</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>15.95</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>18.38</strike>
        </p>
      </td>
      <td>
        <p>
          <strike>17.77</strike>
        </p>
      </td>
    </tr>
  </table>
</div>

Una vez recopilamos los datos de la salida de texto de cada una de las ejecuciones del programa y su obtención de su tasa de fallos en caché, podemos apreciar que creemos que **resulta más fácil para la caché la ejecución por filas**. Esta elección se sostiene al observar la cantidad de fallos que resultan con el conjunto de ejecuciones de una manera y de otra:

- Cuando se ejecutan por filas, la tasa de fallos de la caché nunca supera el 10%, y en su **mayoría de veces es menor al 1%**.

- En cambio, cuando se ejecuta por columnas con todos los cambios en las macros, numerosas veces la **tasa de fallos es mayor al 15%**.