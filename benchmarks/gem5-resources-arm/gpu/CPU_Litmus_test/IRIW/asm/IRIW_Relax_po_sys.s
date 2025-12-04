	.arch armv8-a
	.file	"IRIW_Relax_po_sys.cpp"
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
	.text
	.align	2
	.global	_Z7runIRIWPv
	.type	_Z7runIRIWPv, %function
_Z7runIRIWPv:
.LFB1808:
	.cfi_startproc
	stp	x29, x30, [sp, -304]!
	.cfi_def_cfa_offset 304
	.cfi_offset 29, -304
	.cfi_offset 30, -296
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 200]
	ldr	x0, [sp, 200]
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
	ldr	x0, [sp, 200]
	add	x0, x0, 3
	cmp	x0, 6
	bhi	.L4
	ldr	x0, [sp, 200]
	str	w0, [sp, 40]
	b	.L5
.L12:
	str	xzr, [sp, 152]
	b	.L6
.L7:
	ldr	x0, [sp, 152]
	add	x0, x0, 1
	str	x0, [sp, 152]
.L6:
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w0, [x0]
	uxtw	x0, w0
	ldr	x1, [sp, 152]
	cmp	x1, x0
	cset	w0, lt
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L7
	str	xzr, [sp, 160]
	b	.L8
.L9:
	ldr	x0, [sp, 160]
	add	x0, x0, 1
	str	x0, [sp, 160]
.L8:
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w0, [x0]
	uxtw	x0, w0
	ldr	x1, [sp, 160]
	cmp	x1, x0
	cset	w0, lt
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L9
	str	xzr, [sp, 168]
	b	.L10
.L11:
	ldr	x0, [sp, 168]
	add	x0, x0, 1
	str	x0, [sp, 168]
.L10:
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w0, [x0]
	uxtw	x0, w0
	ldr	x1, [sp, 168]
	cmp	x1, x0
	cset	w0, lt
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L11
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 8
	add	x0, x1, x0
	str	x0, [sp, 248]
	ldr	x0, [sp, 248]
	str	x0, [sp, 256]
	mov	w0, 1
	str	w0, [sp, 96]
	mov	w0, 3
	str	w0, [sp, 100]
	mov	w1, 65535
	ldr	w0, [sp, 100]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 104]
	ldr	x0, [sp, 256]
	ldr	w1, [sp, 96]
	stlr	w1, [x0]
	nop
	ldr	w0, [sp, 40]
	add	w0, w0, 4
	str	w0, [sp, 40]
.L5:
	ldr	w1, [sp, 40]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L12
	b	.L13
.L4:
	ldr	x0, [sp, 200]
	sub	x0, x0, #4
	cmp	x0, 3
	bhi	.L14
	ldr	x0, [sp, 200]
	negs	x1, x0
	and	x0, x0, 3
	and	x1, x1, 3
	csneg	x0, x0, x1, mi
	str	w0, [sp, 44]
	b	.L15
.L28:
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 8
	add	x0, x1, x0
	str	x0, [sp, 232]
	ldr	x0, [sp, 232]
	str	x0, [sp, 264]
	mov	w0, 2
	str	w0, [sp, 108]
	mov	w1, 65535
	ldr	w0, [sp, 108]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 112]
	ldr	x0, [sp, 264]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	str	wzr, [sp, 48]
	b	.L17
.L18:
	ldr	w0, [sp, 48]
	add	w0, w0, 1
	str	w0, [sp, 48]
.L17:
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 48]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L18
	str	wzr, [sp, 52]
	b	.L19
.L20:
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
.L19:
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 52]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L20
	str	wzr, [sp, 56]
	b	.L21
.L22:
	ldr	w0, [sp, 56]
	add	w0, w0, 1
	str	w0, [sp, 56]
.L21:
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 56]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L22
	str	wzr, [sp, 60]
	b	.L23
.L24:
	ldr	w0, [sp, 60]
	add	w0, w0, 1
	str	w0, [sp, 60]
.L23:
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 60]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L24
	str	wzr, [sp, 64]
	b	.L25
.L26:
	ldr	w0, [sp, 64]
	add	w0, w0, 1
	str	w0, [sp, 64]
