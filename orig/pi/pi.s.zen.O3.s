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
	subq	$72, %rsp
	.cfi_def_cfa_offset 80
	leaq	48(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	timing
	vmovaps	.LC0(%rip), %xmm2
	xorl	%eax, %eax
	vxorps	%xmm3, %xmm3, %xmm3
	vmovaps	.LC1(%rip), %xmm8
	vmovaps	.LC2(%rip), %xmm7
	vmovaps	.LC3(%rip), %xmm6
	vmovaps	.LC4(%rip), %xmm5
	vmovaps	.LC5(%rip), %xmm4
	.p2align 4,,15
.L2:
	vpshufd	$238, %xmm2, %xmm0
	vcvtdq2pd	%xmm2, %xmm1
	incl	%eax
	vcvtdq2pd	%xmm0, %xmm0
	vpaddd	%xmm8, %xmm2, %xmm2
	vaddpd	%xmm7, %xmm1, %xmm1
	vaddpd	%xmm7, %xmm0, %xmm0
	vmulpd	%xmm6, %xmm1, %xmm1
	vmulpd	%xmm6, %xmm0, %xmm0
	vfmadd132pd	%xmm1, %xmm5, %xmm1
	vfmadd132pd	%xmm0, %xmm5, %xmm0
	vdivpd	%xmm1, %xmm4, %xmm1
	vdivpd	%xmm0, %xmm4, %xmm0
	vaddpd	%xmm1, %xmm0, %xmm0
	vaddpd	%xmm0, %xmm3, %xmm3
	cmpl	$250000000, %eax
	jne	.L2
	leaq	56(%rsp), %rsi
	leaq	40(%rsp), %rdi
	vmovaps	%xmm3, 16(%rsp)
	call	timing
	movl	$.LC6, %edi
	vmovsd	40(%rsp), %xmm0
	vsubsd	32(%rsp), %xmm0, %xmm0
	vmovsd	%xmm0, 8(%rsp)
	call	puts
	vmovaps	16(%rsp), %xmm3
	movl	$1000000000, %esi
	vmovsd	8(%rsp), %xmm0
	movl	$.LC10, %edi
	movl	$4, %eax
	vmovsd	.LC8(%rip), %xmm2
	vmovsd	.LC9(%rip), %xmm1
	vhaddpd	%xmm3, %xmm3, %xmm3
	vdivsd	%xmm0, %xmm2, %xmm2
	vmulsd	.LC7(%rip), %xmm3, %xmm3
	vdivsd	%xmm0, %xmm1, %xmm1
	call	printf
	xorl	%eax, %eax
	addq	$72, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE24:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	1
	.long	2
	.long	3
	.align 16
.LC1:
	.long	4
	.long	4
	.long	4
	.long	4
	.align 16
.LC2:
	.long	0
	.long	1071644672
	.long	0
	.long	1071644672
	.align 16
.LC3:
	.long	3894859413
	.long	1041313291
	.long	3894859413
	.long	1041313291
	.align 16
.LC4:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 16
.LC5:
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
