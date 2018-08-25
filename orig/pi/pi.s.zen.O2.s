	.file	"pi.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"DIV Benchmark, 6 Flop/it\nTime [s] | MFlop/s | MLUP/s  | Iterations | PI"
	.align 8
.LC8:
	.string	"%.5lf  | %7.1f | %7.1f | %d |%.15lf \n"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	leaq	48(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	timing
	vmovsd	.LC1(%rip), %xmm5
	vxorpd	%xmm1, %xmm1, %xmm1
	xorl	%eax, %eax
	vmovsd	.LC2(%rip), %xmm3
	vmovsd	.LC3(%rip), %xmm4
	vmovsd	.LC4(%rip), %xmm2
	.p2align 4,,15
.L2:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vaddsd	%xmm5, %xmm0, %xmm0
	incl	%eax
	vmulsd	%xmm3, %xmm0, %xmm0
	vfmadd132sd	%xmm0, %xmm4, %xmm0
	vdivsd	%xmm0, %xmm2, %xmm0
	vaddsd	%xmm0, %xmm1, %xmm1
	cmpl	$1000000000, %eax
	jne	.L2
	leaq	56(%rsp), %rsi
	leaq	40(%rsp), %rdi
	vmovsd	%xmm3, 24(%rsp)
	vmovsd	%xmm1, 16(%rsp)
	call	timing
	vmovsd	40(%rsp), %xmm0
	movl	$.LC5, %edi
	vsubsd	32(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rsp)
	call	puts
	vmovsd	16(%rsp), %xmm1
	movl	$1000000000, %esi
	vmovsd	24(%rsp), %xmm3
	movl	$.LC8, %edi
	movl	$4, %eax
	vmovsd	8(%rsp), %xmm0
	vmovsd	.LC6(%rip), %xmm2
	vmulsd	%xmm3, %xmm1, %xmm3
	vmovsd	.LC7(%rip), %xmm1
	vdivsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm0, %xmm1, %xmm1
	call	printf
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	1071644672
	.align 8
.LC2:
	.long	3894859413
	.long	1041313291
	.align 8
.LC3:
	.long	0
	.long	1072693248
	.align 8
.LC4:
	.long	0
	.long	1074790400
	.align 8
.LC6:
	.long	0
	.long	1083129856
	.align 8
.LC7:
	.long	0
	.long	1085763584
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