.L25:
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 64]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L26
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 8
	add	x0, x1, x0
	add	x0, x0, 128
	str	x0, [sp, 240]
	ldr	x0, [sp, 240]
	str	x0, [sp, 272]
	mov	w0, 2
	str	w0, [sp, 116]
	mov	w1, 65535
	ldr	w0, [sp, 116]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 120]
	ldr	x0, [sp, 272]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	ldr	w0, [sp, 44]
	add	w0, w0, 4
	str	w0, [sp, 44]
.L15:
	ldr	w1, [sp, 44]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L28
	b	.L13
.L14:
	ldr	x0, [sp, 200]
	sub	x0, x0, #8
	cmp	x0, 3
	bhi	.L29
	ldr	x0, [sp, 200]
	negs	x1, x0
	and	x0, x0, 3
	and	x1, x1, 3
	csneg	x0, x0, x1, mi
	str	w0, [sp, 68]
	b	.L30
.L37:
	str	xzr, [sp, 176]
	b	.L31
.L32:
	ldr	x0, [sp, 176]
	add	x0, x0, 1
	str	x0, [sp, 176]
.L31:
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w0, [x0]
	uxtw	x0, w0
	ldr	x1, [sp, 176]
	cmp	x1, x0
	cset	w0, lt
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L32
	str	xzr, [sp, 184]
	b	.L33
.L34:
	ldr	x0, [sp, 184]
	add	x0, x0, 1
	str	x0, [sp, 184]
.L33:
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w0, [x0]
	uxtw	x0, w0
	ldr	x1, [sp, 184]
	cmp	x1, x0
	cset	w0, lt
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L34
	str	xzr, [sp, 192]
	b	.L35
.L36:
	ldr	x0, [sp, 192]
	add	x0, x0, 1
	str	x0, [sp, 192]
.L35:
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w0, [x0]
	uxtw	x0, w0
	ldr	x1, [sp, 192]
	cmp	x1, x0
	cset	w0, lt
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L36
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 8
	add	x0, x1, x0
	add	x0, x0, 128
	str	x0, [sp, 224]
	ldr	x0, [sp, 224]
	str	x0, [sp, 280]
	mov	w0, 1
	str	w0, [sp, 124]
	mov	w0, 3
	str	w0, [sp, 128]
	mov	w1, 65535
	ldr	w0, [sp, 128]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 132]
	ldr	x0, [sp, 280]
	ldr	w1, [sp, 124]
	stlr	w1, [x0]
	nop
	ldr	w0, [sp, 68]
	add	w0, w0, 4
	str	w0, [sp, 68]
.L30:
	ldr	w1, [sp, 68]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L37
	b	.L13
.L29:
	ldr	x0, [sp, 200]
	negs	x1, x0
	and	x0, x0, 3
	and	x1, x1, 3
	csneg	x0, x0, x1, mi
	str	w0, [sp, 72]
	b	.L38
.L51:
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 8
	add	x0, x1, x0
	add	x0, x0, 128
	str	x0, [sp, 208]
	ldr	x0, [sp, 208]
	str	x0, [sp, 288]
	mov	w0, 2
	str	w0, [sp, 136]
	mov	w1, 65535
	ldr	w0, [sp, 136]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 140]
	ldr	x0, [sp, 288]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	str	wzr, [sp, 76]
	b	.L40
.L41:
	ldr	w0, [sp, 76]
	add	w0, w0, 1
	str	w0, [sp, 76]
.L40:
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 76]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L41
	str	wzr, [sp, 80]
	b	.L42
.L43:
	ldr	w0, [sp, 80]
	add	w0, w0, 1
	str	w0, [sp, 80]
.L42:
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 80]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L43
	str	wzr, [sp, 84]
	b	.L44
.L45:
	ldr	w0, [sp, 84]
	add	w0, w0, 1
	str	w0, [sp, 84]
.L44:
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 84]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L45
	str	wzr, [sp, 88]
	b	.L46
.L47:
	ldr	w0, [sp, 88]
	add	w0, w0, 1
	str	w0, [sp, 88]
.L46:
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 88]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L47
	str	wzr, [sp, 92]
	b	.L48
.L49:
	ldr	w0, [sp, 92]
	add	w0, w0, 1
	str	w0, [sp, 92]
