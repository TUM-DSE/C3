	.arch armv8-a
	.file	"IRIW_Relax_WO_Fence.cpp"
	.text
	.section	.text._ZStanSt12memory_orderSt23__memory_order_modifier,"axG",@progbits,_ZStanSt12memory_orderSt23__memory_order_modifier,comdat
	.align	2
	.weak	_ZStanSt12memory_orderSt23__memory_order_modifier
	.type	_ZStanSt12memory_orderSt23__memory_order_modifier, %function
_ZStanSt12memory_orderSt23__memory_order_modifier:
.LFB41:
	.cfi_startproc
	sub	sp, sp, #16
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]
	str	w1, [sp, 8]
	ldr	w1, [sp, 12]
	ldr	w0, [sp, 8]
	and	w0, w1, w0
	add	sp, sp, 16
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE41:
	.size	_ZStanSt12memory_orderSt23__memory_order_modifier, .-_ZStanSt12memory_orderSt23__memory_order_modifier
	.section	.rodata
	.align	3
	.type	_ZStL19piecewise_construct, %object
	.size	_ZStL19piecewise_construct, 1
_ZStL19piecewise_construct:
	.zero	1
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,8
	.global	barrier
	.bss
	.align	3
	.type	barrier, %object
	.size	barrier, 32
barrier:
	.zero	32
	.global	var
	.align	3
	.type	var, %object
	.size	var, 8
var:
	.zero	8
	.global	cpu_res0
	.align	3
	.type	cpu_res0, %object
	.size	cpu_res0, 8
cpu_res0:
	.zero	8
	.global	gpu_res0
	.align	3
	.type	gpu_res0, %object
	.size	gpu_res0, 8
gpu_res0:
	.zero	8
	.global	cpu_res1
	.align	3
	.type	cpu_res1, %object
	.size	cpu_res1, 8
cpu_res1:
	.zero	8
	.global	gpu_res1
	.align	3
	.type	gpu_res1, %object
	.size	gpu_res1, 8
gpu_res1:
	.zero	8
	.global	cpu_rand1
	.align	3
	.type	cpu_rand1, %object
	.size	cpu_rand1, 8
cpu_rand1:
	.zero	8
	.global	gpu_rand1
	.align	3
	.type	gpu_rand1, %object
	.size	gpu_rand1, 8
gpu_rand1:
	.zero	8
	.global	cpu_rand2
	.align	3
	.type	cpu_rand2, %object
	.size	cpu_rand2, 8
cpu_rand2:
	.zero	8
	.global	gpu_rand2
	.align	3
	.type	gpu_rand2, %object
	.size	gpu_rand2, 8
gpu_rand2:
	.zero	8
	.global	local
	.section	.tdata,"awT",@progbits
	.align	2
	.type	local, %object
	.size	local, 4
local:
	.word	7
	.section	.text._Z12random_delayi,"axG",@progbits,_Z12random_delayi,comdat
	.align	2
	.weak	_Z12random_delayi
	.type	_Z12random_delayi, %function
_Z12random_delayi:
.LFB1808:
	.cfi_startproc
	stp	x29, x30, [sp, -48]!
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp
	str	w0, [sp, 28]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 2
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 1
	sub	w1, w2, w0
	cmp	w1, 1
	cset	w0, le
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L4
	bl	rand
	mov	w1, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w1, w0
	lsr	x0, x0, 32
	asr	w2, w0, 1
	asr	w0, w1, 31
	sub	w2, w2, w0
	mov	w0, w2
	lsl	w0, w0, 2
	add	w0, w0, w2
	sub	w0, w1, w0
	str	w0, [sp, 44]
	b	.L5
.L4:
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 2
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 1
	sub	w1, w2, w0
	cmp	w1, 0
	cset	w0, le
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L6
	bl	rand
	mov	w1, w0
	ldr	w0, [sp, 28]
	lsl	w0, w0, 1
	sdiv	w2, w1, w0
	mul	w0, w2, w0
	sub	w0, w1, w0
	ldr	w1, [sp, 28]
	add	w0, w1, w0
	str	w0, [sp, 44]
	b	.L5
