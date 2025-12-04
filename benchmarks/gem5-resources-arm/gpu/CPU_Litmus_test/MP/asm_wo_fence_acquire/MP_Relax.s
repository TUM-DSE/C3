	.arch armv8-a
	.file	"MP_Relax_WO_Fence_Acquire.cpp"
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
	.global	cpu_res
	.align	3
	.type	cpu_res, %object
	.size	cpu_res, 8
cpu_res:
	.zero	8
	.global	gpu_res
	.align	3
	.type	gpu_res, %object
	.size	gpu_res, 8
gpu_res:
	.zero	8
	.global	cpu_rand
	.align	3
	.type	cpu_rand, %object
	.size	cpu_rand, 8
cpu_rand:
	.zero	8
	.global	gpu_rand
	.align	3
	.type	gpu_rand, %object
	.size	gpu_rand, 8
gpu_rand:
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
	cmp	w1, 2
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
	asr	w2, w0, 2
	asr	w0, w1, 31
	sub	w2, w2, w0
	mov	w0, w2
	lsl	w0, w0, 2
	add	w0, w0, w2
	lsl	w0, w0, 1
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
	.global	_Z5runMPPv
	.type	_Z5runMPPv, %function
_Z5runMPPv:
.LFB1809:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp
	str	x0, [sp, 24]
	ldr	x0, [sp, 24]
	str	x0, [sp, 88]
	ldr	x0, [sp, 88]
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
	ldr	x0, [sp, 88]
	cmp	x0, 0
	bne	.L10
	str	wzr, [sp, 40]
	b	.L11
.L12:
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
	mov	w0, 50
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	x0, [sp, 112]
	ldr	x0, [sp, 112]
	str	x0, [sp, 136]
	mov	w0, 1
	str	w0, [sp, 60]
	str	wzr, [sp, 64]
	mov	w1, 65535
	ldr	w0, [sp, 64]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 68]
	ldr	x0, [sp, 136]
	ldr	w1, [sp, 60]
	stlr	w1, [x0]
	nop
	mov	w0, 640
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 40]
	lsl	x0, x0, 7
	add	x0, x1, x0
	add	x0, x0, 64
	str	x0, [sp, 120]
	ldr	x0, [sp, 120]
	str	x0, [sp, 128]
	mov	w0, 1
	str	w0, [sp, 48]
	str	wzr, [sp, 52]
	mov	w1, 65535
	ldr	w0, [sp, 52]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 56]
	ldr	x0, [sp, 128]
	ldr	w1, [sp, 48]
	stlr	w1, [x0]
	nop
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
.L11:
	ldr	w1, [sp, 40]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L12
	b	.L13
.L10:
	ldr	x0, [sp, 88]
	sub	w0, w0, #1
	str	w0, [sp, 44]
	b	.L14
.L17:
	mov	w0, 320
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 7
	add	x0, x1, x0
	add	x0, x0, 64
	str	x0, [sp, 96]
	ldr	x0, [sp, 96]
	str	x0, [sp, 152]
	mov	w0, 2
	str	w0, [sp, 80]
	mov	w1, 65535
	ldr	w0, [sp, 80]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 84]
	ldr	x0, [sp, 152]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	mov	w0, 640
	bl	_Z12random_delayi
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	x0, [sp, 104]
	ldr	x0, [sp, 104]
	str	x0, [sp, 144]
	mov	w0, 2
	str	w0, [sp, 72]
	mov	w1, 65535
	ldr	w0, [sp, 72]
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier
	str	w0, [sp, 76]
	ldr	x0, [sp, 144]
	ldar	w0, [x0]
	mov	w2, w0
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, w2
	str	w1, [x0]
	ldr	w0, [sp, 44]
	add	w0, w0, 2
	str	w0, [sp, 44]
.L14:
	ldr	w1, [sp, 44]
	mov	w0, 34463
	movk	w0, 0x1, lsl 16
	cmp	w1, w0
	ble	.L17
.L13:
	mrs	x0, tpidr_el0
	add	x0, x0, #:tprel_hi12:local, lsl #12
	add	x0, x0, #:tprel_lo12_nc:local
	ldr	w0, [x0]
	sxtw	x0, w0
	ldp	x29, x30, [sp], 160
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1809:
	.size	_Z5runMPPv, .-_Z5runMPPv
	.section	.rodata
	.align	3
.LC0:
	.string	"\nMessage Passing (MP) Litmus Test Results with RELAXED ORDERING:"
	.align	3
.LC1:
	.string	"1: x=0, flag=0: "
	.align	3
.LC2:
	.string	" ("
	.align	3
