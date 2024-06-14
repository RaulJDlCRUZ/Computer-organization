
./mmultopt:     formato del fichero elf64-x86-64


Desensamblado de la sección .init:

0000000000001000 <_init>:
    1000:	48 83 ec 08          	sub    $0x8,%rsp
    1004:	48 8b 05 c5 2f 00 00 	mov    0x2fc5(%rip),%rax        # 3fd0 <__gmon_start__@Base>
    100b:	48 85 c0             	test   %rax,%rax
    100e:	74 02                	je     1012 <_init+0x12>
    1010:	ff d0                	call   *%rax
    1012:	48 83 c4 08          	add    $0x8,%rsp
    1016:	c3                   	ret

Desensamblado de la sección .plt:

0000000000001020 <memset@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <memset@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <memset@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <srand@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <srand@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <time@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <time@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001060 <rand@plt>:
    1060:	ff 25 b2 2f 00 00    	jmp    *0x2fb2(%rip)        # 4018 <rand@GLIBC_2.2.5>
    1066:	68 03 00 00 00       	push   $0x3
    106b:	e9 b0 ff ff ff       	jmp    1020 <_init+0x20>

Desensamblado de la sección .plt.got:

0000000000001070 <__cxa_finalize@plt>:
    1070:	ff 25 6a 2f 00 00    	jmp    *0x2f6a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1076:	66 90                	xchg   %ax,%ax

Desensamblado de la sección .text:

0000000000001080 <_start>:
    1080:	31 ed                	xor    %ebp,%ebp
    1082:	49 89 d1             	mov    %rdx,%r9
    1085:	5e                   	pop    %rsi
    1086:	48 89 e2             	mov    %rsp,%rdx
    1089:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    108d:	50                   	push   %rax
    108e:	54                   	push   %rsp
    108f:	45 31 c0             	xor    %r8d,%r8d
    1092:	31 c9                	xor    %ecx,%ecx
    1094:	48 8d 3d fa 01 00 00 	lea    0x1fa(%rip),%rdi        # 1295 <main>
    109b:	ff 15 1f 2f 00 00    	call   *0x2f1f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    10a1:	f4                   	hlt
    10a2:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    10a9:	00 00 00 
    10ac:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010b0 <deregister_tm_clones>:
    10b0:	48 8d 3d 79 2f 00 00 	lea    0x2f79(%rip),%rdi        # 4030 <__TMC_END__>
    10b7:	48 8d 05 72 2f 00 00 	lea    0x2f72(%rip),%rax        # 4030 <__TMC_END__>
    10be:	48 39 f8             	cmp    %rdi,%rax
    10c1:	74 15                	je     10d8 <deregister_tm_clones+0x28>
    10c3:	48 8b 05 fe 2e 00 00 	mov    0x2efe(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10ca:	48 85 c0             	test   %rax,%rax
    10cd:	74 09                	je     10d8 <deregister_tm_clones+0x28>
    10cf:	ff e0                	jmp    *%rax
    10d1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10d8:	c3                   	ret
    10d9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010e0 <register_tm_clones>:
    10e0:	48 8d 3d 49 2f 00 00 	lea    0x2f49(%rip),%rdi        # 4030 <__TMC_END__>
    10e7:	48 8d 35 42 2f 00 00 	lea    0x2f42(%rip),%rsi        # 4030 <__TMC_END__>
    10ee:	48 29 fe             	sub    %rdi,%rsi
    10f1:	48 89 f0             	mov    %rsi,%rax
    10f4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10f8:	48 c1 f8 03          	sar    $0x3,%rax
    10fc:	48 01 c6             	add    %rax,%rsi
    10ff:	48 d1 fe             	sar    %rsi
    1102:	74 14                	je     1118 <register_tm_clones+0x38>
    1104:	48 8b 05 cd 2e 00 00 	mov    0x2ecd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    110b:	48 85 c0             	test   %rax,%rax
    110e:	74 08                	je     1118 <register_tm_clones+0x38>
    1110:	ff e0                	jmp    *%rax
    1112:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1118:	c3                   	ret
    1119:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001120 <__do_global_dtors_aux>:
    1120:	f3 0f 1e fa          	endbr64
    1124:	80 3d 15 2f 00 00 00 	cmpb   $0x0,0x2f15(%rip)        # 4040 <completed.0>
    112b:	75 2b                	jne    1158 <__do_global_dtors_aux+0x38>
    112d:	55                   	push   %rbp
    112e:	48 83 3d aa 2e 00 00 	cmpq   $0x0,0x2eaa(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1135:	00 
    1136:	48 89 e5             	mov    %rsp,%rbp
    1139:	74 0c                	je     1147 <__do_global_dtors_aux+0x27>
    113b:	48 8b 3d e6 2e 00 00 	mov    0x2ee6(%rip),%rdi        # 4028 <__dso_handle>
    1142:	e8 29 ff ff ff       	call   1070 <__cxa_finalize@plt>
    1147:	e8 64 ff ff ff       	call   10b0 <deregister_tm_clones>
    114c:	c6 05 ed 2e 00 00 01 	movb   $0x1,0x2eed(%rip)        # 4040 <completed.0>
    1153:	5d                   	pop    %rbp
    1154:	c3                   	ret
    1155:	0f 1f 00             	nopl   (%rax)
    1158:	c3                   	ret
    1159:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001160 <frame_dummy>:
    1160:	f3 0f 1e fa          	endbr64
    1164:	e9 77 ff ff ff       	jmp    10e0 <register_tm_clones>

0000000000001169 <mmult_traspuesta>:
#include <string.h>
#include <time.h>

#define N 1000

void mmult_traspuesta(int A[N][N], int B[N][N], int C[N][N]) {
    1169:	55                   	push   %rbp
    116a:	48 89 e5             	mov    %rsp,%rbp
    116d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1171:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
    1175:	48 89 55 d8          	mov    %rdx,-0x28(%rbp)
  unsigned int i,j,k;
  
  for (i = 0; i < N; ++i)
    1179:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    1180:	e9 97 00 00 00       	jmp    121c <mmult_traspuesta+0xb3>
    for (j = 0; j < N; ++j)
    1185:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    118c:	eb 7d                	jmp    120b <mmult_traspuesta+0xa2>
      for (k = 0; k < N; ++k)
    118e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%rbp)
    1195:	eb 67                	jmp    11fe <mmult_traspuesta+0x95>
        C[i][j] += A[i][k] * B[j][k];
    1197:	8b 45 fc             	mov    -0x4(%rbp),%eax
    119a:	48 69 d0 a0 0f 00 00 	imul   $0xfa0,%rax,%rdx
    11a1:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    11a5:	48 01 c2             	add    %rax,%rdx
    11a8:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11ab:	8b 34 82             	mov    (%rdx,%rax,4),%esi
    11ae:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11b1:	48 69 d0 a0 0f 00 00 	imul   $0xfa0,%rax,%rdx
    11b8:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    11bc:	48 01 c2             	add    %rax,%rdx
    11bf:	8b 45 f4             	mov    -0xc(%rbp),%eax
    11c2:	8b 14 82             	mov    (%rdx,%rax,4),%edx
    11c5:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11c8:	48 69 c8 a0 0f 00 00 	imul   $0xfa0,%rax,%rcx
    11cf:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    11d3:	48 01 c1             	add    %rax,%rcx
    11d6:	8b 45 f4             	mov    -0xc(%rbp),%eax
    11d9:	8b 04 81             	mov    (%rcx,%rax,4),%eax
    11dc:	89 d1                	mov    %edx,%ecx
    11de:	0f af c8             	imul   %eax,%ecx
    11e1:	8b 45 fc             	mov    -0x4(%rbp),%eax
    11e4:	48 69 d0 a0 0f 00 00 	imul   $0xfa0,%rax,%rdx
    11eb:	48 8b 45 d8          	mov    -0x28(%rbp),%rax
    11ef:	48 01 c2             	add    %rax,%rdx
    11f2:	01 f1                	add    %esi,%ecx
    11f4:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11f7:	89 0c 82             	mov    %ecx,(%rdx,%rax,4)
      for (k = 0; k < N; ++k)
    11fa:	83 45 f4 01          	addl   $0x1,-0xc(%rbp)
    11fe:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%rbp)
    1205:	76 90                	jbe    1197 <mmult_traspuesta+0x2e>
    for (j = 0; j < N; ++j)
    1207:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    120b:	81 7d f8 e7 03 00 00 	cmpl   $0x3e7,-0x8(%rbp)
    1212:	0f 86 76 ff ff ff    	jbe    118e <mmult_traspuesta+0x25>
  for (i = 0; i < N; ++i)
    1218:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    121c:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
    1223:	0f 86 5c ff ff ff    	jbe    1185 <mmult_traspuesta+0x1c>

  return;
    1229:	90                   	nop
}
    122a:	5d                   	pop    %rbp
    122b:	c3                   	ret