.L6:
	bl	rand
	ldr	w1, [sp, 28]
	sdiv	w2, w0, w1
	ldr	w1, [sp, 28]
	mul	w1, w2, w1
	sub	w0, w0, w1
	str	w0, [sp, 44]
.L5:
	str	wzr, [sp, 36]
	str	wzr, [sp, 40]
	b	.L7
.L8:
	ldr	w0, [sp, 36]
	add	w0, w0, 1
	str	w0, [sp, 36]
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
.L7:
	ldr	w0, [sp, 40]
	ldr	w1, [sp, 44]
	cmp	w1, w0
	cset	w0, gt
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L8
	nop
	nop
	ldp	x29, x30, [sp], 48
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1808:
	.size	_Z12random_delayi, .-_Z12random_delayi
	.text
	.align	2
	.global	_Z7runIRIWPv
	.type	_Z7runIRIWPv, %function
_Z7runIRIWPv:
.LFB1809:
	.cfi_startproc
	stp	x29, x30, [sp, -224]!
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 120]
	ldr	x0, [sp, 120]
	mov	w1, w0
	mrs	x0, tpidr_el0
	add	x0, x0, #:tprel_hi12:local, lsl #12
	add	x0, x0, #:tprel_lo12_nc:local
	ldr	w0, [x0]
	add	w0, w1, w0
	mov	w1, w0
	mrs	x0, tpidr_el0
	add	x0, x0, #:tprel_hi12:local, lsl #12
	add	x0, x0, #:tprel_lo12_nc:local
	str	w1, [x0]
	adrp	x0, barrier
	add	x0, x0, :lo12:barrier
	bl	pthread_barrier_wait
	ldr	x0, [sp, 120]
	add	x0, x0, 3
	cmp	x0, 6
	bhi	.L10
	ldr	x0, [sp, 120]
	str	w0, [sp, 32]
	b	.L11
.L12:
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 32]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	wzr, [x0]
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 32]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	wzr, [x0, 64]
	mov	w0, 3
	str	w0, [sp, 60]
	dmb	ish
	nop
	mov	w0, 800
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 32]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	x0, [sp, 168]
	ldr	x0, [sp, 168]
	str	x0, [sp, 176]
	mov	w0, 1
	str	w0, [sp, 48]
	str	wzr, [sp, 52]
	mov	w1, 65535
	ldr	w0, [sp, 52]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 56]
	ldr	x0, [sp, 176]
	ldr	w1, [sp, 48]
	stlr	w1, [x0]
	nop
	ldr	w0, [sp, 32]
	add	w0, w0, 4
	str	w0, [sp, 32]
.L11:
	ldr	w1, [sp, 32]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L12
	b	.L13
.L10:
	ldr	x0, [sp, 120]
	sub	x0, x0, #4
	cmp	x0, 3
	bhi	.L14
	mov	w0, 2
	str	w0, [sp, 64]
	dmb	ish
	nop
	ldr	x0, [sp, 120]
	negs	x1, x0
	and	x0, x0, 3
	and	x1, x1, 3
	csneg	x0, x0, x1, mi
	str	w0, [sp, 36]
	b	.L15
.L18:
	mov	w0, 800
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 36]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	x0, [sp, 152]
	ldr	x0, [sp, 152]
	str	x0, [sp, 192]
	str	wzr, [sp, 76]
	mov	w1, 65535
	ldr	w0, [sp, 76]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 80]
	ldr	x0, [sp, 192]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 36]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	mov	w0, 800
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 36]
	lsl	x0, x0, 7
	add	x0, x1, x0
	add	x0, x0, 64
	str	x0, [sp, 160]
	ldr	x0, [sp, 160]
	str	x0, [sp, 184]
	str	wzr, [sp, 68]
	mov	w1, 65535
	ldr	w0, [sp, 68]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 72]
	ldr	x0, [sp, 184]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 36]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	ldr	w0, [sp, 36]
	add	w0, w0, 4
	str	w0, [sp, 36]
.L15:
	ldr	w1, [sp, 36]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L18
	b	.L13
.L14:
	ldr	x0, [sp, 120]
	sub	x0, x0, #8
	cmp	x0, 3
	bhi	.L19
	ldr	x0, [sp, 120]
	negs	x1, x0
	and	x0, x0, 3
	and	x1, x1, 3
	csneg	x0, x0, x1, mi
	str	w0, [sp, 40]
	b	.L20