.LC3:
	.string	"%)"
	.align	3
.LC4:
	.string	"2: x=1, flag=1: "
	.align	3
.LC5:
	.string	"3: x=1, flag=0: "
	.align	3
.LC6:
	.string	"4: x=0, flag=1: "
	.align	3
.LC7:
	.string	"Uninitialized: "
	.align	3
.LC8:
	.string	"========================================================================="
	.align	3
.LC9:
	.string	"    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in "
	.align	3
.LC10:
	.string	" cases!"
	.align	3
.LC11:
	.string	"    This indicates memory ordering violations as expected with relaxed semantics"
	.align	3
.LC12:
	.string	"    No forbidden behavior observed (x=1, flag=0)"
	.align	3
.LC13:
	.string	"    Even with relaxed semantics, no reordering was detected"
	.text
	.align	2
	.global	_Z12check_outputj
	.type	_Z12check_outputj, %function
_Z12check_outputj:
.LFB1810:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp
	str	w0, [sp, 28]
	str	wzr, [sp, 40]
	str	wzr, [sp, 44]
	str	wzr, [sp, 48]
	str	wzr, [sp, 52]
	str	wzr, [sp, 56]
	str	wzr, [sp, 60]
	b	.L20
.L34:
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L21
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L21
	mov	w0, 1
	b	.L22
.L21:
	mov	w0, 0
.L22:
	cmp	w0, 0
	beq	.L23
	ldr	w0, [sp, 40]
	add	w0, w0, 1
	str	w0, [sp, 40]
	b	.L24
.L23:
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L25
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L25
	mov	w0, 1
	b	.L26
.L25:
	mov	w0, 0
.L26:
	cmp	w0, 0
	beq	.L27
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
	b	.L24
.L27:
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 0
	bne	.L28
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L28
	mov	w0, 1
	b	.L29
.L28:
	mov	w0, 0
.L29:
	cmp	w0, 0
	beq	.L30
	ldr	w0, [sp, 48]
	add	w0, w0, 1
	str	w0, [sp, 48]
	b	.L24
.L30:
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L31
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 60]
	lsl	x0, x0, 6
	add	x0, x1, x0
	ldr	w0, [x0]
	cmp	w0, 1
	bne	.L31
	mov	w0, 1
	b	.L32
.L31:
	mov	w0, 0
.L32:
	cmp	w0, 0
	beq	.L33
	ldr	w0, [sp, 52]
	add	w0, w0, 1
	str	w0, [sp, 52]
	b	.L24
.L33:
	ldr	w0, [sp, 56]
	add	w0, w0, 1
	str	w0, [sp, 56]
.L24:
	ldr	w0, [sp, 60]
	add	w0, w0, 1
	str	w0, [sp, 60]
.L20:
	ldr	w0, [sp, 60]
	ldr	w1, [sp, 28]
	cmp	w1, w0
	bhi	.L34
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
	ldr	w1, [sp, 40]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
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
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	mov	x0, x2
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
	ldr	w1, [sp, 52]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
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
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	adrp	x0, .LC5
	add	x1, x0, :lo12:.LC5
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	ldr	w1, [sp, 44]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
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
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
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
	ldr	w1, [sp, 48]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC2
	add	x1, x0, :lo12:.LC2
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x1, x0
	ldr	w0, [sp, 48]
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
	adrp	x0, .LC3
	add	x1, x0, :lo12:.LC3
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
	ldr	w1, [sp, 56]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	w0, [sp, 44]
	cmp	w0, 0
	beq	.L35
	adrp	x0, .LC8
	add	x1, x0, :lo12:.LC8
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
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
	ldr	w1, [sp, 44]
	bl	_ZNSolsEj
	mov	x2, x0
	adrp	x0, .LC10
	add	x1, x0, :lo12:.LC10
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
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
	adrp	x0, .LC8
	add	x1, x0, :lo12:.LC8
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 2
	b	.L36
.L35:
	adrp	x0, .LC8
	add	x1, x0, :lo12:.LC8
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
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	w0, 0
.L36:
	ldp	x29, x30, [sp], 64
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret
	.cfi_endproc
.LFE1810:
	.size	_Z12check_outputj, .-_Z12check_outputj
	.section	.rodata
	.align	3
.LC14:
	.string	"Starting %d threads for MP litmus test with RELAXED ordering...\n"
	.align	3
.LC15:
	.string	"This test is DESIGNED to expose the forbidden outcome (x=1, flag=0)\n"
	.align	3
.LC16:
	.string	"Random delays generated with high variability (0-"
	.align	3
