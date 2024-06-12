
./array_O0:     formato del fichero elf64-x86-64


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

0000000000001020 <free@plt-0x10>:
    1020:	ff 35 ca 2f 00 00    	push   0x2fca(%rip)        # 3ff0 <_GLOBAL_OFFSET_TABLE_+0x8>
    1026:	ff 25 cc 2f 00 00    	jmp    *0x2fcc(%rip)        # 3ff8 <_GLOBAL_OFFSET_TABLE_+0x10>
    102c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000001030 <free@plt>:
    1030:	ff 25 ca 2f 00 00    	jmp    *0x2fca(%rip)        # 4000 <free@GLIBC_2.2.5>
    1036:	68 00 00 00 00       	push   $0x0
    103b:	e9 e0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001040 <malloc@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <malloc@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <atoi@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <atoi@GLIBC_2.2.5>
    1056:	68 02 00 00 00       	push   $0x2
    105b:	e9 c0 ff ff ff       	jmp    1020 <_init+0x20>

Desensamblado de la sección .plt.got:

0000000000001060 <__cxa_finalize@plt>:
    1060:	ff 25 7a 2f 00 00    	jmp    *0x2f7a(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1066:	66 90                	xchg   %ax,%ax

Desensamblado de la sección .text:

0000000000001070 <_start>:
    1070:	31 ed                	xor    %ebp,%ebp
    1072:	49 89 d1             	mov    %rdx,%r9
    1075:	5e                   	pop    %rsi
    1076:	48 89 e2             	mov    %rsp,%rdx
    1079:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
    107d:	50                   	push   %rax
    107e:	54                   	push   %rsp
    107f:	45 31 c0             	xor    %r8d,%r8d
    1082:	31 c9                	xor    %ecx,%ecx
    1084:	48 8d 3d 0e 01 00 00 	lea    0x10e(%rip),%rdi        # 1199 <main>
    108b:	ff 15 2f 2f 00 00    	call   *0x2f2f(%rip)        # 3fc0 <__libc_start_main@GLIBC_2.34>
    1091:	f4                   	hlt
    1092:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
    1099:	00 00 00 
    109c:	0f 1f 40 00          	nopl   0x0(%rax)

00000000000010a0 <deregister_tm_clones>:
    10a0:	48 8d 3d 81 2f 00 00 	lea    0x2f81(%rip),%rdi        # 4028 <__TMC_END__>
    10a7:	48 8d 05 7a 2f 00 00 	lea    0x2f7a(%rip),%rax        # 4028 <__TMC_END__>
    10ae:	48 39 f8             	cmp    %rdi,%rax
    10b1:	74 15                	je     10c8 <deregister_tm_clones+0x28>
    10b3:	48 8b 05 0e 2f 00 00 	mov    0x2f0e(%rip),%rax        # 3fc8 <_ITM_deregisterTMCloneTable@Base>
    10ba:	48 85 c0             	test   %rax,%rax
    10bd:	74 09                	je     10c8 <deregister_tm_clones+0x28>
    10bf:	ff e0                	jmp    *%rax
    10c1:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
    10c8:	c3                   	ret
    10c9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

00000000000010d0 <register_tm_clones>:
    10d0:	48 8d 3d 51 2f 00 00 	lea    0x2f51(%rip),%rdi        # 4028 <__TMC_END__>
    10d7:	48 8d 35 4a 2f 00 00 	lea    0x2f4a(%rip),%rsi        # 4028 <__TMC_END__>
    10de:	48 29 fe             	sub    %rdi,%rsi
    10e1:	48 89 f0             	mov    %rsi,%rax
    10e4:	48 c1 ee 3f          	shr    $0x3f,%rsi
    10e8:	48 c1 f8 03          	sar    $0x3,%rax
    10ec:	48 01 c6             	add    %rax,%rsi
    10ef:	48 d1 fe             	sar    %rsi
    10f2:	74 14                	je     1108 <register_tm_clones+0x38>
    10f4:	48 8b 05 dd 2e 00 00 	mov    0x2edd(%rip),%rax        # 3fd8 <_ITM_registerTMCloneTable@Base>
    10fb:	48 85 c0             	test   %rax,%rax
    10fe:	74 08                	je     1108 <register_tm_clones+0x38>
    1100:	ff e0                	jmp    *%rax
    1102:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
    1108:	c3                   	ret
    1109:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001110 <__do_global_dtors_aux>:
    1110:	f3 0f 1e fa          	endbr64
    1114:	80 3d 0d 2f 00 00 00 	cmpb   $0x0,0x2f0d(%rip)        # 4028 <__TMC_END__>
    111b:	75 2b                	jne    1148 <__do_global_dtors_aux+0x38>
    111d:	55                   	push   %rbp
    111e:	48 83 3d ba 2e 00 00 	cmpq   $0x0,0x2eba(%rip)        # 3fe0 <__cxa_finalize@GLIBC_2.2.5>
    1125:	00 
    1126:	48 89 e5             	mov    %rsp,%rbp
    1129:	74 0c                	je     1137 <__do_global_dtors_aux+0x27>
    112b:	48 8b 3d ee 2e 00 00 	mov    0x2eee(%rip),%rdi        # 4020 <__dso_handle>
    1132:	e8 29 ff ff ff       	call   1060 <__cxa_finalize@plt>
    1137:	e8 64 ff ff ff       	call   10a0 <deregister_tm_clones>
    113c:	c6 05 e5 2e 00 00 01 	movb   $0x1,0x2ee5(%rip)        # 4028 <__TMC_END__>
    1143:	5d                   	pop    %rbp
    1144:	c3                   	ret
    1145:	0f 1f 00             	nopl   (%rax)
    1148:	c3                   	ret
    1149:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)