.L21:
	mov	w0, 3
	str	w0, [sp, 96]
	dmb	ish
	nop
	mov	w0, 800
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 7
	add	x0, x1, x0
	add	x0, x0, 64
	str	x0, [sp, 144]
	ldr	x0, [sp, 144]
	str	x0, [sp, 200]
	mov	w0, 1
	str	w0, [sp, 84]
	str	wzr, [sp, 88]
	mov	w1, 65535
	ldr	w0, [sp, 88]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 92]
	ldr	x0, [sp, 200]
	ldr	w1, [sp, 84]
	stlr	w1, [x0]
	nop
	ldr	w0, [sp, 40]
	add	w0, w0, 4
	str	w0, [sp, 40]
.L20:
	ldr	w1, [sp, 40]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L21
	b	.L13
.L19:
	mov	w0, 2
	str	w0, [sp, 100]
	dmb	ish
	nop
	ldr	x0, [sp, 120]
	negs	x1, x0
	and	x0, x0, 3
	and	x1, x1, 3
	csneg	x0, x0, x1, mi
	str	w0, [sp, 44]
	b	.L22
.L25:
	mov	w0, 800
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 7
	add	x0, x1, x0
	add	x0, x0, 64
	str	x0, [sp, 128]
	ldr	x0, [sp, 128]
	str	x0, [sp, 216]
	str	wzr, [sp, 112]
	mov	w1, 65535
	ldr	w0, [sp, 112]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 116]
	ldr	x0, [sp, 216]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	mov	w0, 800
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	x0, [sp, 136]
	ldr	x0, [sp, 136]
	str	x0, [sp, 208]
	str	wzr, [sp, 104]
	mov	w1, 65535
	ldr	w0, [sp, 104]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 108]
	ldr	x0, [sp, 208]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	ldr	w0, [sp, 44]
	add	w0, w0, 4
	str	w0, [sp, 44]
.L22:
	ldr	w1, [sp, 44]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L25
.L13:
	mrs	x0, tpidr_el0
	add	x0, x0, #:tprel_hi12:local, lsl #12
	add	x0, x0, #:tprel_lo12_nc:local
	ldr	w0, [x0]
	sxtw	x0, w0
	ldp	x29, x30, [sp], 224
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1809:
	.size	_Z7runIRIWPv, .-_Z7runIRIWPv
	.section	.rodata
	.align	3
.LC0:
	.string	"\nIndependent Reads of Independent Writes (IRIW) Litmus Test Results:"
	.align	3
.LC1:
	.string	"------------------------------------------------------------------"
	.align	3
.LC2:
	.string	"Thread 1 (Read a, then Read b) Observations:"
	.align	3
.LC3:
	.string	"  a=0, b=0: "
	.align	3
.LC4:
	.string	" ("
	.align	3
.LC5:
	.string	"%)"
	.align	3
.LC6:
	.string	"  a=1, b=0: "
	.align	3
.LC7:
	.string	"  a=0, b=1: "
	.align	3
.LC8:
	.string	"  a=1, b=1: "
	.align	3
.LC9:
	.string	"  Other: "
	.align	3
.LC10:
	.string	"\nThread 3 (Read b, then Read a) Observations:"
	.align	3
.LC11:
	.string	"\nForbidden Outcome Analysis:"
	.align	3
.LC12:
	.string	"  Iterations: "
	.align	3
.LC13:
	.string	"  Forbidden outcomes: "
	.align	3
.LC14:
	.string	"========================================================================="
	.align	3
.LC15:
	.string	"    FORBIDDEN BEHAVIOR OBSERVED IN "
	.align	3
.LC16:
	.string	" CASES!"
	.align	3
.LC17:
	.string	"    This indicates non-sequentially consistent memory ordering"
	.align	3
.LC18:
	.string	"    Thread 1 saw: a=1, b=0 while Thread 3 saw: b=1, a=0"
	.align	3
.LC19:
	.string	"    No forbidden behavior observed"
	.align	3
.LC20:
	.string	"    Memory operations appear to be sequentially consistent"
	.text
	.align	2
	.global	_Z12check_outputj
	.type	_Z12check_outputj, %function
