
./array_O1:     formato del fichero elf64-x86-64


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

0000000000001040 <strtol@plt>:
    1040:	ff 25 c2 2f 00 00    	jmp    *0x2fc2(%rip)        # 4008 <strtol@GLIBC_2.2.5>
    1046:	68 01 00 00 00       	push   $0x1
    104b:	e9 d0 ff ff ff       	jmp    1020 <_init+0x20>

0000000000001050 <malloc@plt>:
    1050:	ff 25 ba 2f 00 00    	jmp    *0x2fba(%rip)        # 4010 <malloc@GLIBC_2.2.5>
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
    1084:	48 8d 3d fc 00 00 00 	lea    0xfc(%rip),%rdi        # 1187 <main>
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
long add_array(int* A, int size)
{
  unsigned i;
  long result;
  
  for (i = 0; i < size; i++)
    1159:	85 f6                	test   %esi,%esi
    115b:	74 23                	je     1180 <add_array+0x27>
    115d:	48 89 f8             	mov    %rdi,%rax
    1160:	8d 56 ff             	lea    -0x1(%rsi),%edx
    1163:	48 8d 74 97 04       	lea    0x4(%rdi,%rdx,4),%rsi
    1168:	ba 00 00 00 00       	mov    $0x0,%edx
      result += A[i];
    116d:	48 63 08             	movslq (%rax),%rcx
    1170:	48 01 ca             	add    %rcx,%rdx
  for (i = 0; i < size; i++)
    1173:	48 83 c0 04          	add    $0x4,%rax
    1177:	48 39 f0             	cmp    %rsi,%rax
    117a:	75 f1                	jne    116d <add_array+0x14>
  
  return result;
}
    117c:	48 89 d0             	mov    %rdx,%rax
    117f:	c3                   	ret
  for (i = 0; i < size; i++)
    1180:	ba 00 00 00 00       	mov    $0x0,%edx
  return result;
    1185:	eb f5                	jmp    117c <add_array+0x23>

0000000000001187 <main>:


int main(int argc, char *argv[]) {
    1187:	41 54                	push   %r12
    1189:	55                   	push   %rbp
    118a:	53                   	push   %rbx
    118b:	48 83 ec 10          	sub    $0x10,%rsp

#ifdef __USE_EXTERN_INLINES
__extern_inline int
__NTH (atoi (const char *__nptr))
{
  return (int) strtol (__nptr, (char **) NULL, 10);
    118f:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
    1193:	ba 0a 00 00 00       	mov    $0xa,%edx
    1198:	be 00 00 00 00       	mov    $0x0,%esi
    119d:	e8 9e fe ff ff       	call   1040 <strtol@plt>
    11a2:	41 89 c4             	mov    %eax,%r12d
  volatile long result;
  unsigned size = atoi(argv[1]);
  unsigned it;
  
  int* A = (int*)malloc(size * sizeof(int));
    11a5:	89 c0                	mov    %eax,%eax
    11a7:	48 8d 3c 85 00 00 00 	lea    0x0(,%rax,4),%rdi
    11ae:	00 
    11af:	e8 9c fe ff ff       	call   1050 <malloc@plt>
    11b4:	48 89 c5             	mov    %rax,%rbp
    11b7:	bb 64 00 00 00       	mov    $0x64,%ebx

  for (it = 0; it < 100; it++)  
    result = add_array(A, size);
    11bc:	44 89 e6             	mov    %r12d,%esi
    11bf:	48 89 ef             	mov    %rbp,%rdi
    11c2:	e8 92 ff ff ff       	call   1159 <add_array>
    11c7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  for (it = 0; it < 100; it++)  
    11cc:	83 eb 01             	sub    $0x1,%ebx
    11cf:	75 eb                	jne    11bc <main+0x35>

  free(A);
    11d1:	48 89 ef             	mov    %rbp,%rdi
    11d4:	e8 57 fe ff ff       	call   1030 <free@plt>
}
    11d9:	b8 00 00 00 00       	mov    $0x0,%eax
    11de:	48 83 c4 10          	add    $0x10,%rsp
    11e2:	5b                   	pop    %rbx
    11e3:	5d                   	pop    %rbp
    11e4:	41 5c                	pop    %r12
    11e6:	c3                   	ret

Desensamblado de la sección .fini:

00000000000011e8 <_fini>:
    11e8:	48 83 ec 08          	sub    $0x8,%rsp
    11ec:	48 83 c4 08          	add    $0x8,%rsp
    11f0:	c3                   	ret