000000000000122c <trasponer>:

void trasponer(int M[N][N], int T[N][N]) {
    122c:	55                   	push   %rbp
    122d:	48 89 e5             	mov    %rsp,%rbp
    1230:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1234:	48 89 75 e0          	mov    %rsi,-0x20(%rbp)
  unsigned int i,j;
  
  for (i = 0; i < N; ++i)
    1238:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    123f:	eb 48                	jmp    1289 <trasponer+0x5d>
    for (j = 0; j < N; ++j)
    1241:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    1248:	eb 32                	jmp    127c <trasponer+0x50>
      T[i][j] = M[j][i];
    124a:	8b 45 f8             	mov    -0x8(%rbp),%eax
    124d:	48 69 d0 a0 0f 00 00 	imul   $0xfa0,%rax,%rdx
    1254:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    1258:	48 01 c2             	add    %rax,%rdx
    125b:	8b 45 fc             	mov    -0x4(%rbp),%eax
    125e:	48 69 c8 a0 0f 00 00 	imul   $0xfa0,%rax,%rcx
    1265:	48 8b 45 e0          	mov    -0x20(%rbp),%rax
    1269:	48 01 c1             	add    %rax,%rcx
    126c:	8b 45 fc             	mov    -0x4(%rbp),%eax
    126f:	8b 14 82             	mov    (%rdx,%rax,4),%edx
    1272:	8b 45 f8             	mov    -0x8(%rbp),%eax
    1275:	89 14 81             	mov    %edx,(%rcx,%rax,4)
    for (j = 0; j < N; ++j)
    1278:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    127c:	81 7d f8 e7 03 00 00 	cmpl   $0x3e7,-0x8(%rbp)
    1283:	76 c5                	jbe    124a <trasponer+0x1e>
  for (i = 0; i < N; ++i)
    1285:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1289:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
    1290:	76 af                	jbe    1241 <trasponer+0x15>

  return;
    1292:	90                   	nop
}
    1293:	5d                   	pop    %rbp
    1294:	c3                   	ret

0000000000001295 <main>:
	   