_Z12check_outputj:
.LFB1810:
	.cfi_startproc
	stp	x29, x30, [sp, -80]!
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 32]
	str	wzr, [sp, 36]
	str	wzr, [sp, 40]
	str	wzr, [sp, 44]
	str	wzr, [sp, 48]
	str	wzr, [sp, 52]
	str	wzr, [sp, 56]
	str	wzr, [sp, 60]
	str	wzr, [sp, 64]
	str	wzr, [sp, 68]
	str	wzr, [sp, 72]
	str	wzr, [sp, 76]
	b	.L28
.L58:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L29
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L29
	mov	w0, 1
	b	.L30
.L29:
	mov	w0, 0
.L30:
	cmp	w0, 0
	beq	.L31
	ldr	w0, [sp, 32]
	add	w0, w0, 1
	str	w0, [sp, 32]
	b	.L32
.L31:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L33
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L33
	mov	w0, 1
	b	.L34
.L33:
	mov	w0, 0
.L34:
	cmp	w0, 0
	beq	.L35
	ldr	w0, [sp, 36]
	add	w0, w0, 1
	str	w0, [sp, 36]
	b	.L32
.L35:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L36
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L36
	mov	w0, 1
	b	.L37
.L36:
	mov	w0, 0
.L37:
	cmp	w0, 0
	beq	.L38
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
	b	.L32
.L38:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L39
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L39
	mov	w0, 1
	b	.L40
.L39:
	mov	w0, 0
.L40:
	cmp	w0, 0
	beq	.L41
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
	b	.L32
.L41:
	ldr	w0, [sp, 48]
	add	w0, w0, 1
	str	w0, [sp, 48]
.L32:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L42
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L42
	mov	w0, 1
	b	.L43
.L42:
	mov	w0, 0
.L43:
	cmp	w0, 0
	beq	.L44
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
	b	.L45
.L44:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L46
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L46
	mov	w0, 1
	b	.L47
.L46:
	mov	w0, 0
.L47:
	cmp	w0, 0
	beq	.L48
	ldr	w0, [sp, 56]
	add	w0, w0, 1
	str	w0, [sp, 56]
	b	.L45
.L48:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L49
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L49
	mov	w0, 1
	b	.L50
.L49:
	mov	w0, 0
.L50:
	cmp	w0, 0
	beq	.L51
	ldr	w0, [sp, 60]
	add	w0, w0, 1
	str	w0, [sp, 60]
	b	.L45
.L51:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L52
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L52
	mov	w0, 1
	b	.L53
.L52:
	mov	w0, 0
.L53:
	cmp	w0, 0
	beq	.L54
	ldr	w0, [sp, 64]
	add	w0, w0, 1
	str	w0, [sp, 64]
	b	.L45
.L54:
	ldr	w0, [sp, 68]
	add	w0, w0, 1
	str	w0, [sp, 68]
.L45:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L55
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L55
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L55
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 76]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L55
	mov	w0, 1
	b	.L56
.L55:
	mov	w0, 0
.L56:
	cmp	w0, 0
	beq	.L57
	ldr	w0, [sp, 72]
	add	w0, w0, 1
	str	w0, [sp, 72]
.L57:
	ldr	w0, [sp, 76]
	add	w0, w0, 1
	str	w0, [sp, 76]
.L28:
	ldr	w0, [sp, 76]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bhi	.L58
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC1
	add	x1, x0, :lo12:.LC1
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 32]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 32]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC6
	add	x1, x0, :lo12:.LC6
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 36]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 36]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC7
	add	x1, x0, :lo12:.LC7
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 40]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 40]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC8
	add	x1, x0, :lo12:.LC8
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 44]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 44]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC9
	add	x1, x0, :lo12:.LC9
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 48]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC10
	add	x1, x0, :lo12:.LC10
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 52]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 52]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC6
	add	x1, x0, :lo12:.LC6
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 56]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 56]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC7
	add	x1, x0, :lo12:.LC7
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 60]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 60]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC8
	add	x1, x0, :lo12:.LC8
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 64]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 64]
	ucvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC9
	add	x1, x0, :lo12:.LC9
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 68]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC11
	add	x1, x0, :lo12:.LC11
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC12
	add	x1, x0, :lo12:.LC12
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 28]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC13
	add	x1, x0, :lo12:.LC13
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 72]
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 72]
	scvtf	d0, w0
	mov	x0, 4636737291354636288
	fmov	d1, x0
	fmul	d1, d0, d1
	ldr	w0, [sp, 28]
	ucvtf	d0, w0
	fdiv	d0, d1, d0
	mov	x0, x1
	bl	_ZNSolsEd
	mov	x2, x0
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	w0, [sp, 72]
	cmp	w0, 0
	ble	.L59
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC15
	add	x1, x0, :lo12:.LC15
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 72]
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, .LC16
	add	x1, x0, :lo12:.LC16
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC17
	add	x1, x0, :lo12:.LC17
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC18
	add	x1, x0, :lo12:.LC18
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 2
	b	.L60
