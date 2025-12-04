	.arch armv8-a
	.file	"LB_Relax_WO_Fence.cpp"
// GNU C++11 (Ubuntu 11.4.0-1ubuntu1~22.04) version 11.4.0 (aarch64-linux-gnu)
//	compiled by GNU C version 11.4.0, GMP version 6.2.1, MPFR version 4.1.0, MPC version 1.2.1, isl version isl-0.24-GMP

// GGC heuristics: --param ggc-min-expand=100 --param ggc-min-heapsize=131072
// options passed: -mlittle-endian -mabi=lp64 -std=c++11 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection
	.text
	.section	.text._ZStanSt12memory_orderSt23__memory_order_modifier,"axG",@progbits,_ZStanSt12memory_orderSt23__memory_order_modifier,comdat
	.align	2
	.weak	_ZStanSt12memory_orderSt23__memory_order_modifier
	.type	_ZStanSt12memory_orderSt23__memory_order_modifier, %function
_ZStanSt12memory_orderSt23__memory_order_modifier:
.LFB41:
	.cfi_startproc
	sub	sp, sp, #16	//,,
	.cfi_def_cfa_offset 16
	str	w0, [sp, 12]	// __m, __m
	str	w1, [sp, 8]	// __mod, __mod
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	ldr	w1, [sp, 12]	// __m.13_1, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	ldr	w0, [sp, 8]	// __mod.14_2, __mod
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	and	w0, w1, w0	// _3, __m.13_1, __mod.14_2
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:107:   }
	add	sp, sp, 16	//,,
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
	stp	x29, x30, [sp, -48]!	//,,,
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	//,
	str	w0, [sp, 28]	// max_cycles, max_cycles
// LB_Relax_WO_Fence.cpp:79:     if (rand() % 10 < 3) {
	bl	rand		//
	mov	w2, w0	// _1,
// LB_Relax_WO_Fence.cpp:79:     if (rand() % 10 < 3) {
	mov	w0, 26215	// tmp110,
	movk	w0, 0x6666, lsl 16	// tmp110,,
	smull	x0, w2, w0	// tmp109, _1, tmp110
	lsr	x0, x0, 32	// tmp111, tmp109,
	asr	w1, w0, 2	// tmp112, tmp111,
	asr	w0, w2, 31	// tmp113, _1,
	sub	w1, w1, w0	// _2, tmp112, tmp113
	mov	w0, w1	// tmp114, _2
	lsl	w0, w0, 2	// tmp115, tmp114,
	add	w0, w0, w1	// tmp114, tmp114, _2
	lsl	w0, w0, 1	// tmp116, tmp114,
	sub	w1, w2, w0	// _2, _1, tmp114
// LB_Relax_WO_Fence.cpp:79:     if (rand() % 10 < 3) {
	cmp	w1, 2	// _2,
	cset	w0, le	// tmp118,
	and	w0, w0, 255	// retval.15_20, tmp117
// LB_Relax_WO_Fence.cpp:79:     if (rand() % 10 < 3) {
	cmp	w0, 0	// retval.15_20,
	beq	.L4		//,
// LB_Relax_WO_Fence.cpp:81:         delay = rand() % 10;
	bl	rand		//
	mov	w1, w0	// _3,
// LB_Relax_WO_Fence.cpp:81:         delay = rand() % 10;
	mov	w0, 26215	// tmp120,
	movk	w0, 0x6666, lsl 16	// tmp120,,
	smull	x0, w1, w0	// tmp119, _3, tmp120
	lsr	x0, x0, 32	// tmp121, tmp119,
	asr	w2, w0, 2	// tmp122, tmp121,
	asr	w0, w1, 31	// tmp123, _3,
	sub	w2, w2, w0	// tmp124, tmp122, tmp123
	mov	w0, w2	// tmp125, tmp124
	lsl	w0, w0, 2	// tmp126, tmp125,
	add	w0, w0, w2	// tmp125, tmp125, tmp124
	lsl	w0, w0, 1	// tmp127, tmp125,
	sub	w0, w1, w0	// tmp128, _3, tmp125
	str	w0, [sp, 44]	// tmp128, delay
	b	.L5		//
.L4:
// LB_Relax_WO_Fence.cpp:82:     } else if (rand() % 10 < 1) {
	bl	rand		//
	mov	w2, w0	// _4,
// LB_Relax_WO_Fence.cpp:82:     } else if (rand() % 10 < 1) {
	mov	w0, 26215	// tmp130,
	movk	w0, 0x6666, lsl 16	// tmp130,,
	smull	x0, w2, w0	// tmp129, _4, tmp130
	lsr	x0, x0, 32	// tmp131, tmp129,
	asr	w1, w0, 2	// tmp132, tmp131,
	asr	w0, w2, 31	// tmp133, _4,
	sub	w1, w1, w0	// _5, tmp132, tmp133
	mov	w0, w1	// tmp134, _5
	lsl	w0, w0, 2	// tmp135, tmp134,
	add	w0, w0, w1	// tmp134, tmp134, _5
	lsl	w0, w0, 1	// tmp136, tmp134,
	sub	w1, w2, w0	// _5, _4, tmp134
// LB_Relax_WO_Fence.cpp:82:     } else if (rand() % 10 < 1) {
	cmp	w1, 0	// _5,
	cset	w0, le	// tmp138,
	and	w0, w0, 255	// retval.16_22, tmp137
// LB_Relax_WO_Fence.cpp:82:     } else if (rand() % 10 < 1) {
	cmp	w0, 0	// retval.16_22,
	beq	.L6		//,
// LB_Relax_WO_Fence.cpp:84:         delay = rand() % (max_cycles * 2) + max_cycles;
	bl	rand		//
	mov	w1, w0	// _6,
// LB_Relax_WO_Fence.cpp:84:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w0, [sp, 28]	// tmp139, max_cycles
	lsl	w0, w0, 1	// _7, tmp139,
// LB_Relax_WO_Fence.cpp:84:         delay = rand() % (max_cycles * 2) + max_cycles;
	sdiv	w2, w1, w0	// tmp151, _6, _7
	mul	w0, w2, w0	// tmp152, tmp151, _7
	sub	w0, w1, w0	// _8, _6, tmp152
// LB_Relax_WO_Fence.cpp:84:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w1, [sp, 28]	// tmp154, max_cycles
	add	w0, w1, w0	// tmp153, tmp154, _8
	str	w0, [sp, 44]	// tmp153, delay
	b	.L5		//
.L6:
// LB_Relax_WO_Fence.cpp:87:         delay = rand() % max_cycles;
	bl	rand		//
// LB_Relax_WO_Fence.cpp:87:         delay = rand() % max_cycles;
	ldr	w1, [sp, 28]	// tmp169, max_cycles
	sdiv	w2, w0, w1	// tmp168, _9, tmp169
	ldr	w1, [sp, 28]	// tmp171, max_cycles
	mul	w1, w2, w1	// tmp170, tmp168, tmp171
	sub	w0, w0, w1	// tmp172, _9, tmp170
	str	w0, [sp, 44]	// tmp172, delay
.L5:
// LB_Relax_WO_Fence.cpp:90:     volatile int dummy = 0;
	str	wzr, [sp, 36]	//, dummy
// LB_Relax_WO_Fence.cpp:91:     for (volatile int i = 0; i < delay; i++) {
	str	wzr, [sp, 40]	//, i
// LB_Relax_WO_Fence.cpp:91:     for (volatile int i = 0; i < delay; i++) {
	b	.L7		//
.L8:
// LB_Relax_WO_Fence.cpp:92:         dummy++;
	ldr	w0, [sp, 36]	// dummy.17_10, dummy
	add	w0, w0, 1	// _11, dummy.17_10,
	str	w0, [sp, 36]	// _11, dummy
// LB_Relax_WO_Fence.cpp:91:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.18_12, i
	add	w0, w0, 1	// _13, i.18_12,
	str	w0, [sp, 40]	// _13, i
.L7:
// LB_Relax_WO_Fence.cpp:91:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.20_14, i
// LB_Relax_WO_Fence.cpp:91:     for (volatile int i = 0; i < delay; i++) {
	ldr	w1, [sp, 44]	// tmp174, delay
	cmp	w1, w0	// tmp174, i.20_14
	cset	w0, gt	// tmp175,
	and	w0, w0, 255	// retval.19_32, tmp173
	cmp	w0, 0	// retval.19_32,
	bne	.L8		//,
