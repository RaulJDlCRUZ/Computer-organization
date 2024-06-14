
./mmultopt1:     formato del fichero elf64-x86-64


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
    1094:	48 8d 3d 6c 01 00 00 	lea    0x16c(%rip),%rdi        # 1207 <main>
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
    1169:	53                   	push   %rbx
    116a:	49 89 f3             	mov    %rsi,%r11
    116d:	49 89 d1             	mov    %rdx,%r9
  unsigned int i,j,k;
  
  for (i = 0; i < N; ++i)
    1170:	49 89 fa             	mov    %rdi,%r10
    1173:	48 8d 9a 00 09 3d 00 	lea    0x3d0900(%rdx),%rbx
    for (j = 0; j < N; ++j)
      for (k = 0; k < N; ++k)
        C[i][j] += A[i][k] * B[j][k];
    117a:	4c 89 d7             	mov    %r10,%rdi
    117d:	4d 89 d8             	mov    %r11,%r8
    1180:	4c 89 c9             	mov    %r9,%rcx
    1183:	49 81 c1 a0 0f 00 00 	add    $0xfa0,%r9
    118a:	4c 89 c6             	mov    %r8,%rsi
    118d:	b8 00 00 00 00       	mov    $0x0,%eax
    1192:	8b 14 07             	mov    (%rdi,%rax,1),%edx
    1195:	0f af 14 06          	imul   (%rsi,%rax,1),%edx
    1199:	01 11                	add    %edx,(%rcx)
      for (k = 0; k < N; ++k)
    119b:	48 83 c0 04          	add    $0x4,%rax
    119f:	48 3d a0 0f 00 00    	cmp    $0xfa0,%rax
    11a5:	75 eb                	jne    1192 <mmult_traspuesta+0x29>
    for (j = 0; j < N; ++j)
    11a7:	48 83 c1 04          	add    $0x4,%rcx
    11ab:	49 81 c0 a0 0f 00 00 	add    $0xfa0,%r8
    11b2:	4c 39 c9             	cmp    %r9,%rcx
    11b5:	75 d3                	jne    118a <mmult_traspuesta+0x21>
  for (i = 0; i < N; ++i)
    11b7:	49 81 c2 a0 0f 00 00 	add    $0xfa0,%r10
    11be:	4c 39 cb             	cmp    %r9,%rbx
    11c1:	75 b7                	jne    117a <mmult_traspuesta+0x11>

  return;
}
    11c3:	5b                   	pop    %rbx
    11c4:	c3                   	ret

00000000000011c5 <trasponer>:

void trasponer(int M[N][N], int T[N][N]) {
    11c5:	49 89 f8             	mov    %rdi,%r8
    11c8:	48 89 f7             	mov    %rsi,%rdi
  unsigned int i,j;
  
  for (i = 0; i < N; ++i)
    11cb:	49 8d b0 00 09 3d 00 	lea    0x3d0900(%r8),%rsi
    11d2:	49 81 c0 a0 18 3d 00 	add    $0x3d18a0,%r8
    for (j = 0; j < N; ++j)
    11d9:	48 8d 86 00 f7 c2 ff 	lea    -0x3d0900(%rsi),%rax
void trasponer(int M[N][N], int T[N][N]) {
    11e0:	48 89 fa             	mov    %rdi,%rdx
      T[i][j] = M[j][i];
    11e3:	8b 08                	mov    (%rax),%ecx
    11e5:	89 0a                	mov    %ecx,(%rdx)
    for (j = 0; j < N; ++j)
    11e7:	48 05 a0 0f 00 00    	add    $0xfa0,%rax
    11ed:	48 83 c2 04          	add    $0x4,%rdx
    11f1:	48 39 f0             	cmp    %rsi,%rax
    11f4:	75 ed                	jne    11e3 <trasponer+0x1e>
  for (i = 0; i < N; ++i)
    11f6:	48 81 c7 a0 0f 00 00 	add    $0xfa0,%rdi
    11fd:	48 83 c6 04          	add    $0x4,%rsi
    1201:	4c 39 c6             	cmp    %r8,%rsi
    1204:	75 d3                	jne    11d9 <trasponer+0x14>

  return;
}
    1206:	c3                   	ret

0000000000001207 <main>:
	   
int main(void) {
    1207:	41 55                	push   %r13
    1209:	41 54                	push   %r12
    120b:	55                   	push   %rbp
    120c:	53                   	push   %rbx
    120d:	48 83 ec 08          	sub    $0x8,%rsp
  static int m1[N][N], m2[N][N], res[N][N], tmp[N][N];
  unsigned int i,j;

  memset(res,0,N*N*sizeof(int));
    1211:	ba 00 09 3d 00       	mov    $0x3d0900,%edx
    1216:	be 00 00 00 00       	mov    $0x0,%esi
    121b:	48 8d 3d 3e 49 b7 00 	lea    0xb7493e(%rip),%rdi        # b75b60 <res.3>
    1222:	e8 09 fe ff ff       	call   1030 <memset@plt>

  srand(time(NULL));
    1227:	bf 00 00 00 00       	mov    $0x0,%edi
    122c:	e8 1f fe ff ff       	call   1050 <time@plt>
    1231:	89 c7                	mov    %eax,%edi
    1233:	e8 08 fe ff ff       	call   1040 <srand@plt>
  
  for (i = 0; i < N; ++i)
    1238:	48 8d 2d 21 40 7a 00 	lea    0x7a4021(%rip),%rbp        # 7a5260 <m2.2>
    123f:	4c 8d 25 1a 37 3d 00 	lea    0x3d371a(%rip),%r12        # 3d4960 <m1.1>
    1246:	4c 8d ad 00 09 3d 00 	lea    0x3d0900(%rbp),%r13
int main(void) {
    124d:	bb 00 00 00 00       	mov    $0x0,%ebx
    for (j = 0; j < N; ++j) {
      m1[i][j] = m2[i][j] = (int)rand();
    1252:	e8 09 fe ff ff       	call   1060 <rand@plt>
    1257:	89 44 1d 00          	mov    %eax,0x0(%rbp,%rbx,1)
    125b:	41 89 04 1c          	mov    %eax,(%r12,%rbx,1)
    for (j = 0; j < N; ++j) {
    125f:	48 83 c3 04          	add    $0x4,%rbx
    1263:	48 81 fb a0 0f 00 00 	cmp    $0xfa0,%rbx
    126a:	75 e6                	jne    1252 <main+0x4b>
  for (i = 0; i < N; ++i)
    126c:	48 81 c5 a0 0f 00 00 	add    $0xfa0,%rbp
    1273:	49 81 c4 a0 0f 00 00 	add    $0xfa0,%r12
    127a:	4c 39 ed             	cmp    %r13,%rbp
    127d:	75 ce                	jne    124d <main+0x46>
    }

  trasponer(m2,tmp);
    127f:	48 8d 1d da 2d 00 00 	lea    0x2dda(%rip),%rbx        # 4060 <tmp.0>
    1286:	48 89 de             	mov    %rbx,%rsi
    1289:	48 8d 3d d0 3f 7a 00 	lea    0x7a3fd0(%rip),%rdi        # 7a5260 <m2.2>
    1290:	e8 30 ff ff ff       	call   11c5 <trasponer>
	    
  mmult_traspuesta(m1,tmp,res);
    1295:	48 8d 15 c4 48 b7 00 	lea    0xb748c4(%rip),%rdx        # b75b60 <res.3>
    129c:	48 89 de             	mov    %rbx,%rsi
    129f:	48 8d 3d ba 36 3d 00 	lea    0x3d36ba(%rip),%rdi        # 3d4960 <m1.1>
    12a6:	e8 be fe ff ff       	call   1169 <mmult_traspuesta>

  return 0;
}
    12ab:	b8 00 00 00 00       	mov    $0x0,%eax
    12b0:	48 83 c4 08          	add    $0x8,%rsp
    12b4:	5b                   	pop    %rbx
    12b5:	5d                   	pop    %rbp
    12b6:	41 5c                	pop    %r12
    12b8:	41 5d                	pop    %r13
    12ba:	c3                   	ret

Desensamblado de la sección .fini:

00000000000012bc <_fini>:
    12bc:	48 83 ec 08          	sub    $0x8,%rsp
    12c0:	48 83 c4 08          	add    $0x8,%rsp
    12c4:	c3                   	ret