.L59:
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC19
	add	x1, x0, :lo12:.LC19
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC20
	add	x1, x0, :lo12:.LC20
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC14
	add	x1, x0, :lo12:.LC14
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 0
.L60:
	ldp	x29, x30, [sp], 80
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1810:
	.size	_Z12check_outputj, .-_Z12check_outputj
	.section	.rodata
	.align	3
.LC21:
	.string	"usage: %s <thread_count>\n"
	.align	3
.LC22:
	.string	"Starting %d threads for IRIW litmus test...\n"
	.align	3
.LC23:
	.string	"This test is DESIGNED to expose the forbidden outcome where different threads"
	.align	3
.LC24:
	.string	"observe operations in different orders (non-sequentially consistent behavior)"
	.align	3
.LC25:
	.string	"Random delays generated with high variability"
	.align	3
.LC26:
	.string	"int main(int, char**)"
	.align	3
.LC27:
	.string	"IRIW_Relax_WO_Fence.cpp"
	.align	3
.LC28:
	.string	"threads != NULL"
	.align	3
.LC29:
	.string	"createResult == 0"
	.align	3
.LC30:
	.string	"local[0] = %lld\n"
	.align	3
.LC31:
	.string	"joinResult == 0"
	.align	3
.LC32:
	.string	"local[%d] = %lld\n"
	.align	3
.LC33:
	.string	"Validating..."
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1811:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 104]
	mov	x1, 0
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L62
	ldr	x0, [sp, 16]
	ldr	x0, [x0]
	mov	x1, x0
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	printf
	mov	w0, 1
	bl	exit
.L62:
	ldr	x0, [sp, 16]
	add	x0, x0, 8
	ldr	x0, [x0]
	bl	atoi
	str	w0, [sp, 64]
	ldr	w1, [sp, 64]
	adrp	x0, .LC22
	add	x0, x0, :lo12:.LC22
	bl	printf
	adrp	x0, .LC23
	add	x0, x0, :lo12:.LC23
	bl	puts
	adrp	x0, .LC24
	add	x0, x0, :lo12:.LC24
	bl	puts
	mov	w0, 34464
	movk	w0, 0x1, lsl 16
	str	w0, [sp, 68]
	ldr	w0, [sp, 68]
	str	w0, [sp, 72]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 7
	bl	malloc
	mov	x1, x0
	adrp	x0, var
	add	x0, x0, :lo12:var
	str	x1, [x0]
	str	wzr, [sp, 40]
	b	.L63
.L64:
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	wzr, [x0]
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	wzr, [x0, 64]
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
.L63:
	ldr	w1, [sp, 40]
	ldr	w0, [sp, 72]
	cmp	w1, w0
	blt	.L64
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 6
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	str	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 6
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	str	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 6
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	str	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 6
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	str	x1, [x0]
	str	wzr, [sp, 44]
	b	.L65
.L66:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L65:
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 72]
	cmp	w1, w0
	blt	.L66
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	str	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	str	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	str	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	str	x1, [x0]
	str	wzr, [sp, 48]
	b	.L67
.L72:
	bl	rand
	mov	w1, w0
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	smull	x0, w1, w0
	lsr	x0, x0, 32
	asr	w2, w0, 8
	asr	w0, w1, 31
	sub	w0, w2, w0
	mov	w2, 800
	mul	w0, w0, w2
	sub	w0, w1, w0
	str	w0, [sp, 52]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 2
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 1
	sub	w1, w2, w0
	cmp	w1, 1
	cset	w0, le
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L68
	ldr	w1, [sp, 52]
	mov	w0, 52429
	movk	w0, 0xcccc, lsl 16
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 3
	str	w0, [sp, 52]