.L48:
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [x0]
	ldr	w0, [sp, 92]
	cmp	w1, w0
	cset	w0, hi
	and	w0, w0, 255
	cmp	w0, 0
	bne	.L49
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 8
	add	x0, x1, x0
	str	x0, [sp, 216]
	ldr	x0, [sp, 216]
	str	x0, [sp, 296]
	mov	w0, 2
	str	w0, [sp, 144]
	mov	w1, 65535
	ldr	w0, [sp, 144]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 148]
	ldr	x0, [sp, 296]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 72]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	ldr	w0, [sp, 72]
	add	w0, w0, 4
	str	w0, [sp, 72]
.L38:
	ldr	w1, [sp, 72]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L51
.L13:
	mrs	x0, tpidr_el0
	add	x0, x0, #:tprel_hi12:local, lsl #12
	add	x0, x0, #:tprel_lo12_nc:local
	ldr	w0, [x0]
	sxtw	x0, w0
	ldp	x29, x30, [sp], 304
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1808:
	.size	_Z7runIRIWPv, .-_Z7runIRIWPv
	.section	.rodata
	.align	3
.LC0:
	.string	"Pass Test: "
	.align	3
.LC1:
	.string	"Failure Test: "
	.align	3
.LC2:
	.string	"========================================================================="
	.align	3
.LC3:
	.string	"\t\t CPU-Only IRIW-sys Allowed  \t "
	.align	3
.LC4:
	.string	"\t\t CPU-Only IRIW-sys Disallowed  \t "
	.align	3
.LC5:
	.string	"Success!"
	.align	3
.LC6:
	.string	"Count (a:0 and b:0): "
	.align	3
.LC7:
	.string	"Count (a:1 and b:0): "
	.align	3
.LC8:
	.string	"Count (a:0 and b:1): "
	.align	3
.LC9:
	.string	"Count (a:1 and b:1): "
	.align	3
.LC10:
	.string	"Count (r0:2 and r1:2): "
	.align	3
.LC11:
	.string	"Fail!"
	.text
	.align	2
	.global	_Z12check_outputj
	.type	_Z12check_outputj, %function
_Z12check_outputj:
.LFB1809:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 44]
	str	wzr, [sp, 48]
	str	wzr, [sp, 52]
	str	wzr, [sp, 56]
	str	wzr, [sp, 60]
	str	wzr, [sp, 64]
	str	wzr, [sp, 68]
	str	wzr, [sp, 72]
	str	wzr, [sp, 76]
	str	wzr, [sp, 80]
	str	wzr, [sp, 84]
	str	wzr, [sp, 88]
	str	wzr, [sp, 92]
	b	.L54
.L85:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L55
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L55
	mov	w0, 1
	b	.L56
.L55:
	mov	w0, 0
.L56:
	cmp	w0, 0
	beq	.L57
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
	b	.L58
.L57:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L59
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L59
	mov	w0, 1
	b	.L60
.L59:
	mov	w0, 0
.L60:
	cmp	w0, 0
	beq	.L61
	ldr	w0, [sp, 48]
	add	w0, w0, 1
	str	w0, [sp, 48]
	b	.L58
.L61:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L62
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L62
	mov	w0, 1
	b	.L63
.L62:
	mov	w0, 0
.L63:
	cmp	w0, 0
	beq	.L64
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
	b	.L58
.L64:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L65
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L65
	mov	w0, 1
	b	.L66
.L65:
	mov	w0, 0
.L66:
	cmp	w0, 0
	beq	.L67
	ldr	w0, [sp, 56]
	add	w0, w0, 1
	str	w0, [sp, 56]
	b	.L58
.L67:
	ldr	w0, [sp, 60]
	add	w0, w0, 1
	str	w0, [sp, 60]
.L58:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L68
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L68
	mov	w0, 1
	b	.L69
.L68:
	mov	w0, 0
.L69:
	cmp	w0, 0
	beq	.L70
	ldr	w0, [sp, 64]
	add	w0, w0, 1
	str	w0, [sp, 64]
	b	.L71
.L70:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L72
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L72
	mov	w0, 1
	b	.L73
.L72:
	mov	w0, 0
.L73:
	cmp	w0, 0
	beq	.L74
	ldr	w0, [sp, 68]
	add	w0, w0, 1
	str	w0, [sp, 68]
	b	.L71
.L74:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L75
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L75
	mov	w0, 1
	b	.L76
