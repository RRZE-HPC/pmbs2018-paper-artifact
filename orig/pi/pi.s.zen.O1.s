	.file	"pi.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC5:
	.string	"DIV Benchmark, 6 Flop/it\nTime [s] | MFlop/s | MLUP/s  | Iterations | PI"
	.align 8
.LC8:
	.string	"%.5lf  | %7.1f | %7.1f | %d |%.15lf \n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB24:
	.cfi_startproc
	subq	$56, %rsp
	.cfi_def_cfa_offset 64
	leaq	24(%rsp), %rsi
	leaq	40(%rsp), %rdi
	call	timing
	vxorpd	%xmm7, %xmm7, %xmm7
	vmovsd	%xmm7, (%rsp)
	movl	$0, %eax
	vmovsd	.LC1(%rip), %xmm4
	vmovsd	.LC2(%rip), %xmm3
	vmovsd	.LC3(%rip), %xmm2
	vmovsd	.LC4(%rip), %xmm1
.L2:
	vxorps	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%eax, %xmm0, %xmm0
	vaddsd	%xmm4, %xmm0, %xmm0
	vmulsd	%xmm3, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm0, %xmm0
	vaddsd	%xmm2, %xmm0, %xmm0
	vdivsd	%xmm0, %xmm1, %xmm0
	vaddsd	(%rsp), %xmm0, %xmm5
	vmovsd	%xmm5, (%rsp)
	incl	%eax
	cmpl	$1000000000, %eax
	jne	.L2
	leaq	16(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	timing
	vmovsd	32(%rsp), %xmm0
	vsubsd	40(%rsp), %xmm0, %xmm7
	vmovsd	%xmm7, 8(%rsp)
	movl	$.LC5, %edi
	call	puts
	vmovsd	(%rsp), %xmm4
	vmulsd	.LC2(%rip), %xmm4, %xmm3
	movl	$1000000000, %esi
	vmovsd	.LC6(%rip), %xmm2
	vmovsd	8(%rsp), %xmm7
	vdivsd	%xmm7, %xmm2, %xmm2
	vmovsd	.LC7(%rip), %xmm1
	vdivsd	%xmm7, %xmm1, %xmm1
	vmovaps	%xmm7, %xmm0
	movl	$.LC8, %edi
	movl	$4, %eax
	call	printf
	movl	$0, %eax
	addq	$56, %rsp
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
