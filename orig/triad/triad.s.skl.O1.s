	.file	"triad.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC8:
	.string	"%12.1f | %9.8f | %9.3f | %7.1f | %7.1f | %7d | %4d \n"
	.text
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
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movl	%edi, %r15d
	movl	%edi, 12(%rsp)
	movslq	%edi, %rbp
	salq	$3, %rbp
	movq	%rbp, %rsi
	movl	$64, %edi
	call	aligned_alloc
	movq	%rax, %rbx
	movq	%rbp, %rsi
	movl	$64, %edi
	call	aligned_alloc
	movq	%rax, %r13
	movq	%rbp, %rsi
	movl	$64, %edi
	call	aligned_alloc
	movq	%rax, %r12
	movq	%rbp, %rsi
	movl	$64, %edi
	call	aligned_alloc
	movq	%rax, %rbp
	testl	%r15d, %r15d
	jle	.L2
	leal	-1(%r15), %eax
	leaq	8(,%rax,8), %rdx
	movl	$0, %eax
	vmovsd	.LC0(%rip), %xmm0
.L3:
	vmovsd	%xmm0, 0(%rbp,%rax)
	vmovsd	%xmm0, (%r12,%rax)
	vmovsd	%xmm0, 0(%r13,%rax)
	vmovsd	%xmm0, (%rbx,%rax)
	addq	$8, %rax
	cmpq	%rax, %rdx
	jne	.L3
.L2:
	movl	12(%rsp), %eax
	leal	-1(%rax), %eax
	leaq	8(,%rax,8), %r14
	movl	$1, 8(%rsp)
	jmp	.L10
.L5:
	cmpl	$0, 12(%rsp)
	jle	.L7
	movl	$0, %eax
.L8:
	vmovsd	(%r12,%rax), %xmm0
	vmulsd	0(%rbp,%rax), %xmm0, %xmm0
	vaddsd	0(%r13,%rax), %xmm0, %xmm0
	vmovsd	%xmm0, (%rbx,%rax)
	addq	$8, %rax
	cmpq	%rax, %r14
	jne	.L8
.L7:
	addl	$1, %r15d
	cmpl	8(%rsp), %r15d
	je	.L4
.L9:
	vmovsd	(%rbx), %xmm0
	vucomisd	.LC1(%rip), %xmm0
	jbe	.L5
	movq	%rbx, %rdi
	call	dummy
	jmp	.L5
.L4:
	leaq	24(%rsp), %rsi
	leaq	32(%rsp), %rdi
	call	timing
	vmovsd	32(%rsp), %xmm1
	vsubsd	40(%rsp), %xmm1, %xmm1
	sall	8(%rsp)
	vmovsd	.LC2(%rip), %xmm0
	vucomisd	%xmm1, %xmm0
	jbe	.L17
.L10:
	leaq	24(%rsp), %rsi
	leaq	40(%rsp), %rdi
	call	timing
	cmpl	$0, 8(%rsp)
	jle	.L4
	movl	$0, %r15d
	jmp	.L9
.L17:
	movl	8(%rsp), %esi
	sarl	%esi
	vxorpd	%xmm6, %xmm6, %xmm6
	vcvtsi2sd	%esi, %xmm6, %xmm6
	movl	12(%rsp), %edx
	vxorpd	%xmm0, %xmm0, %xmm0
	vcvtsi2sd	%edx, %xmm0, %xmm0
	vmulsd	%xmm0, %xmm6, %xmm4
	vdivsd	%xmm1, %xmm4, %xmm4
	vmovsd	.LC3(%rip), %xmm5
	vdivsd	%xmm5, %xmm4, %xmm4
	vmulsd	.LC4(%rip), %xmm6, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm1, %xmm2, %xmm2
	vmovsd	.LC5(%rip), %xmm7
	vmulsd	%xmm7, %xmm2, %xmm3
	vaddsd	%xmm0, %xmm0, %xmm2
	vmulsd	%xmm6, %xmm2, %xmm2
	vmulsd	.LC6(%rip), %xmm2, %xmm2
	vmulsd	.LC7(%rip), %xmm0, %xmm0
	vdivsd	%xmm5, %xmm0, %xmm0
	vdivsd	%xmm5, %xmm4, %xmm4
	vmulsd	%xmm7, %xmm3, %xmm3
	vdivsd	%xmm1, %xmm2, %xmm2
	movl	$.LC8, %edi
	movl	$5, %eax
	call	printf
	movq	%rbx, %rdi
	call	free
	movq	%r13, %rdi
	call	free
	movq	%r12, %rdi
	call	free
	movq	%rbp, %rdi
	call	free
	addq	$56, %rsp
	.cfi_def_cfa_offset 56
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
	ret
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
	.text
	.globl	main
	.type	main, @function
main:
.LFB25:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	movl	$.LC9, %edi
	call	puts
	movl	$.LC10, %edi
	call	puts
	movl	$20, %ebx
	movq	.LC11(%rip), %rbp
.L19:
	vxorpd	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%ebx, %xmm1, %xmm1
	vmovq	%rbp, %xmm0
	call	pow
	vcvttsd2si	%xmm0, %edi
	call	triad
	addl	$1, %ebx
	cmpl	$36, %ebx
	jne	.L19
	movl	$0, %eax
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
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
.LC1:
	.long	0
	.long	0
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