.L75:
	mov	w0, 0
.L76:
	cmp	w0, 0
	beq	.L77
	ldr	w0, [sp, 72]
	add	w0, w0, 1
	str	w0, [sp, 72]
	b	.L71
.L77:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L78
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L78
	mov	w0, 1
	b	.L79
.L78:
	mov	w0, 0
.L79:
	cmp	w0, 0
	beq	.L80
	ldr	w0, [sp, 76]
	add	w0, w0, 1
	str	w0, [sp, 76]
	b	.L71
.L80:
	ldr	w0, [sp, 80]
	add	w0, w0, 1
	str	w0, [sp, 80]
.L71:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L81
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L81
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L81
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 92]
	lsl	x0, x0, 7
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L81
	mov	w0, 1
	b	.L82
.L81:
	mov	w0, 0
.L82:
	cmp	w0, 0
	beq	.L83
	ldr	w0, [sp, 88]
	add	w0, w0, 1
	str	w0, [sp, 88]
	b	.L84
.L83:
	ldr	w0, [sp, 84]
	add	w0, w0, 1
	str	w0, [sp, 84]
.L84:
	ldr	w0, [sp, 92]
	add	w0, w0, 1
	str	w0, [sp, 92]
.L54:
	ldr	w0, [sp, 92]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bhi	.L85
	adrp	x0, .LC0
	add	x1, x0, :lo12:.LC0
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 84]
	bl	_ZNSolsEi
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
	ldr	w1, [sp, 88]
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	w0, [sp, 88]
	cmp	w0, 0
	beq	.L86
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
	b	.L87
.L86:
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
	adrp	x0, .LC4
	add	x1, x0, :lo12:.LC4
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
.L87:
	ldr	w0, [sp, 48]
	cmp	w0, 0
	bne	.L88
	ldr	w0, [sp, 72]
	cmp	w0, 0
	bne	.L88
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
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
	ldr	w1, [sp, 44]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 48]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 52]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 56]
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
	ldr	w1, [sp, 60]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 64]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 68]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 72]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 76]
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
	ldr	w1, [sp, 80]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 0
	b	.L89
.L88:
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
	adrp	x0, .LC6
	add	x1, x0, :lo12:.LC6
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 44]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 48]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 52]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 56]
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
	ldr	w1, [sp, 60]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 64]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 68]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 72]
	bl	_ZNSolsEj
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
	ldr	w1, [sp, 76]
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
	ldr	w1, [sp, 80]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 2
.L89:
	ldp	x29, x30, [sp], 96
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1809:
	.size	_Z12check_outputj, .-_Z12check_outputj
	.section	.rodata
	.align	3
.LC12:
	.string	"usage: %s <thread_count>\n"
	.align	3
.LC13:
	.string	"Starting %d threads...\n"
	.align	3
.LC14:
	.string	"Random thread launch delays generated"
	.align	3
.LC15:
	.string	"int main(int, char**)"
	.align	3
.LC16:
	.string	"IRIW_Relax_po_sys.cpp"
	.align	3
.LC17:
	.string	"threads != NULL"
	.align	3
.LC18:
	.string	"createResult == 0"
	.align	3
.LC19:
	.string	"local[0] = %lld\n"
	.align	3
.LC20:
	.string	"joinResult == 0"
	.align	3
.LC21:
	.string	"local[%d] = %lld\n"
	.align	3
.LC22:
	.string	"Validating..."
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1810:
	.cfi_startproc
	stp	x29, x30, [sp, -128]!
	.cfi_def_cfa_offset 128
	.cfi_offset 29, -128
	.cfi_offset 30, -120
	mov	x29, sp
	str	w0, [sp, 28]
	str	x1, [sp, 16]
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 120]
	mov	x1, 0
	ldr	w0, [sp, 28]
	cmp	w0, 2
	beq	.L91
	ldr	x0, [sp, 16]
	ldr	x0, [x0]
	mov	x1, x0
	adrp	x0, .LC12
	add	x0, x0, :lo12:.LC12
	bl	printf
	mov	w0, 1
	bl	exit
