	.file	"triad.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC9:
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
	movslq	%edi, %rbx
	movl	$64, %edi
	movq	%rbx, %rbp
	salq	$3, %rbx
	subq	$56, %rsp
	.cfi_def_cfa_offset 112
	movq	%rbx, %rsi
	call	aligned_alloc
	movq	%rbx, %rsi
	movl	$64, %edi
	movq	%rax, %r12
	call	aligned_alloc
	movq	%rbx, %rsi
	movl	$64, %edi
	movq	%rax, %r15
	call	aligned_alloc
	movq	%rbx, %rsi
	movl	$64, %edi
	movq	%rax, %r14
	call	aligned_alloc
	movq	%rax, %r13
	testl	%ebp, %ebp
	jle	.L2
	cmpl	$1, %ebp
	je	.L14
	vmovaps	.LC0(%rip), %xmm0
	movl	%ebp, %esi
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	shrl	%esi
	.p2align 4,,15
.L4:
	incl	%ecx
	vmovaps	%xmm0, 0(%r13,%rax)
	vmovaps	%xmm0, (%r14,%rax)
	vmovaps	%xmm0, (%r15,%rax)
	vmovaps	%xmm0, (%r12,%rax)
	addq	$16, %rax
	cmpl	%esi, %ecx
	jb	.L4
	movl	%ebp, %eax
	andl	$-2, %eax
	cmpl	%eax, %ebp
	je	.L2
.L3:
	vmovsd	.LC1(%rip), %xmm0
	cltq
	salq	$3, %rax
	vmovsd	%xmm0, 0(%r13,%rax)
	vmovsd	%xmm0, (%r14,%rax)
	vmovsd	%xmm0, (%r15,%rax)
	vmovsd	%xmm0, (%r12,%rax)
.L2:
	movl	%ebp, %eax
	movl	%ebp, %ebx
	movl	$1, 4(%rsp)
	andl	$-2, %eax
	shrl	%ebx
	movl	%eax, 12(%rsp)
	.p2align 4,,15
.L13:
	leaq	40(%rsp), %rsi
	leaq	24(%rsp), %rdi
	call	timing
	xorl	%r8d, %r8d
	.p2align 4,,15
.L12:
	vmovsd	(%r12), %xmm0
	vxorpd	%xmm7, %xmm7, %xmm7
	vucomisd	%xmm7, %xmm0
	jbe	.L6
	movq	%r12, %rdi
	movl	%r8d, 8(%rsp)
	call	dummy
	movl	8(%rsp), %r8d
.L6:
	testl	%ebp, %ebp
	jle	.L8
	xorl	%eax, %eax
	cmpl	$1, %ebp
	je	.L9
	xorl	%esi, %esi
	.p2align 4,,15
.L10:
	vmovaps	0(%r13,%rax), %xmm0
	vmovaps	(%r15,%rax), %xmm3
	incl	%esi
	vfmadd132pd	(%r14,%rax), %xmm3, %xmm0
	vmovaps	%xmm0, (%r12,%rax)
	addq	$16, %rax
	cmpl	%esi, %ebx
	ja	.L10
	movslq	12(%rsp), %rax
	cmpl	%ebp, %eax
	je	.L8
.L9:
	salq	$3, %rax
	vmovsd	0(%r13,%rax), %xmm0
	vmovsd	(%r15,%rax), %xmm4
	vfmadd132sd	(%r14,%rax), %xmm4, %xmm0
	vmovsd	%xmm0, (%r12,%rax)
.L8:
	incl	%r8d
	cmpl	4(%rsp), %r8d
	jne	.L12
	leaq	40(%rsp), %rsi
	leaq	32(%rsp), %rdi
	movl	%r8d, 4(%rsp)
	call	timing
	vmovsd	32(%rsp), %xmm1
	vmovsd	.LC3(%rip), %xmm5
	movl	4(%rsp), %r8d
	leal	(%r8,%r8), %eax
	movl	%eax, 4(%rsp)
	vsubsd	24(%rsp), %xmm1, %xmm1
	vucomisd	%xmm1, %xmm5
	ja	.L13
	movl	%eax, %esi
	vxorps	%xmm6, %xmm6, %xmm6
	vxorps	%xmm0, %xmm0, %xmm0
	vmovsd	.LC4(%rip), %xmm5
	sarl	%esi
	vcvtsi2sd	%ebp, %xmm0, %xmm0
	vmovsd	.LC6(%rip), %xmm7
	movl	%ebp, %edx
	vcvtsi2sd	%esi, %xmm6, %xmm6
	vmulsd	%xmm0, %xmm6, %xmm2
	movl	$.LC9, %edi
	movl	$5, %eax
	vdivsd	%xmm1, %xmm2, %xmm2
	vdivsd	%xmm5, %xmm2, %xmm4
	vmulsd	.LC5(%rip), %xmm6, %xmm2
	vmulsd	%xmm0, %xmm2, %xmm2
	vdivsd	%xmm5, %xmm4, %xmm4
	vdivsd	%xmm1, %xmm2, %xmm2
	vmulsd	%xmm7, %xmm2, %xmm3
	vaddsd	%xmm0, %xmm0, %xmm2
	vmulsd	.LC8(%rip), %xmm0, %xmm0
	vmulsd	%xmm6, %xmm2, %xmm2
	vmulsd	%xmm7, %xmm3, %xmm3
	vmulsd	.LC7(%rip), %xmm2, %xmm2
	vdivsd	%xmm5, %xmm0, %xmm0
	vdivsd	%xmm1, %xmm2, %xmm2
	call	printf
	movq	%r12, %rdi
	call	free
	movq	%r15, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	addq	$56, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%r13, %rdi
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
.L14:
	.cfi_restore_state
	xorl	%eax, %eax
	jmp	.L3
	.cfi_endproc
.LFE24:
	.size	triad, .-triad
	.section	.rodata.str1.8
	.align 8
.LC10:
	.string	"TRIAD a[i] = b[i]+c[i]*d[i], 32 byte/it, 2 Flop/it"
	.align 8
.LC11:
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
	movl	$.LC10, %edi
	movl	$20, %ebx
	call	puts
	movl	$.LC11, %edi
	call	puts
	.p2align 4,,15
.L24:
	vmovsd	.LC12(%rip), %xmm0
	vxorps	%xmm1, %xmm1, %xmm1
	vcvtsi2sd	%ebx, %xmm1, %xmm1
	incl	%ebx
	call	pow
	vcvttsd2si	%xmm0, %edi
	call	triad
	cmpl	$36, %ebx
	jne	.L24
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE25:
	.size	main, .-main
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	1907715710
	.long	1048610426
	.long	1907715710
	.long	1048610426
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	1907715710
	.long	1048610426
	.align 8
.LC3:
	.long	2576980378
	.long	1070176665
	.align 8
.LC4:
	.long	0
	.long	1083129856
	.align 8
.LC5:
	.long	0
	.long	1077936128
	.align 8
.LC6:
	.long	0
	.long	1062207488
	.align 8
.LC7:
	.long	2696277389
	.long	1051772663
	.align 8
.LC8:
	.long	0
	.long	1075838976
	.align 8
.LC12:
	.long	3435973837
	.long	1073007820
	.ident	"GCC: (GNU) 7.2.0"
	.section	.note.GNU-stack,"",@progbits