.L68:
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 48]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 52]
	str	w1, [x0]
	bl	rand
	mov	w1, w0
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	smull	x0, w1, w0
	lsr	x0, x0, 32
	asr	w2, w0, 8
	asr	w0, w1, 31
	sub	w0, w2, w0
	mov	w2, 800
	mul	w0, w0, w2
	sub	w0, w1, w0
	str	w0, [sp, 52]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 2
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 1
	sub	w1, w2, w0
	cmp	w1, 0
	cset	w0, le
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L69
	ldr	w0, [sp, 52]
	lsl	w0, w0, 1
	str	w0, [sp, 52]
.L69:
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 48]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 52]
	str	w1, [x0]
	bl	rand
	mov	w1, w0
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	smull	x0, w1, w0
	lsr	x0, x0, 32
	asr	w2, w0, 8
	asr	w0, w1, 31
	sub	w0, w2, w0
	mov	w2, 800
	mul	w0, w0, w2
	sub	w0, w1, w0
	str	w0, [sp, 52]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 2
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 1
	sub	w1, w2, w0
	cmp	w1, 2
	cset	w0, le
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L70
	ldr	w0, [sp, 52]
	lsr	w0, w0, 3
	str	w0, [sp, 52]
.L70:
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 48]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 52]
	str	w1, [x0]
	bl	rand
	mov	w1, w0
	mov	w0, 34079
	movk	w0, 0x51eb, lsl 16
	smull	x0, w1, w0
	lsr	x0, x0, 32
	asr	w2, w0, 8
	asr	w0, w1, 31
	sub	w0, w2, w0
	mov	w2, 800
	mul	w0, w0, w2
	sub	w0, w1, w0
	str	w0, [sp, 52]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 2
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 1
	sub	w1, w2, w0
	cmp	w1, 1
	cset	w0, le
	and	w0, w0, 255
	cmp	w0, 0
	beq	.L71
	ldr	w1, [sp, 52]
	mov	w0, w1
	lsl	w0, w0, 1
	add	w0, w0, w1
	str	w0, [sp, 52]
.L71:
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 48]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 52]
	str	w1, [x0]
	ldr	w0, [sp, 48]
	add	w0, w0, 1
	str	w0, [sp, 48]
.L67:
	ldr	w1, [sp, 48]
	ldr	w0, [sp, 68]
	cmp	w1, w0
	blt	.L72
	adrp	x0, .LC25
	add	x1, x0, :lo12:.LC25
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldrsw	x0, [sp, 64]
	mov	x1, 8
	bl	calloc
	str	x0, [sp, 96]
	ldr	w0, [sp, 64]
	mov	w2, w0
	mov	x1, 0
	adrp	x0, barrier
	add	x0, x0, :lo12:barrier
	bl	pthread_barrier_init
	ldr	x0, [sp, 96]
	cmp	x0, 0
	bne	.L73
	adrp	x0, .LC26
	add	x3, x0, :lo12:.LC26
	mov	w2, 377
	adrp	x0, .LC27
	add	x1, x0, :lo12:.LC27
	adrp	x0, .LC28
	add	x0, x0, :lo12:.LC28
	bl	__assert_fail
.L73:
	mov	w0, 1
	str	w0, [sp, 56]
	b	.L74
.L76:
	ldrsw	x0, [sp, 56]
	lsl	x0, x0, 3
	ldr	x1, [sp, 96]
	add	x4, x1, x0
	ldrsw	x0, [sp, 56]
	mov	x3, x0
	adrp	x0, _Z7runIRIWPv
	add	x2, x0, :lo12:_Z7runIRIWPv
	mov	x1, 0
	mov	x0, x4
	bl	pthread_create
	str	w0, [sp, 84]
	ldr	w0, [sp, 84]
	cmp	w0, 0
	beq	.L75
	adrp	x0, .LC26
	add	x3, x0, :lo12:.LC26
	mov	w2, 384
	adrp	x0, .LC27
	add	x1, x0, :lo12:.LC27
	adrp	x0, .LC29
	add	x0, x0, :lo12:.LC29
	bl	__assert_fail