.L91:
	ldr	x0, [sp, 16]
	add	x0, x0, 8
	ldr	x0, [x0]
	bl	atoi
	str	w0, [sp, 72]
	ldr	w1, [sp, 72]
	adrp	x0, .LC13
	add	x0, x0, :lo12:.LC13
	bl	printf
	mov	w0, 34464
	movk	w0, 0x1, lsl 16
	str	w0, [sp, 76]
	ldr	w0, [sp, 76]
	str	w0, [sp, 80]
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 8
	bl	malloc
	mov	x1, x0
	adrp	x0, var
	add	x0, x0, :lo12:var
	str	x1, [x0]
	str	wzr, [sp, 44]
	b	.L92
.L93:
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 8
	add	x0, x1, x0
	str	wzr, [x0]
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 8
	add	x0, x1, x0
	str	wzr, [x0, 128]
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L92:
	ldr	w1, [sp, 44]
	ldr	w0, [sp, 80]
	cmp	w1, w0
	blt	.L93
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 7
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	str	x1, [x0]
	str	wzr, [sp, 48]
	b	.L94
.L95:
	adrp	x0, cpu_res0
	add	x0, x0, :lo12:cpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 48]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	ldr	w0, [sp, 48]
	add	w0, w0, 1
	str	w0, [sp, 48]
.L94:
	ldr	w1, [sp, 48]
	ldr	w0, [sp, 80]
	cmp	w1, w0
	blt	.L95
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 7
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	str	x1, [x0]
	str	wzr, [sp, 52]
	b	.L96
.L97:
	adrp	x0, gpu_res0
	add	x0, x0, :lo12:gpu_res0
	ldr	x1, [x0]
	ldrsw	x0, [sp, 52]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
.L96:
	ldr	w1, [sp, 52]
	ldr	w0, [sp, 80]
	cmp	w1, w0
	blt	.L97
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 7
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	str	x1, [x0]
	str	wzr, [sp, 56]
	b	.L98
.L99:
	adrp	x0, cpu_res1
	add	x0, x0, :lo12:cpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 56]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	ldr	w0, [sp, 56]
	add	w0, w0, 1
	str	w0, [sp, 56]
.L98:
	ldr	w1, [sp, 56]
	ldr	w0, [sp, 80]
	cmp	w1, w0
	blt	.L99
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 7
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	str	x1, [x0]
	str	wzr, [sp, 60]
	b	.L100
.L101:
	adrp	x0, gpu_res1
	add	x0, x0, :lo12:gpu_res1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 7
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	ldr	w0, [sp, 60]
	add	w0, w0, 1
	str	w0, [sp, 60]
.L100:
	ldr	w1, [sp, 60]
	ldr	w0, [sp, 80]
	cmp	w1, w0
	blt	.L101
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	str	x1, [x0]
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	str	x1, [x0]
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	str	x1, [x0]
	ldrsw	x0, [sp, 80]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	str	x1, [x0]
	str	wzr, [sp, 64]
	b	.L102
.L103:
	ldr	w0, [sp, 64]
	str	w0, [sp, 96]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 6
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 5
	sub	w1, w2, w0
	str	w1, [sp, 100]
	adrp	x0, cpu_rand1
	add	x0, x0, :lo12:cpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 96]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 100]
	str	w1, [x0]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 6
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 5
	sub	w1, w2, w0
	str	w1, [sp, 100]
	adrp	x0, gpu_rand1
	add	x0, x0, :lo12:gpu_rand1
	ldr	x1, [x0]
	ldrsw	x0, [sp, 96]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 100]
	str	w1, [x0]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 6
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 5
	sub	w1, w2, w0
	str	w1, [sp, 100]
	adrp	x0, cpu_rand2
	add	x0, x0, :lo12:cpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 96]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 100]
	str	w1, [x0]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 6
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 5
	sub	w1, w2, w0
	str	w1, [sp, 100]
	adrp	x0, gpu_rand2
	add	x0, x0, :lo12:gpu_rand2
	ldr	x1, [x0]
	ldrsw	x0, [sp, 96]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 100]
	str	w1, [x0]
	ldr	w0, [sp, 64]
	add	w0, w0, 1
	str	w0, [sp, 64]