0000000000001150 <frame_dummy>:
    1150:	f3 0f 1e fa          	endbr64
    1154:	e9 77 ff ff ff       	jmp    10d0 <register_tm_clones>

0000000000001159 <add_array>:
#include <stdlib.h>

long add_array(int* A, int size)
{
    1159:	55                   	push   %rbp
    115a:	48 89 e5             	mov    %rsp,%rbp
    115d:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
    1161:	89 75 e4             	mov    %esi,-0x1c(%rbp)
  unsigned i;
  long result;
  
  for (i = 0; i < size; i++)
    1164:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    116b:	eb 1e                	jmp    118b <add_array+0x32>
      result += A[i];
    116d:	8b 45 fc             	mov    -0x4(%rbp),%eax
    1170:	48 8d 14 85 00 00 00 	lea    0x0(,%rax,4),%rdx
    1177:	00 
    1178:	48 8b 45 e8          	mov    -0x18(%rbp),%rax
    117c:	48 01 d0             	add    %rdx,%rax
    117f:	8b 00                	mov    (%rax),%eax
    1181:	48 98                	cltq
    1183:	48 01 45 f0          	add    %rax,-0x10(%rbp)
  for (i = 0; i < size; i++)
    1187:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    118b:	8b 45 e4             	mov    -0x1c(%rbp),%eax
    118e:	39 45 fc             	cmp    %eax,-0x4(%rbp)
    1191:	72 da                	jb     116d <add_array+0x14>
  
  return result;
    1193:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
}
    1197:	5d                   	pop    %rbp
    1198:	c3                   	ret

0000000000001199 <main>:


int main(int argc, char *argv[]) {
    1199:	55                   	push   %rbp
    119a:	48 89 e5             	mov    %rsp,%rbp
    119d:	48 83 ec 30          	sub    $0x30,%rsp
    11a1:	89 7d dc             	mov    %edi,-0x24(%rbp)
    11a4:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
  volatile long result;
  unsigned size = atoi(argv[1]);
    11a8:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
    11ac:	48 83 c0 08          	add    $0x8,%rax
    11b0:	48 8b 00             	mov    (%rax),%rax
    11b3:	48 89 c7             	mov    %rax,%rdi
    11b6:	e8 95 fe ff ff       	call   1050 <atoi@plt>
    11bb:	89 45 f8             	mov    %eax,-0x8(%rbp)
  unsigned it;
  
  int* A = (int*)malloc(size * sizeof(int));
    11be:	8b 45 f8             	mov    -0x8(%rbp),%eax
    11c1:	48 c1 e0 02          	shl    $0x2,%rax
    11c5:	48 89 c7             	mov    %rax,%rdi
    11c8:	e8 73 fe ff ff       	call   1040 <malloc@plt>
    11cd:	48 89 45 f0          	mov    %rax,-0x10(%rbp)

  for (it = 0; it < 100; it++)  
    11d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
    11d8:	eb 19                	jmp    11f3 <main+0x5a>
    result = add_array(A, size);
    11da:	8b 55 f8             	mov    -0x8(%rbp),%edx
    11dd:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11e1:	89 d6                	mov    %edx,%esi
    11e3:	48 89 c7             	mov    %rax,%rdi
    11e6:	e8 6e ff ff ff       	call   1159 <add_array>
    11eb:	48 89 45 e8          	mov    %rax,-0x18(%rbp)
  for (it = 0; it < 100; it++)  
    11ef:	83 45 fc 01          	addl   $0x1,-0x4(%rbp)
    11f3:	83 7d fc 63          	cmpl   $0x63,-0x4(%rbp)
    11f7:	76 e1                	jbe    11da <main+0x41>

  free(A);
    11f9:	48 8b 45 f0          	mov    -0x10(%rbp),%rax
    11fd:	48 89 c7             	mov    %rax,%rdi
    1200:	e8 2b fe ff ff       	call   1030 <free@plt>
    1205:	b8 00 00 00 00       	mov    $0x0,%eax
}
    120a:	c9                   	leave
    120b:	c3                   	ret

Desensamblado de la sección .fini:

000000000000120c <_fini>:
    120c:	48 83 ec 08          	sub    $0x8,%rsp
    1210:	48 83 c4 08          	add    $0x8,%rsp
    1214:	c3                   	ret