.LC17:
	.string	" cycles)"
	.align	3
.LC18:
	.string	"int main()"
	.align	3
.LC19:
	.string	"MP_Relax_WO_Fence_Acquire.cpp"
	.align	3
.LC20:
	.string	"threads != NULL"
	.align	3
.LC21:
	.string	"createResult == 0"
	.align	3
.LC22:
	.string	"joinResult == 0"
	.align	3
.LC23:
	.string	"\nValidating..."
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1811:
	.cfi_startproc
	stp	x29, x30, [sp, -96]!
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x1, [x0]
	str	x1, [sp, 88]
	mov	x1, 0
	mov	w1, 3
	adrp	x0, .LC14
	add	x0, x0, :lo12:.LC14
	bl	printf
	adrp	x0, .LC15
	add	x0, x0, :lo12:.LC15
	bl	puts
	mov	w0, 34464
	movk	w0, 0x1, lsl 16
	str	w0, [sp, 48]
	ldr	w0, [sp, 48]
	str	w0, [sp, 52]
	ldrsw	x0, [sp, 52]
	lsl	x0, x0, 7
	bl	malloc
	mov	x1, x0
	adrp	x0, var
	add	x0, x0, :lo12:var
	str	x1, [x0]
	str	wzr, [sp, 28]
	b	.L38
.L39:
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 28]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	wzr, [x0]
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x1, [x0]
	ldrsw	x0, [sp, 28]
	lsl	x0, x0, 7
	add	x0, x1, x0
	str	wzr, [x0, 64]
	ldr	w0, [sp, 28]
	add	w0, w0, 1
	str	w0, [sp, 28]
.L38:
	ldr	w1, [sp, 28]
	ldr	w0, [sp, 52]
	cmp	w1, w0
	blt	.L39
	ldrsw	x0, [sp, 52]
	lsl	x0, x0, 6
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	str	x1, [x0]
	ldrsw	x0, [sp, 52]
	lsl	x0, x0, 6
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	str	x1, [x0]
	str	wzr, [sp, 32]
	b	.L40
.L41:
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 32]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	ldr	x1, [x0]
	ldrsw	x0, [sp, 32]
	lsl	x0, x0, 6
	add	x0, x1, x0
	mov	w1, 2
	str	w1, [x0]
	ldr	w0, [sp, 32]
	add	w0, w0, 1
	str	w0, [sp, 32]
.L40:
	ldr	w1, [sp, 32]
	ldr	w0, [sp, 52]
	cmp	w1, w0
	blt	.L41
	ldrsw	x0, [sp, 52]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, cpu_rand
	add	x0, x0, :lo12:cpu_rand
	str	x1, [x0]
	ldrsw	x0, [sp, 52]
	lsl	x0, x0, 2
	bl	malloc
	mov	x1, x0
	adrp	x0, gpu_rand
	add	x0, x0, :lo12:gpu_rand
	str	x1, [x0]
	str	wzr, [sp, 36]
	b	.L42
.L45:
	ldr	w0, [sp, 36]
	str	w0, [sp, 68]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 8
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 7
	sub	w1, w2, w0
	str	w1, [sp, 40]
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
	beq	.L43
	ldr	w1, [sp, 40]
	mov	w0, w1
	lsl	w0, w0, 1
	add	w0, w0, w1
	str	w0, [sp, 40]
.L43:
	adrp	x0, cpu_rand
	add	x0, x0, :lo12:cpu_rand
	ldr	x1, [x0]
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 40]
	str	w1, [x0]
	bl	rand
	mov	w2, w0
	mov	w0, 26215
	movk	w0, 0x6666, lsl 16
	smull	x0, w2, w0
	lsr	x0, x0, 32
	asr	w1, w0, 8
	asr	w0, w2, 31
	sub	w1, w1, w0
	mov	w0, w1
	lsl	w0, w0, 2
	add	w0, w0, w1
	lsl	w0, w0, 7
	sub	w1, w2, w0
	str	w1, [sp, 40]
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
	beq	.L44
	ldr	w1, [sp, 40]
	mov	w0, 52429
	movk	w0, 0xcccc, lsl 16
	umull	x0, w1, w0
	lsr	x0, x0, 32
	lsr	w0, w0, 3
	str	w0, [sp, 40]
.L44:
	adrp	x0, gpu_rand
	add	x0, x0, :lo12:gpu_rand
	ldr	x1, [x0]
	ldrsw	x0, [sp, 68]
	lsl	x0, x0, 2
	add	x0, x1, x0
	ldr	w1, [sp, 40]
	str	w1, [x0]
	ldr	w0, [sp, 36]
	add	w0, w0, 1
	str	w0, [sp, 36]