.L102:
	ldr	w1, [sp, 64]
	ldr	w0, [sp, 76]
	cmp	w1, w0
	blt	.L103
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
	ldrsw	x0, [sp, 72]
	mov	x1, 8
	bl	calloc
	str	x0, [sp, 112]
	ldr	w0, [sp, 72]
	mov	w2, w0
	mov	x1, 0
	adrp	x0, barrier
	add	x0, x0, :lo12:barrier
	bl	pthread_barrier_init
	ldr	x0, [sp, 112]
	cmp	x0, 0
	bne	.L104
	adrp	x0, .LC15
	add	x3, x0, :lo12:.LC15
	mov	w2, 360
	adrp	x0, .LC16
	add	x1, x0, :lo12:.LC16
	adrp	x0, .LC17
	add	x0, x0, :lo12:.LC17
	bl	__assert_fail
.L104:
	mov	w0, 1
	str	w0, [sp, 68]
	b	.L105
.L107:
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 3
	ldr	x1, [sp, 112]
	add	x4, x1, x0
	ldrsw	x0, [sp, 68]
	mov	x3, x0
	adrp	x0, _Z7runIRIWPv
	add	x2, x0, :lo12:_Z7runIRIWPv
	mov	x1, 0
	mov	x0, x4
	bl	pthread_create
	str	w0, [sp, 92]
	ldr	w0, [sp, 92]
	cmp	w0, 0
	beq	.L106
	adrp	x0, .LC15
	add	x3, x0, :lo12:.LC15
	mov	w2, 366
	adrp	x0, .LC16
	add	x1, x0, :lo12:.LC16
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	__assert_fail
.L106:
	ldr	w0, [sp, 68]
	add	w0, w0, 1
	str	w0, [sp, 68]
.L105:
	ldr	w1, [sp, 68]
	ldr	w0, [sp, 72]
	cmp	w1, w0
	blt	.L107
	mov	x0, 0
	bl	_Z7runIRIWPv
	str	x0, [sp, 104]
	ldr	x0, [sp, 104]
	mov	x1, x0
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	bl	printf
	mov	w0, 1
	str	w0, [sp, 68]
	b	.L108
.L110:
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 3
	ldr	x1, [sp, 112]
	add	x0, x1, x0
	ldr	x0, [x0]
	add	x1, sp, 104
	bl	pthread_join
	str	w0, [sp, 88]
	ldr	w0, [sp, 88]
	cmp	w0, 0
	beq	.L109
	adrp	x0, .LC15
	add	x3, x0, :lo12:.LC15
	mov	w2, 380
	adrp	x0, .LC16
	add	x1, x0, :lo12:.LC16
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	bl	__assert_fail
.L109:
	ldr	x0, [sp, 104]
	mov	x2, x0
	ldr	w1, [sp, 68]
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	printf
	ldr	w0, [sp, 68]
	add	w0, w0, 1
	str	w0, [sp, 68]
.L108:
	ldr	w1, [sp, 68]
	ldr	w0, [sp, 72]
	cmp	w1, w0
	blt	.L110
	adrp	x0, .LC22
	add	x1, x0, :lo12:.LC22
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	w0, [sp, 80]
	bl	_Z12check_outputj
	str	w0, [sp, 84]
	ldr	x0, [sp, 112]
	bl	free
	mov	w0, 0
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 120]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L112
	bl	__stack_chk_fail
.L112:
	mov	w0, w1
	ldp	x29, x30, [sp], 128
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1810:
	.size	main, .-main
	.align	2
	.type	_Z41__static_initialization_and_destruction_0ii, %function
_Z41__static_initialization_and_destruction_0ii:
.LFB2211:
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
	bne	.L115
	ldr	w1, [sp, 24]
	mov	w0, 65535
	cmp	w1, w0
	bne	.L115
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
.L115:
	nop
	ldp	x29, x30, [sp], 32
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE2211:
	.size	_Z41__static_initialization_and_destruction_0ii, .-_Z41__static_initialization_and_destruction_0ii
	.align	2
	.type	_GLOBAL__sub_I_barrier, %function
_GLOBAL__sub_I_barrier:
.LFB2212:
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
.LFE2212:
	.size	_GLOBAL__sub_I_barrier, .-_GLOBAL__sub_I_barrier
	.section	.init_array,"aw",%init_array
	.align	3
	.xword	_GLOBAL__sub_I_barrier
	.hidden	__dso_handle
	.ident	"GCC: (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0"
	.section	.note.GNU-stack,"",@progbits