// LB_Relax_WO_Fence.cpp:94: }
	nop	
	nop	
	ldp	x29, x30, [sp], 48	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1808:
	.size	_Z12random_delayi, .-_Z12random_delayi
	.text
	.align	2
	.global	_Z5runLBPv
	.type	_Z5runLBPv, %function
_Z5runLBPv:
.LFB1809:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!	//,,,
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp	//,
	str	x0, [sp, 24]	// arg, arg
// LB_Relax_WO_Fence.cpp:99:     long long int tid = (long long int)arg;
	ldr	x0, [sp, 24]	// tmp156, arg
	str	x0, [sp, 88]	// tmp156, tid
// LB_Relax_WO_Fence.cpp:100:     local += tid;
	ldr	x0, [sp, 88]	// tmp157, tid
	mov	w1, w0	// _1, tmp157
	mrs	x0, tpidr_el0	// tmp159
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp158, tmp159,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp158,
	ldr	w0, [x0]	// local.0_2, local
	add	w0, w1, w0	// _4, _1, local.1_3
	mov	w1, w0	// _5, _4
	mrs	x0, tpidr_el0	// tmp161
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp160, tmp161,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp160,
	str	w1, [x0]	// _5, local
// LB_Relax_WO_Fence.cpp:101:     pthread_barrier_wait(&barrier);
	adrp	x0, barrier	// tmp162,
	add	x0, x0, :lo12:barrier	//, tmp162,
	bl	pthread_barrier_wait		//
// LB_Relax_WO_Fence.cpp:103:     if(tid / DEF_THREADS == 0)
	ldr	x0, [sp, 88]	// tid.2_6, tid
	add	x0, x0, 3	// _7, tid.2_6,
	cmp	x0, 6	// _7,
	bhi	.L10		//,
// LB_Relax_WO_Fence.cpp:106:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 88]	// tmp163, tid
	str	w0, [sp, 40]	// tmp164, i
// LB_Relax_WO_Fence.cpp:106:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	b	.L11		//
.L13:
// LB_Relax_WO_Fence.cpp:109:             var[i].a = 0;
	adrp	x0, var	// tmp166,
	add	x0, x0, :lo12:var	// tmp165, tmp166,
	ldr	x1, [x0]	// var.3_8, var
// LB_Relax_WO_Fence.cpp:109:             var[i].a = 0;
	ldrsw	x0, [sp, 40]	// _9, i
// LB_Relax_WO_Fence.cpp:109:             var[i].a = 0;
	lsl	x0, x0, 7	// _10, _9,
	add	x0, x1, x0	// _11, var.3_8, _10
// LB_Relax_WO_Fence.cpp:109:             var[i].a = 0;
	str	wzr, [x0]	//, _11->a
// LB_Relax_WO_Fence.cpp:110:             var[i].b = 0;
	adrp	x0, var	// tmp168,
	add	x0, x0, :lo12:var	// tmp167, tmp168,
	ldr	x1, [x0]	// var.4_12, var
// LB_Relax_WO_Fence.cpp:110:             var[i].b = 0;
	ldrsw	x0, [sp, 40]	// _13, i
// LB_Relax_WO_Fence.cpp:110:             var[i].b = 0;
	lsl	x0, x0, 7	// _14, _13,
	add	x0, x1, x0	// _15, var.4_12, _14
// LB_Relax_WO_Fence.cpp:110:             var[i].b = 0;
	str	wzr, [x0, 64]	//, _15->b
// LB_Relax_WO_Fence.cpp:113:             random_delay(50);
	mov	w0, 50	//,
	bl	_Z12random_delayi		//
// LB_Relax_WO_Fence.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp170,
	add	x0, x0, :lo12:var	// tmp169, tmp170,
	ldr	x1, [x0]	// var.5_16, var
// LB_Relax_WO_Fence.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 40]	// _17, i
// LB_Relax_WO_Fence.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _18, _17,
	add	x0, x1, x0	// _19, var.5_16, _18
// LB_Relax_WO_Fence.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp171, _19,
	str	x0, [sp, 112]	// tmp171, tmp_b
// LB_Relax_WO_Fence.cpp:117:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldr	x0, [sp, 112]	// _20, tmp_b
	str	x0, [sp, 136]	// _20, this
	str	wzr, [sp, 60]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 60]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 64]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 136]	// _88, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _90,* _88
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48634, _90
// LB_Relax_WO_Fence.cpp:117:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	adrp	x0, gpu_res	// tmp173,
	add	x0, x0, :lo12:gpu_res	// tmp172, tmp173,
	ldr	x1, [x0]	// gpu_res.6_22, gpu_res
// LB_Relax_WO_Fence.cpp:117:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 40]	// _23, i
// LB_Relax_WO_Fence.cpp:117:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _24, _23,
	add	x0, x1, x0	// _25, gpu_res.6_22, _24
// LB_Relax_WO_Fence.cpp:117:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	mov	w1, w2	// _26, D.48634
// LB_Relax_WO_Fence.cpp:117:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	str	w1, [x0]	// _26, _25->r0
// LB_Relax_WO_Fence.cpp:121:             random_delay(RAND_RANGE);
	mov	w0, 640	//,
	bl	_Z12random_delayi		//
// LB_Relax_WO_Fence.cpp:124:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp175,
	add	x0, x0, :lo12:var	// tmp174, tmp175,
	ldr	x1, [x0]	// var.7_27, var
// LB_Relax_WO_Fence.cpp:124:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 40]	// _28, i
// LB_Relax_WO_Fence.cpp:124:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _29, _28,
	add	x0, x1, x0	// _30, var.7_27, _29
// LB_Relax_WO_Fence.cpp:124:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 120]	// _30, tmp_a
// LB_Relax_WO_Fence.cpp:125:             tmp_a->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 120]	// _31, tmp_a
	str	x0, [sp, 128]	// _31, this
	mov	w0, 1	// tmp176,
	str	w0, [sp, 48]	// tmp176, __i
	str	wzr, [sp, 52]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 52]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 56]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 128]	// _82, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 48]	// __i.21_83, __i
	stlr	w1, [x0]	// __i.21_83,* _82
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// LB_Relax_WO_Fence.cpp:106:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 40]	// tmp178, i
	add	w0, w0, 4	// tmp177, tmp178,
	str	w0, [sp, 40]	// tmp177, i
.L11:
// LB_Relax_WO_Fence.cpp:106:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 40]	// tmp179, i
	mov	w0, 34463	// tmp180,
	movk	w0, 0x1, lsl 16	// tmp180,,
	cmp	w1, w0	// tmp179, tmp180
	ble	.L13		//,
	b	.L14		//
.L10:
// LB_Relax_WO_Fence.cpp:131:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 88]	// tmp181, tid
	negs	x1, x0	// tmp182, tmp181
	and	x0, x0, 3	// tmp183, tmp181,
	and	x1, x1, 3	// tmp184, tmp182,
	csneg	x0, x0, x1, mi	// _32, tmp183, tmp184,
// LB_Relax_WO_Fence.cpp:131:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 44]	// tmp185, i
// LB_Relax_WO_Fence.cpp:131:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L15		//
.L17:
// LB_Relax_WO_Fence.cpp:134:             random_delay(RAND_RANGE / 2);
	mov	w0, 320	//,
	bl	_Z12random_delayi		//
// LB_Relax_WO_Fence.cpp:137:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp187,
	add	x0, x0, :lo12:var	// tmp186, tmp187,
	ldr	x1, [x0]	// var.8_33, var
// LB_Relax_WO_Fence.cpp:137:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 44]	// _34, i
// LB_Relax_WO_Fence.cpp:137:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _35, _34,
	add	x0, x1, x0	// _36, var.8_33, _35
// LB_Relax_WO_Fence.cpp:137:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 96]	// _36, tmp_a
// LB_Relax_WO_Fence.cpp:138:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldr	x0, [sp, 96]	// _37, tmp_a
	str	x0, [sp, 152]	// _37, this
	str	wzr, [sp, 80]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 80]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 84]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 152]	// _102, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _104,* _102
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48644, _104
// LB_Relax_WO_Fence.cpp:138:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	adrp	x0, cpu_res	// tmp189,
	add	x0, x0, :lo12:cpu_res	// tmp188, tmp189,
	ldr	x1, [x0]	// cpu_res.9_39, cpu_res
// LB_Relax_WO_Fence.cpp:138:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 44]	// _40, i
// LB_Relax_WO_Fence.cpp:138:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _41, _40,
	add	x0, x1, x0	// _42, cpu_res.9_39, _41
