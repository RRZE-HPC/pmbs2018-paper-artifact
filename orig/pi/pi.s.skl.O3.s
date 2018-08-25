	.file	"pi.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC6:
	.string	"DIV Benchmark, 6 Flop/it\nTime [s] | MFlop/s | MLUP/s  | Iterations | PI"
	.align 8
.LC10:
	.string	"%.5lf  | %7.1f | %7.1f | %d |%.15lf \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	leaq	8(%rsp), %r10
	.cfi_def_cfa 10, 0
	andq	$-32, %rsp
	pushq	-8(%r10)
	pushq	%rbp
	.cfi_escape 0x10,0x6,0x2,0x76,0
	movq	%rsp, %rbp
	pushq	%r10
	.cfi_escape 0xf,0x3,0x76,0x78,0x6
	leaq	-32(%rbp), %rsi
	leaq	-48(%rbp), %rdi
	subq	$104, %rsp
	call	timing
	vmovdqa	.LC0(%rip), %ymm2
	xorl	%eax, %eax
	vmovdqa	.LC1(%rip), %ymm8
	vmovapd	.LC2(%rip), %ymm7
	vmovapd	.LC3(%rip), %ymm6
	vxorpd	%xmm3, %xmm3, %xmm3
	vmovapd	.LC4(%rip), %ymm5
	vmovapd	.LC5(%rip), %ymm4
	.p2align 4,,10
	.p2align 3
.L2:
	vextracti128	$0x1, %ymm2, %xmm0
	vcvtdq2pd	%xmm2, %ymm1
	vaddpd	%ymm7, %ymm1, %ymm1
	addl	$1, %eax
	vcvtdq2pd	%xmm0, %ymm0
	vaddpd	%ymm7, %ymm0, %ymm0
	vpaddd	%ymm8, %ymm2, %ymm2
	vmulpd	%ymm6, %ymm1, %ymm1
	vmulpd	%ymm6, %ymm0, %ymm0
	vfmadd132pd	%ymm1, %ymm5, %ymm1
	vfmadd132pd	%ymm0, %ymm5, %ymm0
	vdivpd	%ymm1, %ymm4, %ymm1
	vdivpd	%ymm0, %ymm4, %ymm0
	vaddpd	%ymm1, %ymm0, %ymm0
	vaddpd	%ymm0, %ymm3, %ymm3
	cmpl	$125000000, %eax
	jne	.L2
	leaq	-24(%rbp), %rsi
	leaq	-40(%rbp), %rdi
	vmovapd	%ymm3, -112(%rbp)
	vzeroupper
	call	timing
	vmovsd	-40(%rbp), %xmm0
	vsubsd	-48(%rbp), %xmm0, %xmm0
	movl	$.LC6, %edi
	vmovsd	%xmm0, -56(%rbp)
	call	puts
	vmovapd	-112(%rbp), %ymm3
	vmovsd	-56(%rbp), %xmm0
	movl	$1000000000, %esi
	vmovsd	.LC8(%rip), %xmm2
	movl	$.LC10, %edi
	movl	$4, %eax
	vhaddpd	%ymm3, %ymm3, %ymm3
	vdivsd	%xmm0, %xmm2, %xmm2
	vperm2f128	$1, %ymm3, %ymm3, %ymm1
	vaddpd	%ymm1, %ymm3, %ymm3
	vmovapd	%xmm3, %xmm1
	vmovsd	.LC7(%rip), %xmm3
	vmulsd	%xmm1, %xmm3, %xmm3
	vmovsd	.LC9(%rip), %xmm1
	vdivsd	%xmm0, %xmm1, %xmm1
	vzeroupper
	call	printf
	addq	$104, %rsp
	xorl	%eax, %eax
	popq	%r10
	.cfi_def_cfa 10, 0
	popq	%rbp
	leaq	-8(%r10), %rsp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst32,"aM",@progbits,32
	.align 32
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.long	4
	.long	5
	.long	6
	.long	7
	.align 32
.LC1:
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.long	8
	.align 32
.LC2:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 32
.LC3:
	.long	3894859413
	.long	1041313291
	.long	3894859413
	.long	1041313291
	.long	3894859413
	.long	1041313291
	.long	3894859413
	.long	1041313291
	.align 32
.LC4:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 32
.LC5:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC7:
	.long	3894859413
	.long	1041313291
	.align 8
.LC8:
	.long	0
	.long	1083129856
	.align 8
.LC9:
	.long	0
	.long	1085763584
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