.L42:
	ldr	w1, [sp, 36]
	ldr	w0, [sp, 48]
	cmp	w1, w0
	blt	.L45
	adrp	x0, .LC16
	add	x1, x0, :lo12:.LC16
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	w1, 1920
	bl	_ZNSolsEi
	mov	x2, x0
	adrp	x0, .LC17
	add	x1, x0, :lo12:.LC17
	mov	x0, x2
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	mov	x1, 8
	mov	x0, 3
	bl	calloc
	str	x0, [sp, 80]
	mov	w2, 3
	mov	x1, 0
	adrp	x0, barrier
	add	x0, x0, :lo12:barrier
	bl	pthread_barrier_init
	ldr	x0, [sp, 80]
	cmp	x0, 0
	bne	.L46
	adrp	x0, .LC18
	add	x3, x0, :lo12:.LC18
	mov	w2, 238
	adrp	x0, .LC19
	add	x1, x0, :lo12:.LC19
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	bl	__assert_fail
.L46:
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L47
.L49:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x1, [sp, 80]
	add	x4, x1, x0
	ldrsw	x0, [sp, 44]
	mov	x3, x0
	adrp	x0, _Z5runMPPv
	add	x2, x0, :lo12:_Z5runMPPv
	mov	x1, 0
	mov	x0, x4
	bl	pthread_create
	str	w0, [sp, 64]
	ldr	w0, [sp, 64]
	cmp	w0, 0
	beq	.L48
	adrp	x0, .LC18
	add	x3, x0, :lo12:.LC18
	mov	w2, 246
	adrp	x0, .LC19
	add	x1, x0, :lo12:.LC19
	adrp	x0, .LC21
	add	x0, x0, :lo12:.LC21
	bl	__assert_fail
.L48:
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L47:
	ldr	w0, [sp, 44]
	cmp	w0, 2
	ble	.L49
	mov	x0, 0
	bl	_Z5runMPPv
	mov	w0, 1
	str	w0, [sp, 44]
	b	.L50
.L52:
	ldrsw	x0, [sp, 44]
	lsl	x0, x0, 3
	ldr	x1, [sp, 80]
	add	x0, x1, x0
	ldr	x0, [x0]
	add	x1, sp, 72
	bl	pthread_join
	str	w0, [sp, 60]
	ldr	w0, [sp, 60]
	cmp	w0, 0
	beq	.L51
	adrp	x0, .LC18
	add	x3, x0, :lo12:.LC18
	mov	w2, 256
	adrp	x0, .LC19
	add	x1, x0, :lo12:.LC19
	adrp	x0, .LC22
	add	x0, x0, :lo12:.LC22
	bl	__assert_fail
.L51:
	ldr	w0, [sp, 44]
	add	w0, w0, 1
	str	w0, [sp, 44]
.L50:
	ldr	w0, [sp, 44]
	cmp	w0, 2
	ble	.L52
	adrp	x0, .LC23
	add	x1, x0, :lo12:.LC23
	adrp	x0, :got:_ZSt4cout
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	mov	x2, x0
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]
	mov	x0, x2
	bl	_ZNSolsEPFRSoS_E
	ldr	w0, [sp, 52]
	bl	_Z12check_outputj
	str	w0, [sp, 56]
	ldr	x0, [sp, 80]
	bl	free
	adrp	x0, var
	add	x0, x0, :lo12:var
	ldr	x0, [x0]
	bl	free
	adrp	x0, cpu_res
	add	x0, x0, :lo12:cpu_res
	ldr	x0, [x0]
	bl	free
	adrp	x0, gpu_res
	add	x0, x0, :lo12:gpu_res
	ldr	x0, [x0]
	bl	free
	adrp	x0, cpu_rand
	add	x0, x0, :lo12:cpu_rand
	ldr	x0, [x0]
	bl	free
	adrp	x0, gpu_rand
	add	x0, x0, :lo12:gpu_rand
	ldr	x0, [x0]
	bl	free
	mov	w0, 0
	mov	w1, w0
	adrp	x0, :got:__stack_chk_guard
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]
	ldr	x3, [sp, 88]
	ldr	x2, [x0]
	subs	x3, x3, x2
	mov	x2, 0
	beq	.L54
	bl	__stack_chk_fail
.L54:
	mov	w0, w1
	ldp	x29, x30, [sp], 96
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
	bne	.L57
	ldr	w1, [sp, 24]
	mov	w0, 65535
	cmp	w1, w0
	bne	.L57
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
.L57:
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