int main(void) {
    1295:	55                   	push   %rbp
    1296:	48 89 e5             	mov    %rsp,%rbp
    1299:	48 83 ec 10          	sub    $0x10,%rsp
  static int m1[N][N], m2[N][N], res[N][N], tmp[N][N];
  unsigned int i,j;

  memset(res,0,N*N*sizeof(int));
    129d:	ba 00 09 3d 00       	mov    $0x3d0900,%edx
    12a2:	be 00 00 00 00       	mov    $0x0,%esi
    12a7:	48 8d 05 b2 2d 00 00 	lea    0x2db2(%rip),%rax        # 4060 <res.3>
    12ae:	48 89 c7             	mov    %rax,%rdi
    12b1:	e8 7a fd ff ff       	call   1030 <memset@plt>

  srand(time(NULL));
    12b6:	bf 00 00 00 00       	mov    $0x0,%edi
    12bb:	e8 90 fd ff ff       	call   1050 <time@plt>
    12c0:	89 c7                	mov    %eax,%edi
    12c2:	e8 79 fd ff ff       	call   1040 <srand@plt>
  
  for (i = 0; i < N; ++i)
    12c7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    12ce:	e9 85 00 00 00       	jmp    1358 <main+0xc3>
    for (j = 0; j < N; ++j) {
    12d3:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%rbp)
    12da:	eb 6f                	jmp    134b <main+0xb6>
      m1[i][j] = m2[i][j] = (int)rand();
    12dc:	e8 7f fd ff ff       	call   1060 <rand@plt>
    12e1:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    12e4:	8b 55 fc             	mov    -0x4(%rbp),%edx
    12e7:	48 69 d2 e8 03 00 00 	imul   $0x3e8,%rdx,%rdx
    12ee:	48 01 ca             	add    %rcx,%rdx
    12f1:	48 8d 0c 95 00 00 00 	lea    0x0(,%rdx,4),%rcx
    12f8:	00 
    12f9:	48 8d 15 60 36 3d 00 	lea    0x3d3660(%rip),%rdx        # 3d4960 <m2.2>
    1300:	89 04 11             	mov    %eax,(%rcx,%rdx,1)
    1303:	8b 55 f8             	mov    -0x8(%rbp),%edx
    1306:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1309:	48 69 c0 e8 03 00 00 	imul   $0x3e8,%rax,%rax
    1310:	48 01 d0             	add    %rdx,%rax
    1313:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    131a:	00 
    131b:	48 8d 05 3e 36 3d 00 	lea    0x3d363e(%rip),%rax        # 3d4960 <m2.2>
    1322:	8b 04 02             	mov    (%rdx,%rax,1),%eax
    1325:	8b 4d f8             	mov    -0x8(%rbp),%ecx
    1328:	8b 55 fc             	mov    -0x4(%rbp),%edx
    132b:	48 69 d2 e8 03 00 00 	imul   $0x3e8,%rdx,%rdx
    1332:	48 01 ca             	add    %rcx,%rdx
    1335:	48 8d 0c 95 00 00 00 	lea    0x0(,%rdx,4),%rcx
    133c:	00 
    133d:	48 8d 15 1c 3f 7a 00 	lea    0x7a3f1c(%rip),%rdx        # 7a5260 <m1.1>
    1344:	89 04 11             	mov    %eax,(%rcx,%rdx,1)
    for (j = 0; j < N; ++j) {
    1347:	83 45 f8 01          	addl   $0x1,-0x8(%rbp)
    134b:	81 7d f8 e7 03 00 00 	cmpl   $0x3e7,-0x8(%rbp)
    1352:	76 88                	jbe    12dc <main+0x47>
  for (i = 0; i < N; ++i)
    1354:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    1358:	81 7d fc e7 03 00 00 	cmpl   $0x3e7,-0x4(%rbp)
    135f:	0f 86 6e ff ff ff    	jbe    12d3 <main+0x3e>
    }

  trasponer(m2,tmp);
    1365:	48 8d 05 f4 47 b7 00 	lea    0xb747f4(%rip),%rax        # b75b60 <tmp.0>
    136c:	48 89 c6             	mov    %rax,%rsi
    136f:	48 8d 05 ea 35 3d 00 	lea    0x3d35ea(%rip),%rax        # 3d4960 <m2.2>
    1376:	48 89 c7             	mov    %rax,%rdi
    1379:	e8 ae fe ff ff       	call   122c <trasponer>
	    
  mmult_traspuesta(m1,tmp,res);
    137e:	48 8d 05 db 2c 00 00 	lea    0x2cdb(%rip),%rax        # 4060 <res.3>
    1385:	48 89 c2             	mov    %rax,%rdx
    1388:	48 8d 05 d1 47 b7 00 	lea    0xb747d1(%rip),%rax        # b75b60 <tmp.0>
    138f:	48 89 c6             	mov    %rax,%rsi
    1392:	48 8d 05 c7 3e 7a 00 	lea    0x7a3ec7(%rip),%rax        # 7a5260 <m1.1>
    1399:	48 89 c7             	mov    %rax,%rdi
    139c:	e8 c8 fd ff ff       	call   1169 <mmult_traspuesta>

  return 0;
    13a1:	b8 00 00 00 00       	mov    $0x0,%eax
}
    13a6:	c9                   	leave
    13a7:	c3                   	ret

Desensamblado de la sección .fini:

00000000000013a8 <_fini>:
    13a8:	48 83 ec 08          	sub    $0x8,%rsp
    13ac:	48 83 c4 08          	add    $0x8,%rsp
    13b0:	c3                   	ret
