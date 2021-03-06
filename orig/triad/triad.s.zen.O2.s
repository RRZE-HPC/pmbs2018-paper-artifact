	.file	"triad.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"%12.1f | %9.8f | %9.3f | %7.1f | %7.1f | %7d | %4d \n"
	.text
	.p2align 4,,15
	.globl	triad
	.type	triad, @function
triad:
.LFB24:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%edi, %rbp
	movl	$64, %edi
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rbp, %r14
	movl	%ebp, 12(%rsp)
	salq	$3, %rbp
	movq	%rbp, %rsi
	call	aligned_alloc
	movq	%rbp, %rsi
	movl	$64, %edi
	movq	%rax, %rbx
	call	aligned_alloc
	movq	%rbp, %rsi
	movl	$64, %edi
	movq	%rax, %r15
	call	aligned_alloc
	movq	%rbp, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movq	%rax, %rbp
	movl	12(%rsp), %eax
	leal	-1(%rax), %ecx
	testl	%r14d, %r14d
	jle	.L2
	vmovsd	.LC0(%rip), %xmm0
	decl	%eax
	movq	%rax, %rcx
	leaq	8(,%rax,8), %rdx
	xorl	%eax, %eax
	.p2align 4,,15
.L3:
	vmovsd	%xmm0, 0(%rbp,%rax)
	vmovsd	%xmm0, (%r12,%rax)
	vmovsd	%xmm0, (%r15,%rax)
	vmovsd	%xmm0, (%rbx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L3
.L2:
	leaq	8(,%rcx,8), %r13
	movl	$1, 8(%rsp)
	.p2align 4,,15
.L9:
	leaq	40(%rsp), %rsi
	leaq	24(%rsp), %rdi
	xorl	%r14d, %r14d
	call	timing
	.p2align 4,,15
.L8:
	vmovsd	(%rbx), %xmm0
	vxorpd	%xmm4, %xmm4, %xmm4
	vucomisd	%xmm4, %xmm0
	jbe	.L4
	movq	%rbx, %rdi
	call	dummy
.L4:
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L6
	xorl	%eax, %eax
	.p2align 4,,15
.L7:
	vmovsd	(%r12,%rax), %xmm0
	vmovsd	(%r15,%rax), %xmm3
	vfmadd132sd	0(%rbp,%rax), %xmm3, %xmm0
	vmovsd	%xmm0, (%rbx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r13
	jne	.L7
.L6:
	incl	%r14d
	cmpl	8(%rsp), %r14d
	jne	.L8
	leaq	40(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	timing
	vmovsd	32(%rsp), %xmm1
	leal	(%r14,%r14), %eax
	vmovsd	.LC2(%rip), %xmm7
	movl	%eax, 8(%rsp)
	vsubsd	24(%rsp), %xmm1, %xmm1
	vucomisd	%xmm1, %xmm7
	ja	.L9
	movl	12(%rsp), %edx
	movl	%eax, %esi
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm0, %xmm0, %xmm0
	sarl	%esi
	vmovsd	.LC3(%rip), %xmm5
	vmovsd	.LC5(%rip), %xmm7
	movl	$.LC8, %edi
	vcvtsi2sd	%esi, %xmm6, %xmm6
	movl	$5, %eax
	vcvtsi2sd	%edx, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm6, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vdivsd	%xmm5, %xmm2, %xmm4
	vmulsd	.LC4(%rip), %xmm6, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm5, %xmm4, %xmm4
	vdivsd	%xmm1, %xmm2, %xmm2
	vmulsd	%xmm7, %xmm2, %xmm3
	vaddsd	%xmm0, %xmm0, %xmm2
	vmulsd	.LC7(%rip), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm2, %xmm2
	vmulsd	%xmm7, %xmm3, %xmm3
	vmulsd	.LC6(%rip), %xmm2, %xmm2
	vdivsd	%xmm5, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%rbx, %rdi
	call	free
	movq	%r15, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	jmp	free
	.cfi_endproc
.LFE24:
	.size	triad, .-triad
	.section	.rodata.str1.8
	.align 8
.LC9:
	.string	"TRIAD a[i] = b[i]+c[i]*d[i], 32 byte/it, 2 Flop/it"
	.align 8
.LC10:
	.string	"Size (KByte) |   runtime  |  MFlop/s  |  MB/s   |  MLUP/s | repeat | size"
	.section	.text.startup,"ax",@progbits
	.p2align 4,,15
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	$.LC9, %edi
	movl	$20, %ebx
	call	puts
	movl	$.LC10, %edi
	call	puts
	.p2align 4,,15
.L20:
	vmovsd	.LC11(%rip), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%ebx, %xmm1, %xmm1
	incl	%ebx
	call	pow
	vcvttsd2si	%xmm0, %edi
	call	triad
	cmpl	$36, %ebx
	jne	.L20
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	1907715710
	.long	1048610426
	.align 8
.LC2:
	.long	2576980378
	.long	1070176665
	.align 8
.LC3:
	.long	0
	.long	1083129856
	.align 8
.LC4:
	.long	0
	.long	1077936128
	.align 8
.LC5:
	.long	0
	.long	1062207488
	.align 8
.LC6:
	.long	2696277389
	.long	1051772663
	.align 8
.LC7:
	.long	0
	.long	1075838976
	.align 8
.LC11:
	.long	3435973837
	.long	1073007820
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