// LB_Relax_WO_Fence.cpp:138:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	mov	w1, w2	// _43, D.48644
// LB_Relax_WO_Fence.cpp:138:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	str	w1, [x0]	// _43, _42->r0
// LB_Relax_WO_Fence.cpp:142:             random_delay(RAND_RANGE);
	mov	w0, 640	//,
	bl	_Z12random_delayi		//
// LB_Relax_WO_Fence.cpp:145:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp191,
	add	x0, x0, :lo12:var	// tmp190, tmp191,
	ldr	x1, [x0]	// var.10_44, var
// LB_Relax_WO_Fence.cpp:145:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 44]	// _45, i
// LB_Relax_WO_Fence.cpp:145:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _46, _45,
	add	x0, x1, x0	// _47, var.10_44, _46
// LB_Relax_WO_Fence.cpp:145:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp192, _47,
	str	x0, [sp, 104]	// tmp192, tmp_b
// LB_Relax_WO_Fence.cpp:146:             tmp_b->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 104]	// _48, tmp_b
	str	x0, [sp, 144]	// _48, this
	mov	w0, 1	// tmp193,
	str	w0, [sp, 68]	// tmp193, __i
	str	wzr, [sp, 72]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 72]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 76]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 144]	// _96, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 68]	// __i.21_97, __i
	stlr	w1, [x0]	// __i.21_97,* _96
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// LB_Relax_WO_Fence.cpp:131:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 44]	// tmp195, i
	add	w0, w0, 4	// tmp194, tmp195,
	str	w0, [sp, 44]	// tmp194, i
.L15:
// LB_Relax_WO_Fence.cpp:131:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 44]	// tmp196, i
	mov	w0, 34463	// tmp197,
	movk	w0, 0x1, lsl 16	// tmp197,,
	cmp	w1, w0	// tmp196, tmp197
	ble	.L17		//,
.L14:
// LB_Relax_WO_Fence.cpp:150:     return (void*)local;
	mrs	x0, tpidr_el0	// tmp199
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp198, tmp199,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp198,
	ldr	w0, [x0]	// local.11_49, local
	sxtw	x0, w0	// _50, local.11_49
// LB_Relax_WO_Fence.cpp:151: }
	ldp	x29, x30, [sp], 160	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1809:
	.size	_Z5runLBPv, .-_Z5runLBPv
	.section	.rodata
	.align	3
.LC0:
	.string	"Load Buffer (LB) Litmus Test Results with RELAXED ORDERING:"
	.align	3
.LC1:
	.string	"T1 read a, T0 read b:"
	.align	3
.LC2:
	.string	"1: a:0 and b:0: "
	.align	3
.LC3:
	.string	" ("
	.align	3
.LC4:
	.string	"%)"
	.align	3
.LC5:
	.string	"2: a:1 and b:0: "
	.align	3
.LC6:
	.string	"3: a:0 and b:1: "
	.align	3
.LC7:
	.string	"4: a:1 and b:1: "
	.align	3
.LC8:
	.string	"Uninitialized: "
	.align	3
.LC9:
	.string	"========================================================================="
	.align	3
.LC10:
	.string	"    FORBIDDEN BEHAVIOR OBSERVED: a:1 and b:1 in "
	.align	3
.LC11:
	.string	" cases!"
	.align	3
.LC12:
	.string	"    This indicates a causal cycle in memory operations"
	.align	3
.LC13:
	.string	"    No forbidden behavior observed (a:1 and b:1)"
	.align	3
.LC14:
	.string	"    No causal cycles were detected"
	.text
	.align	2
	.global	_Z12check_outputj
	.type	_Z12check_outputj, %function
_Z12check_outputj:
.LFB1810:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!	//,,,
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	//,
	str	w0, [sp, 28]	// t_range, t_range
// LB_Relax_WO_Fence.cpp:156:     unsigned res_cpu0_gpu0 = 0;  // a:0 and b:0
	str	wzr, [sp, 40]	//, res_cpu0_gpu0
// LB_Relax_WO_Fence.cpp:157:     unsigned res_cpu1_gpu0 = 0;  // a:1 and b:0
	str	wzr, [sp, 44]	//, res_cpu1_gpu0
// LB_Relax_WO_Fence.cpp:158:     unsigned res_cpu0_gpu1 = 0;  // a:0 and b:1
	str	wzr, [sp, 48]	//, res_cpu0_gpu1
// LB_Relax_WO_Fence.cpp:159:     unsigned res_cpu1_gpu1 = 0;  // a:1 and b:1 (forbidden outcome for LB test)
	str	wzr, [sp, 52]	//, res_cpu1_gpu1
// LB_Relax_WO_Fence.cpp:160:     unsigned res_cpu2_gpu2 = 0;  // Other (initialization)
	str	wzr, [sp, 56]	//, res_cpu2_gpu2
// LB_Relax_WO_Fence.cpp:162:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 60]	//, i
// LB_Relax_WO_Fence.cpp:162:     for (auto i = 0; i < t_range; ++i) {
	b	.L20		//
.L34:
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp190,
	add	x0, x0, :lo12:cpu_res	// tmp189, tmp190,
	ldr	x1, [x0]	// cpu_res.25_1, cpu_res
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _2, i
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _3, _2,
	add	x0, x1, x0	// _4, cpu_res.25_1, _3
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _5, _4->r0
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _5,
	bne	.L21		//,
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp192,
	add	x0, x0, :lo12:gpu_res	// tmp191, tmp192,
	ldr	x1, [x0]	// gpu_res.26_6, gpu_res
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _7, i
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _8, _7,
	add	x0, x1, x0	// _9, gpu_res.26_6, _8
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _10, _9->r0
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _10,
	bne	.L21		//,
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.24_103,
	b	.L22		//
.L21:
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.24_103,
.L22:
// LB_Relax_WO_Fence.cpp:163:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.24_103,
	beq	.L23		//,
// LB_Relax_WO_Fence.cpp:164:             res_cpu0_gpu0++;
	ldr	w0, [sp, 40]	// tmp194, res_cpu0_gpu0
	add	w0, w0, 1	// tmp193, tmp194,
	str	w0, [sp, 40]	// tmp193, res_cpu0_gpu0
	b	.L24		//
.L23:
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp196,
	add	x0, x0, :lo12:cpu_res	// tmp195, tmp196,
	ldr	x1, [x0]	// cpu_res.29_11, cpu_res
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _12, i
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _13, _12,
	add	x0, x1, x0	// _14, cpu_res.29_11, _13
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _15, _14->r0
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 1	// _15,
	bne	.L25		//,
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp198,
	add	x0, x0, :lo12:gpu_res	// tmp197, tmp198,
	ldr	x1, [x0]	// gpu_res.30_16, gpu_res
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _17, i
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _18, _17,
	add	x0, x1, x0	// _19, gpu_res.30_16, _18
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _20, _19->r0
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _20,
	bne	.L25		//,
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.28_104,
	b	.L26		//
.L25:
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.28_104,
.L26:
// LB_Relax_WO_Fence.cpp:165:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.28_104,
	beq	.L27		//,
// LB_Relax_WO_Fence.cpp:166:             res_cpu1_gpu0++;
	ldr	w0, [sp, 44]	// tmp200, res_cpu1_gpu0
	add	w0, w0, 1	// tmp199, tmp200,
	str	w0, [sp, 44]	// tmp199, res_cpu1_gpu0
	b	.L24		//
.L27:
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp202,
	add	x0, x0, :lo12:cpu_res	// tmp201, tmp202,
	ldr	x1, [x0]	// cpu_res.33_21, cpu_res
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _22, i
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _23, _22,
	add	x0, x1, x0	// _24, cpu_res.33_21, _23
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _25, _24->r0
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// _25,
	bne	.L28		//,
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp204,
	add	x0, x0, :lo12:gpu_res	// tmp203, tmp204,
	ldr	x1, [x0]	// gpu_res.34_26, gpu_res
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _27, i
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _28, _27,
	add	x0, x1, x0	// _29, gpu_res.34_26, _28
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _30, _29->r0
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _30,
	bne	.L28		//,
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.32_105,
	b	.L29		//
.L28:
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.32_105,
.L29:
// LB_Relax_WO_Fence.cpp:167:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.32_105,
	beq	.L30		//,
// LB_Relax_WO_Fence.cpp:168:             res_cpu0_gpu1++;
	ldr	w0, [sp, 48]	// tmp206, res_cpu0_gpu1
	add	w0, w0, 1	// tmp205, tmp206,
	str	w0, [sp, 48]	// tmp205, res_cpu0_gpu1
	b	.L24		//