.L75:
	ldr	w0, [sp, 56]
	add	w0, w0, 1
	str	w0, [sp, 56]
.L74:
	ldr	w1, [sp, 56]
	ldr	w0, [sp, 64]
	cmp	w1, w0
	blt	.L76
	mov	x0, 0
	bl	_Z7runIRIWPv
	str	x0, [sp, 88]
	ldr	x0, [sp, 88]
	mov	x1, x0
	adrp	x0, .LC30
	add	x0, x0, :lo12:.LC30
	bl	printf
	mov	w0, 1
	str	w0, [sp, 60]
	b	.L77
.L79:
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 3
	ldr	x1, [sp, 96]
	add	x0, x1, x0
	ldr	x0, [x0]
	add	x1, sp, 88
	bl	pthread_join
	str	w0, [sp, 80]
	ldr	w0, [sp, 80]
	cmp	w0, 0
	beq	.L78
	adrp	x0, .LC26
	add	x3, x0, :lo12:.LC26
	mov	w2, 394
	adrp	x0, .LC27
	add	x1, x0, :lo12:.LC27
	adrp	x0, .LC31
	add	x0, x0, :lo12:.LC31
	bl	__assert_fail
.L78:
	ldr	x0, [sp, 88]
	mov	x2, x0
	ldr	w1, [sp, 60]
	adrp	x0, .LC32
	add	x0, x0, :lo12:.LC32
	bl	printf
	ldr	w0, [sp, 60]
	add	w0, w0, 1
	str	w0, [sp, 60]
.L77:
	ldr	w1, [sp, 60]
	ldr	w0, [sp, 64]
	cmp	w1, w0
	blt	.L79
	adrp	x0, .LC33
	add	x1, x0, :lo12:.LC33
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	w0, [sp, 72]
	bl	_Z12check_outputj
	str	w0, [sp, 76]
	ldr	x0, [sp, 96]
	bl	free
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x0, [x0]
	bl	free
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x0, [x0]
	bl	free
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x0, [x0]
	bl	free
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x0, [x0]
	bl	free
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x0, [x0]
	bl	free
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	ldr	x0, [x0]
	bl	free
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x0, [x0]
	bl	free
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	ldr	x0, [x0]
	bl	free
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x0, [x0]
	bl	free
	mov	w0, 0
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 104]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L81
	bl	__stack_chk_fail
.L81:
	mov	w0, w1
	ldp	x29, x30, [sp], 112
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1811:
	.size	main, .-main
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
.LFB2213:
	.cfi_startproc
	stp	x29, x30, [sp, -32]!
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp
	str	w0, [sp, 28]
	str	w1, [sp, 24]
	ldr	w0, [sp, 28]
	cmp	w0, 1
	bne	.L84
	ldr	w1, [sp, 24]
	mov	w0, 65535
	cmp	w1, w0
	bne	.L84
	adrp	x0, _ZStL8__ioinit
	add	x0, x0, :lo12:_ZStL8__ioinit
	bl	_ZNSt8ios_base4InitC1Ev
	adrp	x0, __dso_handle
	add	x2, x0, :lo12:__dso_handle
	adrp	x0, _ZStL8__ioinit
	add	x1, x0, :lo12:_ZStL8__ioinit
	adrp	x0, :got:_ZNSt8ios_base4InitD1Ev
	ldr	x0, [x0, #:got_lo12:_ZNSt8ios_base4InitD1Ev]
	bl	__cxa_atexit
.L84:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2213:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I_barrier, %function
_GLOBAL__sub_I_barrier:
.LFB2214:
	.cfi_startproc
	stp	x29, x30, [sp, -16]!
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp
	mov	w1, 65535
	mov	w0, 1
	bl	_Z41__static_initialization_and_destruction_0ii
	ldp	x29, x30, [sp], 16
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2214:
	.size	_GLOBAL__sub_I_barrier, .-_GLOBAL__sub_I_barrier
	.section	.init_array,"aw",%init_array
	.align	3
	.xword	_GLOBAL__sub_I_barrier
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