.L30:
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp208,
	add	x0, x0, :lo12:cpu_res	// tmp207, tmp208,
	ldr	x1, [x0]	// cpu_res.37_31, cpu_res
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _32, i
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _33, _32,
	add	x0, x1, x0	// _34, cpu_res.37_31, _33
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _35, _34->r0
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _35,
	bne	.L31		//,
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp210,
	add	x0, x0, :lo12:gpu_res	// tmp209, tmp210,
	ldr	x1, [x0]	// gpu_res.38_36, gpu_res
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _37, i
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _38, _37,
	add	x0, x1, x0	// _39, gpu_res.38_36, _38
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _40, _39->r0
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _40,
	bne	.L31		//,
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.36_106,
	b	.L32		//
.L31:
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.36_106,
.L32:
// LB_Relax_WO_Fence.cpp:169:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.36_106,
	beq	.L33		//,
// LB_Relax_WO_Fence.cpp:170:             res_cpu1_gpu1++;
	ldr	w0, [sp, 52]	// tmp212, res_cpu1_gpu1
	add	w0, w0, 1	// tmp211, tmp212,
	str	w0, [sp, 52]	// tmp211, res_cpu1_gpu1
	b	.L24		//
.L33:
// LB_Relax_WO_Fence.cpp:172:             res_cpu2_gpu2++;
	ldr	w0, [sp, 56]	// tmp214, res_cpu2_gpu2
	add	w0, w0, 1	// tmp213, tmp214,
	str	w0, [sp, 56]	// tmp213, res_cpu2_gpu2
.L24:
// LB_Relax_WO_Fence.cpp:162:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// tmp216, i
	add	w0, w0, 1	// tmp215, tmp216,
	str	w0, [sp, 60]	// tmp215, i
.L20:
// LB_Relax_WO_Fence.cpp:162:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// i.39_41, i
// LB_Relax_WO_Fence.cpp:162:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 28]	// tmp217, t_range
	cmp	w1, w0	// tmp217, i.39_41
	bhi	.L34		//,
// LB_Relax_WO_Fence.cpp:176:     std::cout << "Load Buffer (LB) Litmus Test Results with RELAXED ORDERING:" << std::endl;
	adrp	x0, .LC0	// tmp218,
	add	x1, x0, :lo12:.LC0	//, tmp218,
	adrp	x0, :got:_ZSt4cout	// tmp219,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp219,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _42,
// LB_Relax_WO_Fence.cpp:176:     std::cout << "Load Buffer (LB) Litmus Test Results with RELAXED ORDERING:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp220,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp220,
	mov	x0, x2	//, _42
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:177:     std::cout << "T1 read a, T0 read b:" << std::endl;
	adrp	x0, .LC1	// tmp221,
	add	x1, x0, :lo12:.LC1	//, tmp221,
	adrp	x0, :got:_ZSt4cout	// tmp222,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp222,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _43,
// LB_Relax_WO_Fence.cpp:177:     std::cout << "T1 read a, T0 read b:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp223,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp223,
	mov	x0, x2	//, _43
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:178:     std::cout << "1: a:0 and b:0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp224,
	add	x1, x0, :lo12:.LC2	//, tmp224,
	adrp	x0, :got:_ZSt4cout	// tmp225,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp225,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax_WO_Fence.cpp:178:     std::cout << "1: a:0 and b:0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 40]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _45,
// LB_Relax_WO_Fence.cpp:178:     std::cout << "1: a:0 and b:0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp226,
	add	x1, x0, :lo12:.LC3	//, tmp226,
	mov	x0, x2	//, _45
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _46,
// LB_Relax_WO_Fence.cpp:178:     std::cout << "1: a:0 and b:0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 40]	// tmp227, res_cpu0_gpu0
	ucvtf	d0, w0	// _47, tmp227
	mov	x0, 4636737291354636288	// tmp286,
	fmov	d1, x0	// tmp228, tmp286
	fmul	d1, d0, d1	// _48, _47, tmp228
// LB_Relax_WO_Fence.cpp:178:     std::cout << "1: a:0 and b:0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp229, t_range
	ucvtf	d0, w0	// _49, tmp229
	fdiv	d0, d1, d0	// _50, _48, _49
	mov	x0, x1	//, _46
	bl	_ZNSolsEd		//
	mov	x2, x0	// _51,
// LB_Relax_WO_Fence.cpp:178:     std::cout << "1: a:0 and b:0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp230,
	add	x1, x0, :lo12:.LC4	//, tmp230,
	mov	x0, x2	//, _51
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _52,
// LB_Relax_WO_Fence.cpp:178:     std::cout << "1: a:0 and b:0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp231,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp231,
	mov	x0, x2	//, _52
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:179:     std::cout << "2: a:1 and b:0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp232,
	add	x1, x0, :lo12:.LC5	//, tmp232,
	adrp	x0, :got:_ZSt4cout	// tmp233,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp233,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax_WO_Fence.cpp:179:     std::cout << "2: a:1 and b:0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _54,
// LB_Relax_WO_Fence.cpp:179:     std::cout << "2: a:1 and b:0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp234,
	add	x1, x0, :lo12:.LC3	//, tmp234,
	mov	x0, x2	//, _54
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _55,
// LB_Relax_WO_Fence.cpp:179:     std::cout << "2: a:1 and b:0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 44]	// tmp235, res_cpu1_gpu0
	ucvtf	d0, w0	// _56, tmp235
	mov	x0, 4636737291354636288	// tmp287,
	fmov	d1, x0	// tmp236, tmp287
	fmul	d1, d0, d1	// _57, _56, tmp236
// LB_Relax_WO_Fence.cpp:179:     std::cout << "2: a:1 and b:0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp237, t_range
	ucvtf	d0, w0	// _58, tmp237
	fdiv	d0, d1, d0	// _59, _57, _58
	mov	x0, x1	//, _55
	bl	_ZNSolsEd		//
	mov	x2, x0	// _60,
// LB_Relax_WO_Fence.cpp:179:     std::cout << "2: a:1 and b:0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp238,
	add	x1, x0, :lo12:.LC4	//, tmp238,
	mov	x0, x2	//, _60
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _61,
// LB_Relax_WO_Fence.cpp:179:     std::cout << "2: a:1 and b:0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp239,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp239,
	mov	x0, x2	//, _61
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:180:     std::cout << "3: a:0 and b:1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC6	// tmp240,
	add	x1, x0, :lo12:.LC6	//, tmp240,
	adrp	x0, :got:_ZSt4cout	// tmp241,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp241,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax_WO_Fence.cpp:180:     std::cout << "3: a:0 and b:1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _63,
// LB_Relax_WO_Fence.cpp:180:     std::cout << "3: a:0 and b:1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp242,
	add	x1, x0, :lo12:.LC3	//, tmp242,
	mov	x0, x2	//, _63
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _64,
// LB_Relax_WO_Fence.cpp:180:     std::cout << "3: a:0 and b:1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 48]	// tmp243, res_cpu0_gpu1
	ucvtf	d0, w0	// _65, tmp243
	mov	x0, 4636737291354636288	// tmp288,
	fmov	d1, x0	// tmp244, tmp288
	fmul	d1, d0, d1	// _66, _65, tmp244
// LB_Relax_WO_Fence.cpp:180:     std::cout << "3: a:0 and b:1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp245, t_range
	ucvtf	d0, w0	// _67, tmp245
	fdiv	d0, d1, d0	// _68, _66, _67
	mov	x0, x1	//, _64
	bl	_ZNSolsEd		//
	mov	x2, x0	// _69,
// LB_Relax_WO_Fence.cpp:180:     std::cout << "3: a:0 and b:1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp246,
	add	x1, x0, :lo12:.LC4	//, tmp246,
	mov	x0, x2	//, _69
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _70,
// LB_Relax_WO_Fence.cpp:180:     std::cout << "3: a:0 and b:1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp247,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp247,
	mov	x0, x2	//, _70
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:181:     std::cout << "4: a:1 and b:1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC7	// tmp248,
	add	x1, x0, :lo12:.LC7	//, tmp248,
	adrp	x0, :got:_ZSt4cout	// tmp249,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp249,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax_WO_Fence.cpp:181:     std::cout << "4: a:1 and b:1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _72,
// LB_Relax_WO_Fence.cpp:181:     std::cout << "4: a:1 and b:1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp250,
	add	x1, x0, :lo12:.LC3	//, tmp250,
	mov	x0, x2	//, _72
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _73,
// LB_Relax_WO_Fence.cpp:181:     std::cout << "4: a:1 and b:1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 52]	// tmp251, res_cpu1_gpu1
	ucvtf	d0, w0	// _74, tmp251
	mov	x0, 4636737291354636288	// tmp289,
	fmov	d1, x0	// tmp252, tmp289
	fmul	d1, d0, d1	// _75, _74, tmp252
// LB_Relax_WO_Fence.cpp:181:     std::cout << "4: a:1 and b:1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp253, t_range
	ucvtf	d0, w0	// _76, tmp253
	fdiv	d0, d1, d0	// _77, _75, _76
	mov	x0, x1	//, _73
	bl	_ZNSolsEd		//
	mov	x2, x0	// _78,
// LB_Relax_WO_Fence.cpp:181:     std::cout << "4: a:1 and b:1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp254,
	add	x1, x0, :lo12:.LC4	//, tmp254,
	mov	x0, x2	//, _78
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _79,
// LB_Relax_WO_Fence.cpp:181:     std::cout << "4: a:1 and b:1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp255,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp255,
	mov	x0, x2	//, _79
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:182:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, .LC8	// tmp256,
	add	x1, x0, :lo12:.LC8	//, tmp256,
	adrp	x0, :got:_ZSt4cout	// tmp257,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp257,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax_WO_Fence.cpp:182:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 56]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _81,
// LB_Relax_WO_Fence.cpp:182:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp258,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp258,
	mov	x0, x2	//, _81
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:184:     if (res_cpu1_gpu1 > 0) {
	ldr	w0, [sp, 52]	// tmp259, res_cpu1_gpu1
	cmp	w0, 0	// tmp259,
	beq	.L35		//,
// LB_Relax_WO_Fence.cpp:185:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC9	// tmp260,
	add	x1, x0, :lo12:.LC9	//, tmp260,
	adrp	x0, :got:_ZSt4cout	// tmp261,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp261,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _82,
// LB_Relax_WO_Fence.cpp:185:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp262,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp262,
	mov	x0, x2	//, _82
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:186:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: a:1 and b:1 in " << res_cpu1_gpu1 << " cases!" << std::endl;
	adrp	x0, .LC10	// tmp263,
	add	x1, x0, :lo12:.LC10	//, tmp263,
	adrp	x0, :got:_ZSt4cout	// tmp264,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp264,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax_WO_Fence.cpp:186:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: a:1 and b:1 in " << res_cpu1_gpu1 << " cases!" << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _84,
// LB_Relax_WO_Fence.cpp:186:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: a:1 and b:1 in " << res_cpu1_gpu1 << " cases!" << std::endl;
	adrp	x0, .LC11	// tmp265,
	add	x1, x0, :lo12:.LC11	//, tmp265,
	mov	x0, x2	//, _84
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _85,
// LB_Relax_WO_Fence.cpp:186:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: a:1 and b:1 in " << res_cpu1_gpu1 << " cases!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp266,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp266,
	mov	x0, x2	//, _85
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:187:         std::cout << "    This indicates a causal cycle in memory operations" << std::endl;
	adrp	x0, .LC12	// tmp267,
	add	x1, x0, :lo12:.LC12	//, tmp267,
	adrp	x0, :got:_ZSt4cout	// tmp268,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp268,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _86,
// LB_Relax_WO_Fence.cpp:187:         std::cout << "    This indicates a causal cycle in memory operations" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp269,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp269,
	mov	x0, x2	//, _86
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:188:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC9	// tmp270,
	add	x1, x0, :lo12:.LC9	//, tmp270,
	adrp	x0, :got:_ZSt4cout	// tmp271,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp271,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _87,
// LB_Relax_WO_Fence.cpp:188:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp272,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp272,
	mov	x0, x2	//, _87
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:189:         return 2;  // Forbidden outcome was observed
	mov	w0, 2	// _107,
	b	.L36		//
.L35:
// LB_Relax_WO_Fence.cpp:191:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC9	// tmp273,
	add	x1, x0, :lo12:.LC9	//, tmp273,
	adrp	x0, :got:_ZSt4cout	// tmp274,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp274,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _88,
// LB_Relax_WO_Fence.cpp:191:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp275,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp275,
	mov	x0, x2	//, _88
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:192:         std::cout << "    No forbidden behavior observed (a:1 and b:1)" << std::endl;
	adrp	x0, .LC13	// tmp276,
	add	x1, x0, :lo12:.LC13	//, tmp276,
	adrp	x0, :got:_ZSt4cout	// tmp277,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp277,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _89,
// LB_Relax_WO_Fence.cpp:192:         std::cout << "    No forbidden behavior observed (a:1 and b:1)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp278,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp278,
	mov	x0, x2	//, _89
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:193:         std::cout << "    No causal cycles were detected" << std::endl;
	adrp	x0, .LC14	// tmp279,
	add	x1, x0, :lo12:.LC14	//, tmp279,
	adrp	x0, :got:_ZSt4cout	// tmp280,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp280,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _90,
// LB_Relax_WO_Fence.cpp:193:         std::cout << "    No causal cycles were detected" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp281,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp281,
	mov	x0, x2	//, _90
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:194:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC9	// tmp282,
	add	x1, x0, :lo12:.LC9	//, tmp282,
	adrp	x0, :got:_ZSt4cout	// tmp283,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp283,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _91,
// LB_Relax_WO_Fence.cpp:194:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp284,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp284,
	mov	x0, x2	//, _91
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:195:         return 0;  // No forbidden outcome observed
	mov	w0, 0	// _107,
.L36:
// LB_Relax_WO_Fence.cpp:197: }
	ldp	x29, x30, [sp], 64	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1810:
	.size	_Z12check_outputj, .-_Z12check_outputj
	.section	.rodata
	.align	3
.LC15:
	.string	"usage: %s <thread_count>\n"
	.align	3
.LC16:
	.string	"Starting %d threads for Load Buffer (LB) test...\n"
	.align	3
.LC17:
	.string	"This test is DESIGNED to expose the forbidden outcome (a:1 and b:1)"
	.align	3
.LC18:
	.string	"Random delays generated (0-"
	.align	3
.LC19:
	.string	" cycles)"
	.align	3
.LC20:
	.string	"int main(int, char**)"
	.align	3
.LC21:
	.string	"LB_Relax_WO_Fence.cpp"
	.align	3
.LC22:
	.string	"threads != NULL"
	.align	3
.LC23:
	.string	"createResult == 0"
	.align	3
.LC24:
	.string	"local[0] = %lld\n"
	.align	3
.LC25:
	.string	"joinResult == 0"
	.align	3
.LC26:
	.string	"local[%d] = %lld\n"
	.align	3
.LC27:
	.string	"Validating..."
	.text
	.align	2
	.global	main
	.type	main, %function
main:
.LFB1811:
	.cfi_startproc
	stp	x29, x30, [sp, -112]!	//,,,
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp	//,
	str	w0, [sp, 28]	// argc, argc
	str	x1, [sp, 16]	// argv, argv
// LB_Relax_WO_Fence.cpp:202: {
	adrp	x0, :got:__stack_chk_guard	// tmp168,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp167, tmp168,
	ldr	x1, [x0]	// tmp291,
	str	x1, [sp, 104]	// tmp291, D.48663
	mov	x1, 0	// tmp291
// LB_Relax_WO_Fence.cpp:203:     if (argc != 2) { 
	ldr	w0, [sp, 28]	// tmp169, argc
	cmp	w0, 2	// tmp169,
	beq	.L38		//,
// LB_Relax_WO_Fence.cpp:204:         printf("usage: %s <thread_count>\n", argv[0]);
	ldr	x0, [sp, 16]	// tmp170, argv
	ldr	x0, [x0]	// _1, *argv_86(D)
	mov	x1, x0	//, _1
	adrp	x0, .LC15	// tmp171,
	add	x0, x0, :lo12:.LC15	//, tmp171,
	bl	printf		//
// LB_Relax_WO_Fence.cpp:205:         exit(1);
	mov	w0, 1	//,
	bl	exit		//
.L38:
// LB_Relax_WO_Fence.cpp:207:     int thread_count = atoi(argv[1]);
	ldr	x0, [sp, 16]	// tmp172, argv
	add	x0, x0, 8	// _2, tmp172,
// LB_Relax_WO_Fence.cpp:207:     int thread_count = atoi(argv[1]);
	ldr	x0, [x0]	// _3, *_2
	bl	atoi		//
	str	w0, [sp, 56]	//, thread_count
// LB_Relax_WO_Fence.cpp:209:     printf("Starting %d threads for Load Buffer (LB) test...\n", thread_count);
	ldr	w1, [sp, 56]	//, thread_count
	adrp	x0, .LC16	// tmp173,
	add	x0, x0, :lo12:.LC16	//, tmp173,
	bl	printf		//
// LB_Relax_WO_Fence.cpp:210:     printf("This test is DESIGNED to expose the forbidden outcome (a:1 and b:1)\n");
	adrp	x0, .LC17	// tmp174,
	add	x0, x0, :lo12:.LC17	//, tmp174,
	bl	puts		//
// LB_Relax_WO_Fence.cpp:212:     auto num_iterations = DEF_RUNS; 
	mov	w0, 34464	// tmp175,
	movk	w0, 0x1, lsl 16	// tmp175,,
	str	w0, [sp, 60]	// tmp175, num_iterations
// LB_Relax_WO_Fence.cpp:213:     auto t_range = num_iterations;
	ldr	w0, [sp, 60]	// tmp176, num_iterations
	str	w0, [sp, 64]	// tmp176, t_range
// LB_Relax_WO_Fence.cpp:216:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	ldrsw	x0, [sp, 64]	// _4, t_range
// LB_Relax_WO_Fence.cpp:216:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	lsl	x0, x0, 7	// _5, _4,
	bl	malloc		//
	mov	x1, x0	// _6, tmp177
// LB_Relax_WO_Fence.cpp:216:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	adrp	x0, var	// tmp179,
	add	x0, x0, :lo12:var	// tmp178, tmp179,
	str	x1, [x0]	// _6, var
// LB_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 36]	//, i
// LB_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	b	.L39		//
.L40:
// LB_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	adrp	x0, var	// tmp181,
	add	x0, x0, :lo12:var	// tmp180, tmp181,
	ldr	x1, [x0]	// var.40_7, var
// LB_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	ldrsw	x0, [sp, 36]	// _8, i
// LB_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	lsl	x0, x0, 7	// _9, _8,
	add	x0, x1, x0	// _10, var.40_7, _9
// LB_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	str	wzr, [x0]	//, _10->a
// LB_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	adrp	x0, var	// tmp183,
	add	x0, x0, :lo12:var	// tmp182, tmp183,
	ldr	x1, [x0]	// var.41_11, var
// LB_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	ldrsw	x0, [sp, 36]	// _12, i
// LB_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	lsl	x0, x0, 7	// _13, _12,
	add	x0, x1, x0	// _14, var.41_11, _13
// LB_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	str	wzr, [x0, 64]	//, _14->b
// LB_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 36]	// tmp185, i
	add	w0, w0, 1	// tmp184, tmp185,
	str	w0, [sp, 36]	// tmp184, i
.L39:
// LB_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 36]	// tmp186, i
	ldr	w0, [sp, 64]	// tmp187, t_range
	cmp	w1, w0	// tmp186, tmp187
	blt	.L40		//,
// LB_Relax_WO_Fence.cpp:224:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	ldrsw	x0, [sp, 64]	// _15, t_range
// LB_Relax_WO_Fence.cpp:224:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	lsl	x0, x0, 6	// _16, _15,
	bl	malloc		//
	mov	x1, x0	// _17, tmp188
// LB_Relax_WO_Fence.cpp:224:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	adrp	x0, cpu_res	// tmp190,
	add	x0, x0, :lo12:cpu_res	// tmp189, tmp190,
	str	x1, [x0]	// _17, cpu_res
// LB_Relax_WO_Fence.cpp:226:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 40]	//, i
// LB_Relax_WO_Fence.cpp:226:     for (auto i = 0; i < t_range; ++i) {
	b	.L41		//
.L42:
// LB_Relax_WO_Fence.cpp:227:         cpu_res[i].r0 = 2;
	adrp	x0, cpu_res	// tmp192,
	add	x0, x0, :lo12:cpu_res	// tmp191, tmp192,
	ldr	x1, [x0]	// cpu_res.42_18, cpu_res
// LB_Relax_WO_Fence.cpp:227:         cpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 40]	// _19, i
// LB_Relax_WO_Fence.cpp:227:         cpu_res[i].r0 = 2;
	lsl	x0, x0, 6	// _20, _19,
	add	x0, x1, x0	// _21, cpu_res.42_18, _20
// LB_Relax_WO_Fence.cpp:227:         cpu_res[i].r0 = 2;
	mov	w1, 2	// tmp193,
	str	w1, [x0]	// tmp193, _21->r0
// LB_Relax_WO_Fence.cpp:226:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 40]	// tmp195, i
	add	w0, w0, 1	// tmp194, tmp195,
	str	w0, [sp, 40]	// tmp194, i
.L41:
// LB_Relax_WO_Fence.cpp:226:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 40]	// tmp196, i
	ldr	w0, [sp, 64]	// tmp197, t_range
	cmp	w1, w0	// tmp196, tmp197
	blt	.L42		//,
// LB_Relax_WO_Fence.cpp:231:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	ldrsw	x0, [sp, 64]	// _22, t_range
// LB_Relax_WO_Fence.cpp:231:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	lsl	x0, x0, 6	// _23, _22,
	bl	malloc		//
	mov	x1, x0	// _24, tmp198
// LB_Relax_WO_Fence.cpp:231:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	adrp	x0, gpu_res	// tmp200,
	add	x0, x0, :lo12:gpu_res	// tmp199, tmp200,
	str	x1, [x0]	// _24, gpu_res
// LB_Relax_WO_Fence.cpp:233:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 44]	//, i
// LB_Relax_WO_Fence.cpp:233:     for (auto i = 0; i < t_range; ++i) {
	b	.L43		//
.L44:
// LB_Relax_WO_Fence.cpp:234:         gpu_res[i].r0 = 2;
	adrp	x0, gpu_res	// tmp202,
	add	x0, x0, :lo12:gpu_res	// tmp201, tmp202,
	ldr	x1, [x0]	// gpu_res.43_25, gpu_res
// LB_Relax_WO_Fence.cpp:234:         gpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _26, i
// LB_Relax_WO_Fence.cpp:234:         gpu_res[i].r0 = 2;
	lsl	x0, x0, 6	// _27, _26,
	add	x0, x1, x0	// _28, gpu_res.43_25, _27
// LB_Relax_WO_Fence.cpp:234:         gpu_res[i].r0 = 2;
	mov	w1, 2	// tmp203,
	str	w1, [x0]	// tmp203, _28->r0
// LB_Relax_WO_Fence.cpp:233:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 44]	// tmp205, i
	add	w0, w0, 1	// tmp204, tmp205,
	str	w0, [sp, 44]	// tmp204, i
.L43:
// LB_Relax_WO_Fence.cpp:233:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 44]	// tmp206, i
	ldr	w0, [sp, 64]	// tmp207, t_range
	cmp	w1, w0	// tmp206, tmp207
	blt	.L44		//,
// LB_Relax_WO_Fence.cpp:238:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 64]	// _29, t_range
// LB_Relax_WO_Fence.cpp:238:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _30, _29,
	bl	malloc		//
	mov	x1, x0	// _31, tmp208
// LB_Relax_WO_Fence.cpp:238:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand	// tmp210,
	add	x0, x0, :lo12:cpu_rand	// tmp209, tmp210,
	str	x1, [x0]	// _31, cpu_rand
// LB_Relax_WO_Fence.cpp:239:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 64]	// _32, t_range
// LB_Relax_WO_Fence.cpp:239:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _33, _32,
	bl	malloc		//
	mov	x1, x0	// _34, tmp211
// LB_Relax_WO_Fence.cpp:239:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand	// tmp213,
	add	x0, x0, :lo12:gpu_rand	// tmp212, tmp213,
	str	x1, [x0]	// _34, gpu_rand
// LB_Relax_WO_Fence.cpp:242:     for (int iter = 0; iter < num_iterations; iter++) {
	str	wzr, [sp, 48]	//, iter
// LB_Relax_WO_Fence.cpp:242:     for (int iter = 0; iter < num_iterations; iter++) {
	b	.L45		//
.L46:
// LB_Relax_WO_Fence.cpp:243:         auto g_tid = iter;
	ldr	w0, [sp, 48]	// tmp214, iter
	str	w0, [sp, 80]	// tmp214, g_tid
// LB_Relax_WO_Fence.cpp:246:         unsigned rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _35,
// LB_Relax_WO_Fence.cpp:246:         unsigned rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp216,
	movk	w0, 0x6666, lsl 16	// tmp216,,
	smull	x0, w2, w0	// tmp215, _35, tmp216
	lsr	x0, x0, 32	// tmp217, tmp215,
	asr	w1, w0, 8	// tmp218, tmp217,
	asr	w0, w2, 31	// tmp219, _35,
	sub	w1, w1, w0	// _36, tmp218, tmp219
	mov	w0, w1	// tmp220, _36
	lsl	w0, w0, 2	// tmp221, tmp220,
	add	w0, w0, w1	// tmp220, tmp220, _36
	lsl	w0, w0, 7	// tmp222, tmp220,
	sub	w1, w2, w0	// _36, _35, tmp220
// LB_Relax_WO_Fence.cpp:246:         unsigned rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 84]	// _36, rand_val
// LB_Relax_WO_Fence.cpp:247:         cpu_rand[g_tid] = rand_val;
	adrp	x0, cpu_rand	// tmp224,
	add	x0, x0, :lo12:cpu_rand	// tmp223, tmp224,
	ldr	x1, [x0]	// cpu_rand.44_37, cpu_rand
// LB_Relax_WO_Fence.cpp:247:         cpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 80]	// _38, g_tid
// LB_Relax_WO_Fence.cpp:247:         cpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _39, _38,
	add	x0, x1, x0	// _40, cpu_rand.44_37, _39
// LB_Relax_WO_Fence.cpp:247:         cpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 84]	// tmp225, rand_val
	str	w1, [x0]	// tmp225, *_40
// LB_Relax_WO_Fence.cpp:250:         rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _41,
// LB_Relax_WO_Fence.cpp:250:         rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp227,
	movk	w0, 0x6666, lsl 16	// tmp227,,
	smull	x0, w2, w0	// tmp226, _41, tmp227
	lsr	x0, x0, 32	// tmp228, tmp226,
	asr	w1, w0, 8	// tmp229, tmp228,
	asr	w0, w2, 31	// tmp230, _41,
	sub	w1, w1, w0	// _42, tmp229, tmp230
	mov	w0, w1	// tmp231, _42
	lsl	w0, w0, 2	// tmp232, tmp231,
	add	w0, w0, w1	// tmp231, tmp231, _42
	lsl	w0, w0, 7	// tmp233, tmp231,
	sub	w1, w2, w0	// _42, _41, tmp231
// LB_Relax_WO_Fence.cpp:250:         rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 84]	// _42, rand_val
// LB_Relax_WO_Fence.cpp:251:         gpu_rand[g_tid] = rand_val;
	adrp	x0, gpu_rand	// tmp235,
	add	x0, x0, :lo12:gpu_rand	// tmp234, tmp235,
	ldr	x1, [x0]	// gpu_rand.45_43, gpu_rand
// LB_Relax_WO_Fence.cpp:251:         gpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 80]	// _44, g_tid
// LB_Relax_WO_Fence.cpp:251:         gpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _45, _44,
	add	x0, x1, x0	// _46, gpu_rand.45_43, _45
// LB_Relax_WO_Fence.cpp:251:         gpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 84]	// tmp236, rand_val
	str	w1, [x0]	// tmp236, *_46
// LB_Relax_WO_Fence.cpp:242:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w0, [sp, 48]	// tmp238, iter
	add	w0, w0, 1	// tmp237, tmp238,
	str	w0, [sp, 48]	// tmp237, iter
.L45:
// LB_Relax_WO_Fence.cpp:242:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w1, [sp, 48]	// tmp239, iter
	ldr	w0, [sp, 60]	// tmp240, num_iterations
	cmp	w1, w0	// tmp239, tmp240
	blt	.L46		//,
// LB_Relax_WO_Fence.cpp:254:     std::cout << "Random delays generated (0-" << RAND_RANGE << " cycles)" << std::endl;
	adrp	x0, .LC18	// tmp241,
	add	x1, x0, :lo12:.LC18	//, tmp241,
	adrp	x0, :got:_ZSt4cout	// tmp242,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp242,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax_WO_Fence.cpp:254:     std::cout << "Random delays generated (0-" << RAND_RANGE << " cycles)" << std::endl;
	mov	w1, 640	//,
	bl	_ZNSolsEi		//
	mov	x2, x0	// _48,
	adrp	x0, .LC19	// tmp243,
	add	x1, x0, :lo12:.LC19	//, tmp243,
	mov	x0, x2	//, _48
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _49,
// LB_Relax_WO_Fence.cpp:254:     std::cout << "Random delays generated (0-" << RAND_RANGE << " cycles)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp244,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp244,
	mov	x0, x2	//, _49
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:258:     pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
	ldrsw	x0, [sp, 56]	// _50, thread_count
	mov	x1, 8	//,
	bl	calloc		//
	str	x0, [sp, 96]	// tmp245, threads
// LB_Relax_WO_Fence.cpp:259:     pthread_barrier_init(&barrier, NULL, (thread_count));
	ldr	w0, [sp, 56]	// thread_count.46_51, thread_count
	mov	w2, w0	//, thread_count.46_51
	mov	x1, 0	//,
	adrp	x0, barrier	// tmp246,
	add	x0, x0, :lo12:barrier	//, tmp246,
	bl	pthread_barrier_init		//
// LB_Relax_WO_Fence.cpp:260:     assert(threads != NULL);
	ldr	x0, [sp, 96]	// tmp247, threads
	cmp	x0, 0	// tmp247,
	bne	.L47		//,
// LB_Relax_WO_Fence.cpp:260:     assert(threads != NULL);
	adrp	x0, .LC20	// tmp248,
	add	x3, x0, :lo12:.LC20	//, tmp248,
	mov	w2, 260	//,
	adrp	x0, .LC21	// tmp249,
	add	x1, x0, :lo12:.LC21	//, tmp249,
	adrp	x0, .LC22	// tmp250,
	add	x0, x0, :lo12:.LC22	//, tmp250,
	bl	__assert_fail		//
.L47:
// LB_Relax_WO_Fence.cpp:262:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp251,
	str	w0, [sp, 52]	// tmp251, i
// LB_Relax_WO_Fence.cpp:262:     for (i = 1 ; i < thread_count; i++) {
	b	.L48		//
.L50:
// LB_Relax_WO_Fence.cpp:263:         int createResult = pthread_create(&threads[i], 
	ldrsw	x0, [sp, 52]	// _52, i
// LB_Relax_WO_Fence.cpp:263:         int createResult = pthread_create(&threads[i], 
	lsl	x0, x0, 3	// _53, _52,
// LB_Relax_WO_Fence.cpp:263:         int createResult = pthread_create(&threads[i], 
	ldr	x1, [sp, 96]	// tmp252, threads
	add	x4, x1, x0	// _54, tmp252, _53
// LB_Relax_WO_Fence.cpp:266:                                          (void*)i);
	ldrsw	x0, [sp, 52]	// _55, i
// LB_Relax_WO_Fence.cpp:263:         int createResult = pthread_create(&threads[i], 
	mov	x3, x0	//, _56
	adrp	x0, _Z5runLBPv	// tmp253,
	add	x2, x0, :lo12:_Z5runLBPv	//, tmp253,
	mov	x1, 0	//,
	mov	x0, x4	//, _54
	bl	pthread_create		//
	str	w0, [sp, 76]	//, createResult
// LB_Relax_WO_Fence.cpp:267:         assert(createResult == 0);
	ldr	w0, [sp, 76]	// tmp254, createResult
	cmp	w0, 0	// tmp254,
	beq	.L49		//,
// LB_Relax_WO_Fence.cpp:267:         assert(createResult == 0);
	adrp	x0, .LC20	// tmp255,
	add	x3, x0, :lo12:.LC20	//, tmp255,
	mov	w2, 267	//,
	adrp	x0, .LC21	// tmp256,
	add	x1, x0, :lo12:.LC21	//, tmp256,
	adrp	x0, .LC23	// tmp257,
	add	x0, x0, :lo12:.LC23	//, tmp257,
	bl	__assert_fail		//
.L49:
// LB_Relax_WO_Fence.cpp:262:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 52]	// tmp259, i
	add	w0, w0, 1	// tmp258, tmp259,
	str	w0, [sp, 52]	// tmp258, i
.L48:
// LB_Relax_WO_Fence.cpp:262:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 52]	// tmp260, i
	ldr	w0, [sp, 56]	// tmp261, thread_count
	cmp	w1, w0	// tmp260, tmp261
	blt	.L50		//,
// LB_Relax_WO_Fence.cpp:270:     long long int local = (long long int)runLB((void*)0);
	mov	x0, 0	//,
	bl	_Z5runLBPv		//
// LB_Relax_WO_Fence.cpp:270:     long long int local = (long long int)runLB((void*)0);
	str	x0, [sp, 88]	// _58, local
// LB_Relax_WO_Fence.cpp:271:     printf("local[0] = %lld\n", local);
	ldr	x0, [sp, 88]	// local.47_59, local
	mov	x1, x0	//, local.47_59
	adrp	x0, .LC24	// tmp262,
	add	x0, x0, :lo12:.LC24	//, tmp262,
	bl	printf		//
// LB_Relax_WO_Fence.cpp:274:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp263,
	str	w0, [sp, 52]	// tmp263, i
// LB_Relax_WO_Fence.cpp:274:     for (i = 1 ; i < thread_count; i++) {
	b	.L51		//
.L53:
// LB_Relax_WO_Fence.cpp:275:         int joinResult = pthread_join(threads[i], 
	ldrsw	x0, [sp, 52]	// _60, i
// LB_Relax_WO_Fence.cpp:275:         int joinResult = pthread_join(threads[i], 
	lsl	x0, x0, 3	// _61, _60,
	ldr	x1, [sp, 96]	// tmp264, threads
	add	x0, x1, x0	// _62, tmp264, _61
// LB_Relax_WO_Fence.cpp:275:         int joinResult = pthread_join(threads[i], 
	ldr	x0, [x0]	// _63, *_62
	add	x1, sp, 88	// tmp265,,
	bl	pthread_join		//
	str	w0, [sp, 72]	// _138, joinResult
// LB_Relax_WO_Fence.cpp:277:         assert(joinResult == 0);
	ldr	w0, [sp, 72]	// tmp266, joinResult
	cmp	w0, 0	// tmp266,
	beq	.L52		//,
// LB_Relax_WO_Fence.cpp:277:         assert(joinResult == 0);
	adrp	x0, .LC20	// tmp267,
	add	x3, x0, :lo12:.LC20	//, tmp267,
	mov	w2, 277	//,
	adrp	x0, .LC21	// tmp268,
	add	x1, x0, :lo12:.LC21	//, tmp268,
	adrp	x0, .LC25	// tmp269,
	add	x0, x0, :lo12:.LC25	//, tmp269,
	bl	__assert_fail		//
.L52:
// LB_Relax_WO_Fence.cpp:278:         printf("local[%d] = %lld\n", i, local);
	ldr	x0, [sp, 88]	// local.48_64, local
	mov	x2, x0	//, local.48_64
	ldr	w1, [sp, 52]	//, i
	adrp	x0, .LC26	// tmp270,
	add	x0, x0, :lo12:.LC26	//, tmp270,
	bl	printf		//
// LB_Relax_WO_Fence.cpp:274:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 52]	// tmp272, i
	add	w0, w0, 1	// tmp271, tmp272,
	str	w0, [sp, 52]	// tmp271, i
.L51:
// LB_Relax_WO_Fence.cpp:274:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 52]	// tmp273, i
	ldr	w0, [sp, 56]	// tmp274, thread_count
	cmp	w1, w0	// tmp273, tmp274
	blt	.L53		//,
// LB_Relax_WO_Fence.cpp:282:     std::cout << "Validating..." << std::flush;
	adrp	x0, .LC27	// tmp275,
	add	x1, x0, :lo12:.LC27	//, tmp275,
	adrp	x0, :got:_ZSt4cout	// tmp276,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp276,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _65,
// LB_Relax_WO_Fence.cpp:282:     std::cout << "Validating..." << std::flush;
	adrp	x0, :got:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp277,
	ldr	x1, [x0, #:got_lo12:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp277,
	mov	x0, x2	//, _65
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax_WO_Fence.cpp:283:     int res = check_output(t_range);
	ldr	w0, [sp, 64]	// t_range.49_66, t_range
	bl	_Z12check_outputj		//
	str	w0, [sp, 68]	// _127, res
// LB_Relax_WO_Fence.cpp:286:     free(threads);
	ldr	x0, [sp, 96]	//, threads
	bl	free		//
// LB_Relax_WO_Fence.cpp:287:     free((void*)var);
	adrp	x0, var	// tmp279,
	add	x0, x0, :lo12:var	// tmp278, tmp279,
	ldr	x0, [x0]	// var.50_67, var
	bl	free		//
// LB_Relax_WO_Fence.cpp:288:     free((void*)cpu_res);
	adrp	x0, cpu_res	// tmp281,
	add	x0, x0, :lo12:cpu_res	// tmp280, tmp281,
	ldr	x0, [x0]	// cpu_res.51_68, cpu_res
	bl	free		//
// LB_Relax_WO_Fence.cpp:289:     free((void*)gpu_res);
	adrp	x0, gpu_res	// tmp283,
	add	x0, x0, :lo12:gpu_res	// tmp282, tmp283,
	ldr	x0, [x0]	// gpu_res.52_69, gpu_res
	bl	free		//
// LB_Relax_WO_Fence.cpp:290:     free((void*)cpu_rand);
	adrp	x0, cpu_rand	// tmp285,
	add	x0, x0, :lo12:cpu_rand	// tmp284, tmp285,
	ldr	x0, [x0]	// cpu_rand.53_70, cpu_rand
	bl	free		//
// LB_Relax_WO_Fence.cpp:291:     free((void*)gpu_rand);
	adrp	x0, gpu_rand	// tmp287,
	add	x0, x0, :lo12:gpu_rand	// tmp286, tmp287,
	ldr	x0, [x0]	// gpu_rand.54_71, gpu_rand
	bl	free		//
// LB_Relax_WO_Fence.cpp:293:     return 0;
	mov	w0, 0	// _135,
// LB_Relax_WO_Fence.cpp:294: }
	mov	w1, w0	// <retval>, _135
	adrp	x0, :got:__stack_chk_guard	// tmp290,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp289, tmp290,
	ldr	x3, [sp, 104]	// tmp292, D.48663
	ldr	x2, [x0]	// tmp293,
	subs	x3, x3, x2	// tmp292, tmp293
	mov	x2, 0	// tmp293
	beq	.L55		//,
	bl	__stack_chk_fail		//
.L55:
	mov	w0, w1	//, <retval>
	ldp	x29, x30, [sp], 112	//,,,
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
	stp	x29, x30, [sp, -32]!	//,,,
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	//,
	str	w0, [sp, 28]	// __initialize_p, __initialize_p
	str	w1, [sp, 24]	// __priority, __priority
// LB_Relax_WO_Fence.cpp:294: }
	ldr	w0, [sp, 28]	// tmp92, __initialize_p
	cmp	w0, 1	// tmp92,
	bne	.L58		//,
// LB_Relax_WO_Fence.cpp:294: }
	ldr	w1, [sp, 24]	// tmp93, __priority
	mov	w0, 65535	// tmp94,
	cmp	w1, w0	// tmp93, tmp94
	bne	.L58		//,
// /usr/aarch64-linux-gnu/include/c++/11/iostream:74:   static ios_base::Init __ioinit;
	adrp	x0, _ZStL8__ioinit	// tmp95,
	add	x0, x0, :lo12:_ZStL8__ioinit	//, tmp95,
	bl	_ZNSt8ios_base4InitC1Ev		//
	adrp	x0, __dso_handle	// tmp96,
	add	x2, x0, :lo12:__dso_handle	//, tmp96,
	adrp	x0, _ZStL8__ioinit	// tmp97,
	add	x1, x0, :lo12:_ZStL8__ioinit	//, tmp97,
	adrp	x0, :got:_ZNSt8ios_base4InitD1Ev	// tmp98,
	ldr	x0, [x0, #:got_lo12:_ZNSt8ios_base4InitD1Ev]	//, tmp98,
	bl	__cxa_atexit		//
.L58:
// LB_Relax_WO_Fence.cpp:294: }
	nop	
	ldp	x29, x30, [sp], 32	//,,,
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
	stp	x29, x30, [sp, -16]!	//,,,
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp	//,
// LB_Relax_WO_Fence.cpp:294: }
	mov	w1, 65535	//,
	mov	w0, 1	//,
	bl	_Z41__static_initialization_and_destruction_0ii		//
	ldp	x29, x30, [sp], 16	//,,,
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
