	.arch armv8-a
	.file	"IRIW_Relax_WO_Fence.cpp"
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
	ldr	w1, [sp, 12]	// __m.20_1, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	ldr	w0, [sp, 8]	// __mod.21_2, __mod
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	and	w0, w1, w0	// _3, __m.20_1, __mod.21_2
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
	stp	x29, x30, [sp, -48]!	//,,,
	.cfi_def_cfa_offset 48
	.cfi_offset 29, -48
	.cfi_offset 30, -40
	mov	x29, sp	//,
	str	w0, [sp, 28]	// max_cycles, max_cycles
// IRIW_Relax_WO_Fence.cpp:93:     if (rand() % 10 < 2) {
	bl	rand		//
	mov	w2, w0	// _1,
// IRIW_Relax_WO_Fence.cpp:93:     if (rand() % 10 < 2) {
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
// IRIW_Relax_WO_Fence.cpp:93:     if (rand() % 10 < 2) {
	cmp	w1, 1	// _2,
	cset	w0, le	// tmp118,
	and	w0, w0, 255	// retval.23_20, tmp117
// IRIW_Relax_WO_Fence.cpp:93:     if (rand() % 10 < 2) {
	cmp	w0, 0	// retval.23_20,
	beq	.L4		//,
// IRIW_Relax_WO_Fence.cpp:94:         delay = rand() % 5;
	bl	rand		//
	mov	w1, w0	// _3,
// IRIW_Relax_WO_Fence.cpp:94:         delay = rand() % 5;
	mov	w0, 26215	// tmp120,
	movk	w0, 0x6666, lsl 16	// tmp120,,
	smull	x0, w1, w0	// tmp119, _3, tmp120
	lsr	x0, x0, 32	// tmp121, tmp119,
	asr	w2, w0, 1	// tmp122, tmp121,
	asr	w0, w1, 31	// tmp123, _3,
	sub	w2, w2, w0	// tmp124, tmp122, tmp123
	mov	w0, w2	// tmp125, tmp124
	lsl	w0, w0, 2	// tmp126, tmp125,
	add	w0, w0, w2	// tmp125, tmp125, tmp124
	sub	w0, w1, w0	// tmp127, _3, tmp125
	str	w0, [sp, 44]	// tmp127, delay
	b	.L5		//
.L4:
// IRIW_Relax_WO_Fence.cpp:97:     else if (rand() % 10 < 1) {
	bl	rand		//
	mov	w2, w0	// _4,
// IRIW_Relax_WO_Fence.cpp:97:     else if (rand() % 10 < 1) {
	mov	w0, 26215	// tmp129,
	movk	w0, 0x6666, lsl 16	// tmp129,,
	smull	x0, w2, w0	// tmp128, _4, tmp129
	lsr	x0, x0, 32	// tmp130, tmp128,
	asr	w1, w0, 2	// tmp131, tmp130,
	asr	w0, w2, 31	// tmp132, _4,
	sub	w1, w1, w0	// _5, tmp131, tmp132
	mov	w0, w1	// tmp133, _5
	lsl	w0, w0, 2	// tmp134, tmp133,
	add	w0, w0, w1	// tmp133, tmp133, _5
	lsl	w0, w0, 1	// tmp135, tmp133,
	sub	w1, w2, w0	// _5, _4, tmp133
// IRIW_Relax_WO_Fence.cpp:97:     else if (rand() % 10 < 1) {
	cmp	w1, 0	// _5,
	cset	w0, le	// tmp137,
	and	w0, w0, 255	// retval.24_22, tmp136
// IRIW_Relax_WO_Fence.cpp:97:     else if (rand() % 10 < 1) {
	cmp	w0, 0	// retval.24_22,
	beq	.L6		//,
// IRIW_Relax_WO_Fence.cpp:98:         delay = rand() % (max_cycles * 2) + max_cycles;
	bl	rand		//
	mov	w1, w0	// _6,
// IRIW_Relax_WO_Fence.cpp:98:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w0, [sp, 28]	// tmp138, max_cycles
	lsl	w0, w0, 1	// _7, tmp138,
// IRIW_Relax_WO_Fence.cpp:98:         delay = rand() % (max_cycles * 2) + max_cycles;
	sdiv	w2, w1, w0	// tmp150, _6, _7
	mul	w0, w2, w0	// tmp151, tmp150, _7
	sub	w0, w1, w0	// _8, _6, tmp151
// IRIW_Relax_WO_Fence.cpp:98:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w1, [sp, 28]	// tmp153, max_cycles
	add	w0, w1, w0	// tmp152, tmp153, _8
	str	w0, [sp, 44]	// tmp152, delay
	b	.L5		//
.L6:
// IRIW_Relax_WO_Fence.cpp:102:         delay = rand() % max_cycles;
	bl	rand		//
// IRIW_Relax_WO_Fence.cpp:102:         delay = rand() % max_cycles;
	ldr	w1, [sp, 28]	// tmp168, max_cycles
	sdiv	w2, w0, w1	// tmp167, _9, tmp168
	ldr	w1, [sp, 28]	// tmp170, max_cycles
	mul	w1, w2, w1	// tmp169, tmp167, tmp170
	sub	w0, w0, w1	// tmp171, _9, tmp169
	str	w0, [sp, 44]	// tmp171, delay
.L5:
// IRIW_Relax_WO_Fence.cpp:105:     volatile int dummy = 0;
	str	wzr, [sp, 36]	//, dummy
// IRIW_Relax_WO_Fence.cpp:106:     for (volatile int i = 0; i < delay; i++) {
	str	wzr, [sp, 40]	//, i
// IRIW_Relax_WO_Fence.cpp:106:     for (volatile int i = 0; i < delay; i++) {
	b	.L7		//
.L8:
// IRIW_Relax_WO_Fence.cpp:107:         dummy++;
	ldr	w0, [sp, 36]	// dummy.25_10, dummy
	add	w0, w0, 1	// _11, dummy.25_10,
	str	w0, [sp, 36]	// _11, dummy
// IRIW_Relax_WO_Fence.cpp:106:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.26_12, i
	add	w0, w0, 1	// _13, i.26_12,
	str	w0, [sp, 40]	// _13, i
.L7:
// IRIW_Relax_WO_Fence.cpp:106:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.28_14, i
// IRIW_Relax_WO_Fence.cpp:106:     for (volatile int i = 0; i < delay; i++) {
	ldr	w1, [sp, 44]	// tmp173, delay
	cmp	w1, w0	// tmp173, i.28_14
	cset	w0, gt	// tmp174,
	and	w0, w0, 255	// retval.27_32, tmp172
	cmp	w0, 0	// retval.27_32,
	bne	.L8		//,
// IRIW_Relax_WO_Fence.cpp:109: }
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
	.global	_Z7runIRIWPv
	.type	_Z7runIRIWPv, %function
_Z7runIRIWPv:
.LFB1809:
	.cfi_startproc
	stp	x29, x30, [sp, -224]!	//,,,
	.cfi_def_cfa_offset 224
	.cfi_offset 29, -224
	.cfi_offset 30, -216
	mov	x29, sp	//,
	str	x0, [sp, 24]	// arg, arg
// IRIW_Relax_WO_Fence.cpp:114:     long long int tid = (long long int)arg;
	ldr	x0, [sp, 24]	// tmp194, arg
	str	x0, [sp, 120]	// tmp194, tid
// IRIW_Relax_WO_Fence.cpp:115:     local += tid;
	ldr	x0, [sp, 120]	// tmp195, tid
	mov	w1, w0	// _1, tmp195
	mrs	x0, tpidr_el0	// tmp197
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp196, tmp197,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp196,
	ldr	w0, [x0]	// local.0_2, local
	add	w0, w1, w0	// _4, _1, local.1_3
	mov	w1, w0	// _5, _4
	mrs	x0, tpidr_el0	// tmp199
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp198, tmp199,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp198,
	str	w1, [x0]	// _5, local
// IRIW_Relax_WO_Fence.cpp:116:     pthread_barrier_wait(&barrier);
	adrp	x0, barrier	// tmp200,
	add	x0, x0, :lo12:barrier	//, tmp200,
	bl	pthread_barrier_wait		//
// IRIW_Relax_WO_Fence.cpp:118:     if(tid / DEF_THREADS == 0)
	ldr	x0, [sp, 120]	// tid.2_6, tid
	add	x0, x0, 3	// _7, tid.2_6,
	cmp	x0, 6	// _7,
	bhi	.L10		//,
// IRIW_Relax_WO_Fence.cpp:121:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 120]	// tmp201, tid
	str	w0, [sp, 32]	// tmp202, i
// IRIW_Relax_WO_Fence.cpp:121:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	b	.L11		//
.L12:
// IRIW_Relax_WO_Fence.cpp:124:             var[i].a = 0;
	adrp	x0, var	// tmp204,
	add	x0, x0, :lo12:var	// tmp203, tmp204,
	ldr	x1, [x0]	// var.3_8, var
// IRIW_Relax_WO_Fence.cpp:124:             var[i].a = 0;
	ldrsw	x0, [sp, 32]	// _9, i
// IRIW_Relax_WO_Fence.cpp:124:             var[i].a = 0;
	lsl	x0, x0, 7	// _10, _9,
	add	x0, x1, x0	// _11, var.3_8, _10
// IRIW_Relax_WO_Fence.cpp:124:             var[i].a = 0;
	str	wzr, [x0]	//, _11->a
// IRIW_Relax_WO_Fence.cpp:125:             var[i].b = 0;
	adrp	x0, var	// tmp206,
	add	x0, x0, :lo12:var	// tmp205, tmp206,
	ldr	x1, [x0]	// var.4_12, var
// IRIW_Relax_WO_Fence.cpp:125:             var[i].b = 0;
	ldrsw	x0, [sp, 32]	// _13, i
// IRIW_Relax_WO_Fence.cpp:125:             var[i].b = 0;
	lsl	x0, x0, 7	// _14, _13,
	add	x0, x1, x0	// _15, var.4_12, _14
// IRIW_Relax_WO_Fence.cpp:125:             var[i].b = 0;
	str	wzr, [x0, 64]	//, _15->b
	mov	w0, 3	// tmp207,
	str	w0, [sp, 60]	// tmp207, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	dmb	ish	
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	nop	
// IRIW_Relax_WO_Fence.cpp:132:             random_delay(RAND_RANGE);
	mov	w0, 800	//,
	bl	_Z12random_delayi		//
// IRIW_Relax_WO_Fence.cpp:135:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp209,
	add	x0, x0, :lo12:var	// tmp208, tmp209,
	ldr	x1, [x0]	// var.5_16, var
// IRIW_Relax_WO_Fence.cpp:135:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 32]	// _17, i
// IRIW_Relax_WO_Fence.cpp:135:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _18, _17,
	add	x0, x1, x0	// _19, var.5_16, _18
// IRIW_Relax_WO_Fence.cpp:135:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 168]	// _19, tmp_a
// IRIW_Relax_WO_Fence.cpp:136:             tmp_a->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 168]	// _20, tmp_a
	str	x0, [sp, 176]	// _20, this
	mov	w0, 1	// tmp210,
	str	w0, [sp, 48]	// tmp210, __i
	str	wzr, [sp, 52]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 52]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 56]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 176]	// _124, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 48]	// __i.18_125, __i
	stlr	w1, [x0]	// __i.18_125,* _124
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// IRIW_Relax_WO_Fence.cpp:121:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 32]	// tmp212, i
	add	w0, w0, 4	// tmp211, tmp212,
	str	w0, [sp, 32]	// tmp211, i
.L11:
// IRIW_Relax_WO_Fence.cpp:121:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 32]	// tmp213, i
	mov	w0, 34463	// tmp214,
	movk	w0, 0x1, lsl 16	// tmp214,,
	cmp	w1, w0	// tmp213, tmp214
	ble	.L12		//,
	b	.L13		//
.L10:
// IRIW_Relax_WO_Fence.cpp:139:     else if (tid / DEF_THREADS == 1)
	ldr	x0, [sp, 120]	// tid.6_21, tid
	sub	x0, x0, #4	// _22, tid.6_21,
	cmp	x0, 3	// _22,
	bhi	.L14		//,
	mov	w0, 2	// tmp215,
	str	w0, [sp, 64]	// tmp215, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	dmb	ish	
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	nop	
// IRIW_Relax_WO_Fence.cpp:144:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 120]	// tmp216, tid
	negs	x1, x0	// tmp217, tmp216
	and	x0, x0, 3	// tmp218, tmp216,
	and	x1, x1, 3	// tmp219, tmp217,
	csneg	x0, x0, x1, mi	// _23, tmp218, tmp219,
// IRIW_Relax_WO_Fence.cpp:144:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 36]	// tmp220, i
// IRIW_Relax_WO_Fence.cpp:144:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L15		//
.L18:
// IRIW_Relax_WO_Fence.cpp:147:             random_delay(RAND_RANGE);
	mov	w0, 800	//,
	bl	_Z12random_delayi		//
// IRIW_Relax_WO_Fence.cpp:150:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp222,
	add	x0, x0, :lo12:var	// tmp221, tmp222,
	ldr	x1, [x0]	// var.7_24, var
// IRIW_Relax_WO_Fence.cpp:150:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 36]	// _25, i
// IRIW_Relax_WO_Fence.cpp:150:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _26, _25,
	add	x0, x1, x0	// _27, var.7_24, _26
// IRIW_Relax_WO_Fence.cpp:150:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 152]	// _27, tmp_a
// IRIW_Relax_WO_Fence.cpp:151:             (cpu_res0+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldr	x0, [sp, 152]	// _28, tmp_a
	str	x0, [sp, 192]	// _28, this
	str	wzr, [sp, 76]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 76]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 80]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 192]	// _141, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _143,* _141
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48766, _143
// IRIW_Relax_WO_Fence.cpp:151:             (cpu_res0+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	adrp	x0, cpu_res0	// tmp224,
	add	x0, x0, :lo12:cpu_res0	// tmp223, tmp224,
	ldr	x1, [x0]	// cpu_res0.8_30, cpu_res0
// IRIW_Relax_WO_Fence.cpp:151:             (cpu_res0+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 36]	// _31, i
// IRIW_Relax_WO_Fence.cpp:151:             (cpu_res0+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _32, _31,
	add	x0, x1, x0	// _33, cpu_res0.8_30, _32
// IRIW_Relax_WO_Fence.cpp:151:             (cpu_res0+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	mov	w1, w2	// _34, D.48766
// IRIW_Relax_WO_Fence.cpp:151:             (cpu_res0+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	str	w1, [x0]	// _34, _33->r0
// IRIW_Relax_WO_Fence.cpp:155:             random_delay(RAND_RANGE);
	mov	w0, 800	//,
	bl	_Z12random_delayi		//
// IRIW_Relax_WO_Fence.cpp:158:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp226,
	add	x0, x0, :lo12:var	// tmp225, tmp226,
	ldr	x1, [x0]	// var.9_35, var
// IRIW_Relax_WO_Fence.cpp:158:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 36]	// _36, i
// IRIW_Relax_WO_Fence.cpp:158:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _37, _36,
	add	x0, x1, x0	// _38, var.9_35, _37
// IRIW_Relax_WO_Fence.cpp:158:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp227, _38,
	str	x0, [sp, 160]	// tmp227, tmp_b
// IRIW_Relax_WO_Fence.cpp:159:             (gpu_res0+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldr	x0, [sp, 160]	// _39, tmp_b
	str	x0, [sp, 184]	// _39, this
	str	wzr, [sp, 68]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 68]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 72]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 184]	// _134, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _136,* _134
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48760, _136
// IRIW_Relax_WO_Fence.cpp:159:             (gpu_res0+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	adrp	x0, gpu_res0	// tmp229,
	add	x0, x0, :lo12:gpu_res0	// tmp228, tmp229,
	ldr	x1, [x0]	// gpu_res0.10_41, gpu_res0
// IRIW_Relax_WO_Fence.cpp:159:             (gpu_res0+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 36]	// _42, i
// IRIW_Relax_WO_Fence.cpp:159:             (gpu_res0+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _43, _42,
	add	x0, x1, x0	// _44, gpu_res0.10_41, _43
// IRIW_Relax_WO_Fence.cpp:159:             (gpu_res0+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	mov	w1, w2	// _45, D.48760
// IRIW_Relax_WO_Fence.cpp:159:             (gpu_res0+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	str	w1, [x0]	// _45, _44->r0
// IRIW_Relax_WO_Fence.cpp:144:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 36]	// tmp231, i
	add	w0, w0, 4	// tmp230, tmp231,
	str	w0, [sp, 36]	// tmp230, i
.L15:
// IRIW_Relax_WO_Fence.cpp:144:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 36]	// tmp232, i
	mov	w0, 34463	// tmp233,
	movk	w0, 0x1, lsl 16	// tmp233,,
	cmp	w1, w0	// tmp232, tmp233
	ble	.L18		//,
	b	.L13		//
.L14:
// IRIW_Relax_WO_Fence.cpp:163:     else if (tid / DEF_THREADS == 2)
	ldr	x0, [sp, 120]	// tid.11_46, tid
	sub	x0, x0, #8	// _47, tid.11_46,
	cmp	x0, 3	// _47,
	bhi	.L19		//,
// IRIW_Relax_WO_Fence.cpp:166:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 120]	// tmp234, tid
	negs	x1, x0	// tmp235, tmp234
	and	x0, x0, 3	// tmp236, tmp234,
	and	x1, x1, 3	// tmp237, tmp235,
	csneg	x0, x0, x1, mi	// _48, tmp236, tmp237,
// IRIW_Relax_WO_Fence.cpp:166:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 40]	// tmp238, i
// IRIW_Relax_WO_Fence.cpp:166:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L20		//
.L21:
	mov	w0, 3	// tmp239,
	str	w0, [sp, 96]	// tmp239, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	dmb	ish	
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	nop	
// IRIW_Relax_WO_Fence.cpp:171:             random_delay(RAND_RANGE);
	mov	w0, 800	//,
	bl	_Z12random_delayi		//
// IRIW_Relax_WO_Fence.cpp:174:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp241,
	add	x0, x0, :lo12:var	// tmp240, tmp241,
	ldr	x1, [x0]	// var.12_49, var
// IRIW_Relax_WO_Fence.cpp:174:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 40]	// _50, i
// IRIW_Relax_WO_Fence.cpp:174:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _51, _50,
	add	x0, x1, x0	// _52, var.12_49, _51
// IRIW_Relax_WO_Fence.cpp:174:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp242, _52,
	str	x0, [sp, 144]	// tmp242, tmp_b
// IRIW_Relax_WO_Fence.cpp:175:             tmp_b->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 144]	// _53, tmp_b
	str	x0, [sp, 200]	// _53, this
	mov	w0, 1	// tmp243,
	str	w0, [sp, 84]	// tmp243, __i
	str	wzr, [sp, 88]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 88]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 92]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 200]	// _149, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 84]	// __i.18_150, __i
	stlr	w1, [x0]	// __i.18_150,* _149
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// IRIW_Relax_WO_Fence.cpp:166:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 40]	// tmp245, i
	add	w0, w0, 4	// tmp244, tmp245,
	str	w0, [sp, 40]	// tmp244, i
.L20:
// IRIW_Relax_WO_Fence.cpp:166:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 40]	// tmp246, i
	mov	w0, 34463	// tmp247,
	movk	w0, 0x1, lsl 16	// tmp247,,
	cmp	w1, w0	// tmp246, tmp247
	ble	.L21		//,
	b	.L13		//
.L19:
	mov	w0, 2	// tmp248,
	str	w0, [sp, 100]	// tmp248, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	dmb	ish	
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:133:   { __atomic_thread_fence(int(__m)); }
	nop	
// IRIW_Relax_WO_Fence.cpp:183:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 120]	// tmp249, tid
	negs	x1, x0	// tmp250, tmp249
	and	x0, x0, 3	// tmp251, tmp249,
	and	x1, x1, 3	// tmp252, tmp250,
	csneg	x0, x0, x1, mi	// _54, tmp251, tmp252,
// IRIW_Relax_WO_Fence.cpp:183:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 44]	// tmp253, i
// IRIW_Relax_WO_Fence.cpp:183:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L22		//
.L25:
// IRIW_Relax_WO_Fence.cpp:186:             random_delay(RAND_RANGE);
	mov	w0, 800	//,
	bl	_Z12random_delayi		//
// IRIW_Relax_WO_Fence.cpp:189:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp255,
	add	x0, x0, :lo12:var	// tmp254, tmp255,
	ldr	x1, [x0]	// var.13_55, var
// IRIW_Relax_WO_Fence.cpp:189:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 44]	// _56, i
// IRIW_Relax_WO_Fence.cpp:189:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _57, _56,
	add	x0, x1, x0	// _58, var.13_55, _57
// IRIW_Relax_WO_Fence.cpp:189:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp256, _58,
	str	x0, [sp, 128]	// tmp256, tmp_b
// IRIW_Relax_WO_Fence.cpp:190:             (gpu_res1+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldr	x0, [sp, 128]	// _59, tmp_b
	str	x0, [sp, 216]	// _59, this
	str	wzr, [sp, 112]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 112]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 116]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 216]	// _166, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _168,* _166
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48784, _168
// IRIW_Relax_WO_Fence.cpp:190:             (gpu_res1+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	adrp	x0, gpu_res1	// tmp258,
	add	x0, x0, :lo12:gpu_res1	// tmp257, tmp258,
	ldr	x1, [x0]	// gpu_res1.14_61, gpu_res1
// IRIW_Relax_WO_Fence.cpp:190:             (gpu_res1+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 44]	// _62, i
// IRIW_Relax_WO_Fence.cpp:190:             (gpu_res1+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _63, _62,
	add	x0, x1, x0	// _64, gpu_res1.14_61, _63
// IRIW_Relax_WO_Fence.cpp:190:             (gpu_res1+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	mov	w1, w2	// _65, D.48784
// IRIW_Relax_WO_Fence.cpp:190:             (gpu_res1+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	str	w1, [x0]	// _65, _64->r0
// IRIW_Relax_WO_Fence.cpp:194:             random_delay(RAND_RANGE);
	mov	w0, 800	//,
	bl	_Z12random_delayi		//
// IRIW_Relax_WO_Fence.cpp:197:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp260,
	add	x0, x0, :lo12:var	// tmp259, tmp260,
	ldr	x1, [x0]	// var.15_66, var
// IRIW_Relax_WO_Fence.cpp:197:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 44]	// _67, i
// IRIW_Relax_WO_Fence.cpp:197:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _68, _67,
	add	x0, x1, x0	// _69, var.15_66, _68
// IRIW_Relax_WO_Fence.cpp:197:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 136]	// _69, tmp_a
// IRIW_Relax_WO_Fence.cpp:198:             (cpu_res1+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldr	x0, [sp, 136]	// _70, tmp_a
	str	x0, [sp, 208]	// _70, this
	str	wzr, [sp, 104]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 104]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 108]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 208]	// _159, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _161,* _159
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48778, _161
// IRIW_Relax_WO_Fence.cpp:198:             (cpu_res1+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	adrp	x0, cpu_res1	// tmp262,
	add	x0, x0, :lo12:cpu_res1	// tmp261, tmp262,
	ldr	x1, [x0]	// cpu_res1.16_72, cpu_res1
// IRIW_Relax_WO_Fence.cpp:198:             (cpu_res1+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 44]	// _73, i
// IRIW_Relax_WO_Fence.cpp:198:             (cpu_res1+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _74, _73,
	add	x0, x1, x0	// _75, cpu_res1.16_72, _74
// IRIW_Relax_WO_Fence.cpp:198:             (cpu_res1+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	mov	w1, w2	// _76, D.48778
// IRIW_Relax_WO_Fence.cpp:198:             (cpu_res1+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	str	w1, [x0]	// _76, _75->r0
// IRIW_Relax_WO_Fence.cpp:183:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 44]	// tmp264, i
	add	w0, w0, 4	// tmp263, tmp264,
	str	w0, [sp, 44]	// tmp263, i
.L22:
// IRIW_Relax_WO_Fence.cpp:183:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 44]	// tmp265, i
	mov	w0, 34463	// tmp266,
	movk	w0, 0x1, lsl 16	// tmp266,,
	cmp	w1, w0	// tmp265, tmp266
	ble	.L25		//,
.L13:
// IRIW_Relax_WO_Fence.cpp:203:     return (void*)local;
	mrs	x0, tpidr_el0	// tmp268
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp267, tmp268,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp267,
	ldr	w0, [x0]	// local.17_77, local
	sxtw	x0, w0	// _78, local.17_77
// IRIW_Relax_WO_Fence.cpp:204: }
	ldp	x29, x30, [sp], 224	//,,,
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
	stp	x29, x30, [sp, -80]!	//,,,
	.cfi_def_cfa_offset 80
	.cfi_offset 29, -80
	.cfi_offset 30, -72
	mov	x29, sp	//,
	str	w0, [sp, 28]	// t_range, t_range
// IRIW_Relax_WO_Fence.cpp:209:     unsigned res_cpu0_gpu0 = 0;  // Thread 1: a=0, b=0
	str	wzr, [sp, 32]	//, res_cpu0_gpu0
// IRIW_Relax_WO_Fence.cpp:210:     unsigned res_cpu1_gpu0 = 0;  // Thread 1: a=1, b=0
	str	wzr, [sp, 36]	//, res_cpu1_gpu0
// IRIW_Relax_WO_Fence.cpp:211:     unsigned res_cpu0_gpu1 = 0;  // Thread 1: a=0, b=1
	str	wzr, [sp, 40]	//, res_cpu0_gpu1
// IRIW_Relax_WO_Fence.cpp:212:     unsigned res_cpu1_gpu1 = 0;  // Thread 1: a=1, b=1
	str	wzr, [sp, 44]	//, res_cpu1_gpu1
// IRIW_Relax_WO_Fence.cpp:213:     unsigned res_cpu2_gpu2 = 0;  // Thread 1: other (initialized)
	str	wzr, [sp, 48]	//, res_cpu2_gpu2
// IRIW_Relax_WO_Fence.cpp:215:     unsigned rst_cpu0_gpu0 = 0;  // Thread 3: a=0, b=0
	str	wzr, [sp, 52]	//, rst_cpu0_gpu0
// IRIW_Relax_WO_Fence.cpp:216:     unsigned rst_cpu1_gpu0 = 0;  // Thread 3: a=1, b=0
	str	wzr, [sp, 56]	//, rst_cpu1_gpu0
// IRIW_Relax_WO_Fence.cpp:217:     unsigned rst_cpu0_gpu1 = 0;  // Thread 3: a=0, b=1
	str	wzr, [sp, 60]	//, rst_cpu0_gpu1
// IRIW_Relax_WO_Fence.cpp:218:     unsigned rst_cpu1_gpu1 = 0;  // Thread 3: a=1, b=1
	str	wzr, [sp, 64]	//, rst_cpu1_gpu1
// IRIW_Relax_WO_Fence.cpp:219:     unsigned rst_cpu2_gpu2 = 0;  // Thread 3: other (initialized)
	str	wzr, [sp, 68]	//, rst_cpu2_gpu2
// IRIW_Relax_WO_Fence.cpp:222:     int forbidden_outcomes = 0;
	str	wzr, [sp, 72]	//, forbidden_outcomes
// IRIW_Relax_WO_Fence.cpp:224:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 76]	//, i
// IRIW_Relax_WO_Fence.cpp:224:     for (auto i = 0; i < t_range; ++i) {
	b	.L28		//
.L58:
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, cpu_res0	// tmp308,
	add	x0, x0, :lo12:cpu_res0	// tmp307, tmp308,
	ldr	x1, [x0]	// cpu_res0.32_1, cpu_res0
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _2, i
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 6	// _3, _2,
	add	x0, x1, x0	// _4, cpu_res0.32_1, _3
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _5, _4->r0
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// _5,
	bne	.L29		//,
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, gpu_res0	// tmp310,
	add	x0, x0, :lo12:gpu_res0	// tmp309, tmp310,
	ldr	x1, [x0]	// gpu_res0.33_6, gpu_res0
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _7, i
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 6	// _8, _7,
	add	x0, x1, x0	// _9, gpu_res0.33_6, _8
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _10, _9->r0
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// _10,
	bne	.L29		//,
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 1	// iftmp.31_228,
	b	.L30		//
.L29:
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 0	// iftmp.31_228,
.L30:
// IRIW_Relax_WO_Fence.cpp:226:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.31_228,
	beq	.L31		//,
// IRIW_Relax_WO_Fence.cpp:227:             res_cpu0_gpu0++;
	ldr	w0, [sp, 32]	// tmp312, res_cpu0_gpu0
	add	w0, w0, 1	// tmp311, tmp312,
	str	w0, [sp, 32]	// tmp311, res_cpu0_gpu0
	b	.L32		//
.L31:
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, cpu_res0	// tmp314,
	add	x0, x0, :lo12:cpu_res0	// tmp313, tmp314,
	ldr	x1, [x0]	// cpu_res0.36_11, cpu_res0
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _12, i
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 6	// _13, _12,
	add	x0, x1, x0	// _14, cpu_res0.36_11, _13
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _15, _14->r0
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 1	// _15,
	bne	.L33		//,
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, gpu_res0	// tmp316,
	add	x0, x0, :lo12:gpu_res0	// tmp315, tmp316,
	ldr	x1, [x0]	// gpu_res0.37_16, gpu_res0
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _17, i
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 6	// _18, _17,
	add	x0, x1, x0	// _19, gpu_res0.37_16, _18
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _20, _19->r0
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// _20,
	bne	.L33		//,
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 1	// iftmp.35_229,
	b	.L34		//
.L33:
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 0	// iftmp.35_229,
.L34:
// IRIW_Relax_WO_Fence.cpp:228:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.35_229,
	beq	.L35		//,
// IRIW_Relax_WO_Fence.cpp:229:             res_cpu1_gpu0++;
	ldr	w0, [sp, 36]	// tmp318, res_cpu1_gpu0
	add	w0, w0, 1	// tmp317, tmp318,
	str	w0, [sp, 36]	// tmp317, res_cpu1_gpu0
	b	.L32		//
.L35:
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, cpu_res0	// tmp320,
	add	x0, x0, :lo12:cpu_res0	// tmp319, tmp320,
	ldr	x1, [x0]	// cpu_res0.40_21, cpu_res0
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _22, i
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 6	// _23, _22,
	add	x0, x1, x0	// _24, cpu_res0.40_21, _23
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _25, _24->r0
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 0	// _25,
	bne	.L36		//,
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, gpu_res0	// tmp322,
	add	x0, x0, :lo12:gpu_res0	// tmp321, tmp322,
	ldr	x1, [x0]	// gpu_res0.41_26, gpu_res0
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _27, i
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 6	// _28, _27,
	add	x0, x1, x0	// _29, gpu_res0.41_26, _28
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _30, _29->r0
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 1	// _30,
	bne	.L36		//,
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 1	// iftmp.39_230,
	b	.L37		//
.L36:
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 0	// iftmp.39_230,
.L37:
// IRIW_Relax_WO_Fence.cpp:230:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.39_230,
	beq	.L38		//,
// IRIW_Relax_WO_Fence.cpp:231:             res_cpu0_gpu1++;
	ldr	w0, [sp, 40]	// tmp324, res_cpu0_gpu1
	add	w0, w0, 1	// tmp323, tmp324,
	str	w0, [sp, 40]	// tmp323, res_cpu0_gpu1
	b	.L32		//
.L38:
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, cpu_res0	// tmp326,
	add	x0, x0, :lo12:cpu_res0	// tmp325, tmp326,
	ldr	x1, [x0]	// cpu_res0.44_31, cpu_res0
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _32, i
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 6	// _33, _32,
	add	x0, x1, x0	// _34, cpu_res0.44_31, _33
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _35, _34->r0
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 1	// _35,
	bne	.L39		//,
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, gpu_res0	// tmp328,
	add	x0, x0, :lo12:gpu_res0	// tmp327, tmp328,
	ldr	x1, [x0]	// gpu_res0.45_36, gpu_res0
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _37, i
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 6	// _38, _37,
	add	x0, x1, x0	// _39, gpu_res0.45_36, _38
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _40, _39->r0
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 1	// _40,
	bne	.L39		//,
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 1	// iftmp.43_231,
	b	.L40		//
.L39:
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 0	// iftmp.43_231,
.L40:
// IRIW_Relax_WO_Fence.cpp:232:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.43_231,
	beq	.L41		//,
// IRIW_Relax_WO_Fence.cpp:233:             res_cpu1_gpu1++;
	ldr	w0, [sp, 44]	// tmp330, res_cpu1_gpu1
	add	w0, w0, 1	// tmp329, tmp330,
	str	w0, [sp, 44]	// tmp329, res_cpu1_gpu1
	b	.L32		//
.L41:
// IRIW_Relax_WO_Fence.cpp:235:             res_cpu2_gpu2++;
	ldr	w0, [sp, 48]	// tmp332, res_cpu2_gpu2
	add	w0, w0, 1	// tmp331, tmp332,
	str	w0, [sp, 48]	// tmp331, res_cpu2_gpu2
.L32:
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, cpu_res1	// tmp334,
	add	x0, x0, :lo12:cpu_res1	// tmp333, tmp334,
	ldr	x1, [x0]	// cpu_res1.48_41, cpu_res1
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _42, i
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 6	// _43, _42,
	add	x0, x1, x0	// _44, cpu_res1.48_41, _43
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _45, _44->r0
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// _45,
	bne	.L42		//,
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, gpu_res1	// tmp336,
	add	x0, x0, :lo12:gpu_res1	// tmp335, tmp336,
	ldr	x1, [x0]	// gpu_res1.49_46, gpu_res1
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _47, i
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 6	// _48, _47,
	add	x0, x1, x0	// _49, gpu_res1.49_46, _48
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _50, _49->r0
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// _50,
	bne	.L42		//,
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 1	// iftmp.47_232,
	b	.L43		//
.L42:
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 0	// iftmp.47_232,
.L43:
// IRIW_Relax_WO_Fence.cpp:239:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.47_232,
	beq	.L44		//,
// IRIW_Relax_WO_Fence.cpp:240:             rst_cpu0_gpu0++;
	ldr	w0, [sp, 52]	// tmp338, rst_cpu0_gpu0
	add	w0, w0, 1	// tmp337, tmp338,
	str	w0, [sp, 52]	// tmp337, rst_cpu0_gpu0
	b	.L45		//
.L44:
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, cpu_res1	// tmp340,
	add	x0, x0, :lo12:cpu_res1	// tmp339, tmp340,
	ldr	x1, [x0]	// cpu_res1.52_51, cpu_res1
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _52, i
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 6	// _53, _52,
	add	x0, x1, x0	// _54, cpu_res1.52_51, _53
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _55, _54->r0
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 1	// _55,
	bne	.L46		//,
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, gpu_res1	// tmp342,
	add	x0, x0, :lo12:gpu_res1	// tmp341, tmp342,
	ldr	x1, [x0]	// gpu_res1.53_56, gpu_res1
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 76]	// _57, i
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 6	// _58, _57,
	add	x0, x1, x0	// _59, gpu_res1.53_56, _58
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _60, _59->r0
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// _60,
	bne	.L46		//,
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 1	// iftmp.51_233,
	b	.L47		//
.L46:
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 0	// iftmp.51_233,
.L47:
// IRIW_Relax_WO_Fence.cpp:241:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.51_233,
	beq	.L48		//,
// IRIW_Relax_WO_Fence.cpp:242:             rst_cpu1_gpu0++;
	ldr	w0, [sp, 56]	// tmp344, rst_cpu1_gpu0
	add	w0, w0, 1	// tmp343, tmp344,
	str	w0, [sp, 56]	// tmp343, rst_cpu1_gpu0
	b	.L45		//
.L48:
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, cpu_res1	// tmp346,
	add	x0, x0, :lo12:cpu_res1	// tmp345, tmp346,
	ldr	x1, [x0]	// cpu_res1.56_61, cpu_res1
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _62, i
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 6	// _63, _62,
	add	x0, x1, x0	// _64, cpu_res1.56_61, _63
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _65, _64->r0
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// _65,
	bne	.L49		//,
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, gpu_res1	// tmp348,
	add	x0, x0, :lo12:gpu_res1	// tmp347, tmp348,
	ldr	x1, [x0]	// gpu_res1.57_66, gpu_res1
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _67, i
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 6	// _68, _67,
	add	x0, x1, x0	// _69, gpu_res1.57_66, _68
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _70, _69->r0
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _70,
	bne	.L49		//,
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 1	// iftmp.55_234,
	b	.L50		//
.L49:
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 0	// iftmp.55_234,
.L50:
// IRIW_Relax_WO_Fence.cpp:243:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.55_234,
	beq	.L51		//,
// IRIW_Relax_WO_Fence.cpp:244:             rst_cpu0_gpu1++;
	ldr	w0, [sp, 60]	// tmp350, rst_cpu0_gpu1
	add	w0, w0, 1	// tmp349, tmp350,
	str	w0, [sp, 60]	// tmp349, rst_cpu0_gpu1
	b	.L45		//
.L51:
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, cpu_res1	// tmp352,
	add	x0, x0, :lo12:cpu_res1	// tmp351, tmp352,
	ldr	x1, [x0]	// cpu_res1.60_71, cpu_res1
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _72, i
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 6	// _73, _72,
	add	x0, x1, x0	// _74, cpu_res1.60_71, _73
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _75, _74->r0
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _75,
	bne	.L52		//,
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, gpu_res1	// tmp354,
	add	x0, x0, :lo12:gpu_res1	// tmp353, tmp354,
	ldr	x1, [x0]	// gpu_res1.61_76, gpu_res1
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _77, i
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 6	// _78, _77,
	add	x0, x1, x0	// _79, gpu_res1.61_76, _78
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _80, _79->r0
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _80,
	bne	.L52		//,
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 1	// iftmp.59_235,
	b	.L53		//
.L52:
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 0	// iftmp.59_235,
.L53:
// IRIW_Relax_WO_Fence.cpp:245:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.59_235,
	beq	.L54		//,
// IRIW_Relax_WO_Fence.cpp:246:             rst_cpu1_gpu1++;
	ldr	w0, [sp, 64]	// tmp356, rst_cpu1_gpu1
	add	w0, w0, 1	// tmp355, tmp356,
	str	w0, [sp, 64]	// tmp355, rst_cpu1_gpu1
	b	.L45		//
.L54:
// IRIW_Relax_WO_Fence.cpp:248:             rst_cpu2_gpu2++;
	ldr	w0, [sp, 68]	// tmp358, rst_cpu2_gpu2
	add	w0, w0, 1	// tmp357, tmp358,
	str	w0, [sp, 68]	// tmp357, rst_cpu2_gpu2
.L45:
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	adrp	x0, cpu_res0	// tmp360,
	add	x0, x0, :lo12:cpu_res0	// tmp359, tmp360,
	ldr	x1, [x0]	// cpu_res0.64_81, cpu_res0
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	ldrsw	x0, [sp, 76]	// _82, i
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	lsl	x0, x0, 6	// _83, _82,
	add	x0, x1, x0	// _84, cpu_res0.64_81, _83
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	ldr	w0, [x0]	// _85, _84->r0
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _85,
	bne	.L55		//,
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	adrp	x0, gpu_res0	// tmp362,
	add	x0, x0, :lo12:gpu_res0	// tmp361, tmp362,
	ldr	x1, [x0]	// gpu_res0.65_86, gpu_res0
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	ldrsw	x0, [sp, 76]	// _87, i
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	lsl	x0, x0, 6	// _88, _87,
	add	x0, x1, x0	// _89, gpu_res0.65_86, _88
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	ldr	w0, [x0]	// _90, _89->r0
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	cmp	w0, 0	// _90,
	bne	.L55		//,
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, cpu_res1	// tmp364,
	add	x0, x0, :lo12:cpu_res1	// tmp363, tmp364,
	ldr	x1, [x0]	// cpu_res1.66_91, cpu_res1
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _92, i
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 6	// _93, _92,
	add	x0, x1, x0	// _94, cpu_res1.66_91, _93
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _95, _94->r0
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	cmp	w0, 0	// _95,
	bne	.L55		//,
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, gpu_res1	// tmp366,
	add	x0, x0, :lo12:gpu_res1	// tmp365, tmp366,
	ldr	x1, [x0]	// gpu_res1.67_96, gpu_res1
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 76]	// _97, i
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 6	// _98, _97,
	add	x0, x1, x0	// _99, gpu_res1.67_96, _98
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _100, _99->r0
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _100,
	bne	.L55		//,
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 1	// iftmp.63_236,
	b	.L56		//
.L55:
// IRIW_Relax_WO_Fence.cpp:255:             (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 0	// iftmp.63_236,
.L56:
// IRIW_Relax_WO_Fence.cpp:254:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
	cmp	w0, 0	// iftmp.63_236,
	beq	.L57		//,
// IRIW_Relax_WO_Fence.cpp:256:             forbidden_outcomes++;
	ldr	w0, [sp, 72]	// tmp368, forbidden_outcomes
	add	w0, w0, 1	// tmp367, tmp368,
	str	w0, [sp, 72]	// tmp367, forbidden_outcomes
.L57:
// IRIW_Relax_WO_Fence.cpp:224:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 76]	// tmp370, i
	add	w0, w0, 1	// tmp369, tmp370,
	str	w0, [sp, 76]	// tmp369, i
.L28:
// IRIW_Relax_WO_Fence.cpp:224:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 76]	// i.68_101, i
// IRIW_Relax_WO_Fence.cpp:224:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 28]	// tmp371, t_range
	cmp	w1, w0	// tmp371, i.68_101
	bhi	.L58		//,
// IRIW_Relax_WO_Fence.cpp:261:     std::cout << "\nIndependent Reads of Independent Writes (IRIW) Litmus Test Results:" << std::endl;
	adrp	x0, .LC0	// tmp372,
	add	x1, x0, :lo12:.LC0	//, tmp372,
	adrp	x0, :got:_ZSt4cout	// tmp373,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp373,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _102,
// IRIW_Relax_WO_Fence.cpp:261:     std::cout << "\nIndependent Reads of Independent Writes (IRIW) Litmus Test Results:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp374,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp374,
	mov	x0, x2	//, _102
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:262:     std::cout << "------------------------------------------------------------------" << std::endl;
	adrp	x0, .LC1	// tmp375,
	add	x1, x0, :lo12:.LC1	//, tmp375,
	adrp	x0, :got:_ZSt4cout	// tmp376,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp376,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _103,
// IRIW_Relax_WO_Fence.cpp:262:     std::cout << "------------------------------------------------------------------" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp377,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp377,
	mov	x0, x2	//, _103
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:263:     std::cout << "Thread 1 (Read a, then Read b) Observations:" << std::endl;
	adrp	x0, .LC2	// tmp378,
	add	x1, x0, :lo12:.LC2	//, tmp378,
	adrp	x0, :got:_ZSt4cout	// tmp379,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp379,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _104,
// IRIW_Relax_WO_Fence.cpp:263:     std::cout << "Thread 1 (Read a, then Read b) Observations:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp380,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp380,
	mov	x0, x2	//, _104
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:264:     std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp381,
	add	x1, x0, :lo12:.LC3	//, tmp381,
	adrp	x0, :got:_ZSt4cout	// tmp382,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp382,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:264:     std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 32]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _106,
// IRIW_Relax_WO_Fence.cpp:264:     std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp383,
	add	x1, x0, :lo12:.LC4	//, tmp383,
	mov	x0, x2	//, _106
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _107,
// IRIW_Relax_WO_Fence.cpp:264:     std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 32]	// tmp384, res_cpu0_gpu0
	ucvtf	d0, w0	// _108, tmp384
	mov	x0, 4636737291354636288	// tmp498,
	fmov	d1, x0	// tmp385, tmp498
	fmul	d1, d0, d1	// _109, _108, tmp385
// IRIW_Relax_WO_Fence.cpp:264:     std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp386, t_range
	ucvtf	d0, w0	// _110, tmp386
	fdiv	d0, d1, d0	// _111, _109, _110
	mov	x0, x1	//, _107
	bl	_ZNSolsEd		//
	mov	x2, x0	// _112,
// IRIW_Relax_WO_Fence.cpp:264:     std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp387,
	add	x1, x0, :lo12:.LC5	//, tmp387,
	mov	x0, x2	//, _112
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _113,
// IRIW_Relax_WO_Fence.cpp:264:     std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp388,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp388,
	mov	x0, x2	//, _113
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:265:     std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC6	// tmp389,
	add	x1, x0, :lo12:.LC6	//, tmp389,
	adrp	x0, :got:_ZSt4cout	// tmp390,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp390,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:265:     std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 36]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _115,
// IRIW_Relax_WO_Fence.cpp:265:     std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp391,
	add	x1, x0, :lo12:.LC4	//, tmp391,
	mov	x0, x2	//, _115
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _116,
// IRIW_Relax_WO_Fence.cpp:265:     std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 36]	// tmp392, res_cpu1_gpu0
	ucvtf	d0, w0	// _117, tmp392
	mov	x0, 4636737291354636288	// tmp499,
	fmov	d1, x0	// tmp393, tmp499
	fmul	d1, d0, d1	// _118, _117, tmp393
// IRIW_Relax_WO_Fence.cpp:265:     std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp394, t_range
	ucvtf	d0, w0	// _119, tmp394
	fdiv	d0, d1, d0	// _120, _118, _119
	mov	x0, x1	//, _116
	bl	_ZNSolsEd		//
	mov	x2, x0	// _121,
// IRIW_Relax_WO_Fence.cpp:265:     std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp395,
	add	x1, x0, :lo12:.LC5	//, tmp395,
	mov	x0, x2	//, _121
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _122,
// IRIW_Relax_WO_Fence.cpp:265:     std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp396,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp396,
	mov	x0, x2	//, _122
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:266:     std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC7	// tmp397,
	add	x1, x0, :lo12:.LC7	//, tmp397,
	adrp	x0, :got:_ZSt4cout	// tmp398,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp398,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:266:     std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 40]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _124,
// IRIW_Relax_WO_Fence.cpp:266:     std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp399,
	add	x1, x0, :lo12:.LC4	//, tmp399,
	mov	x0, x2	//, _124
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _125,
// IRIW_Relax_WO_Fence.cpp:266:     std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 40]	// tmp400, res_cpu0_gpu1
	ucvtf	d0, w0	// _126, tmp400
	mov	x0, 4636737291354636288	// tmp500,
	fmov	d1, x0	// tmp401, tmp500
	fmul	d1, d0, d1	// _127, _126, tmp401
// IRIW_Relax_WO_Fence.cpp:266:     std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp402, t_range
	ucvtf	d0, w0	// _128, tmp402
	fdiv	d0, d1, d0	// _129, _127, _128
	mov	x0, x1	//, _125
	bl	_ZNSolsEd		//
	mov	x2, x0	// _130,
// IRIW_Relax_WO_Fence.cpp:266:     std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp403,
	add	x1, x0, :lo12:.LC5	//, tmp403,
	mov	x0, x2	//, _130
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _131,
// IRIW_Relax_WO_Fence.cpp:266:     std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp404,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp404,
	mov	x0, x2	//, _131
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:267:     std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC8	// tmp405,
	add	x1, x0, :lo12:.LC8	//, tmp405,
	adrp	x0, :got:_ZSt4cout	// tmp406,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp406,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:267:     std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _133,
// IRIW_Relax_WO_Fence.cpp:267:     std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp407,
	add	x1, x0, :lo12:.LC4	//, tmp407,
	mov	x0, x2	//, _133
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _134,
// IRIW_Relax_WO_Fence.cpp:267:     std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 44]	// tmp408, res_cpu1_gpu1
	ucvtf	d0, w0	// _135, tmp408
	mov	x0, 4636737291354636288	// tmp501,
	fmov	d1, x0	// tmp409, tmp501
	fmul	d1, d0, d1	// _136, _135, tmp409
// IRIW_Relax_WO_Fence.cpp:267:     std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp410, t_range
	ucvtf	d0, w0	// _137, tmp410
	fdiv	d0, d1, d0	// _138, _136, _137
	mov	x0, x1	//, _134
	bl	_ZNSolsEd		//
	mov	x2, x0	// _139,
// IRIW_Relax_WO_Fence.cpp:267:     std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp411,
	add	x1, x0, :lo12:.LC5	//, tmp411,
	mov	x0, x2	//, _139
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _140,
// IRIW_Relax_WO_Fence.cpp:267:     std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp412,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp412,
	mov	x0, x2	//, _140
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:268:     std::cout << "  Other: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, .LC9	// tmp413,
	add	x1, x0, :lo12:.LC9	//, tmp413,
	adrp	x0, :got:_ZSt4cout	// tmp414,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp414,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:268:     std::cout << "  Other: " << res_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _142,
// IRIW_Relax_WO_Fence.cpp:268:     std::cout << "  Other: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp415,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp415,
	mov	x0, x2	//, _142
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:270:     std::cout << "\nThread 3 (Read b, then Read a) Observations:" << std::endl;
	adrp	x0, .LC10	// tmp416,
	add	x1, x0, :lo12:.LC10	//, tmp416,
	adrp	x0, :got:_ZSt4cout	// tmp417,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp417,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _143,
// IRIW_Relax_WO_Fence.cpp:270:     std::cout << "\nThread 3 (Read b, then Read a) Observations:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp418,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp418,
	mov	x0, x2	//, _143
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:271:     std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp419,
	add	x1, x0, :lo12:.LC3	//, tmp419,
	adrp	x0, :got:_ZSt4cout	// tmp420,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp420,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:271:     std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 52]	//, rst_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _145,
// IRIW_Relax_WO_Fence.cpp:271:     std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp421,
	add	x1, x0, :lo12:.LC4	//, tmp421,
	mov	x0, x2	//, _145
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _146,
// IRIW_Relax_WO_Fence.cpp:271:     std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 52]	// tmp422, rst_cpu0_gpu0
	ucvtf	d0, w0	// _147, tmp422
	mov	x0, 4636737291354636288	// tmp502,
	fmov	d1, x0	// tmp423, tmp502
	fmul	d1, d0, d1	// _148, _147, tmp423
// IRIW_Relax_WO_Fence.cpp:271:     std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp424, t_range
	ucvtf	d0, w0	// _149, tmp424
	fdiv	d0, d1, d0	// _150, _148, _149
	mov	x0, x1	//, _146
	bl	_ZNSolsEd		//
	mov	x2, x0	// _151,
// IRIW_Relax_WO_Fence.cpp:271:     std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp425,
	add	x1, x0, :lo12:.LC5	//, tmp425,
	mov	x0, x2	//, _151
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _152,
// IRIW_Relax_WO_Fence.cpp:271:     std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp426,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp426,
	mov	x0, x2	//, _152
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:272:     std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC6	// tmp427,
	add	x1, x0, :lo12:.LC6	//, tmp427,
	adrp	x0, :got:_ZSt4cout	// tmp428,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp428,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:272:     std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 56]	//, rst_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _154,
// IRIW_Relax_WO_Fence.cpp:272:     std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp429,
	add	x1, x0, :lo12:.LC4	//, tmp429,
	mov	x0, x2	//, _154
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _155,
// IRIW_Relax_WO_Fence.cpp:272:     std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 56]	// tmp430, rst_cpu1_gpu0
	ucvtf	d0, w0	// _156, tmp430
	mov	x0, 4636737291354636288	// tmp503,
	fmov	d1, x0	// tmp431, tmp503
	fmul	d1, d0, d1	// _157, _156, tmp431
// IRIW_Relax_WO_Fence.cpp:272:     std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp432, t_range
	ucvtf	d0, w0	// _158, tmp432
	fdiv	d0, d1, d0	// _159, _157, _158
	mov	x0, x1	//, _155
	bl	_ZNSolsEd		//
	mov	x2, x0	// _160,
// IRIW_Relax_WO_Fence.cpp:272:     std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp433,
	add	x1, x0, :lo12:.LC5	//, tmp433,
	mov	x0, x2	//, _160
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _161,
// IRIW_Relax_WO_Fence.cpp:272:     std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp434,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp434,
	mov	x0, x2	//, _161
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:273:     std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC7	// tmp435,
	add	x1, x0, :lo12:.LC7	//, tmp435,
	adrp	x0, :got:_ZSt4cout	// tmp436,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp436,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:273:     std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 60]	//, rst_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _163,
// IRIW_Relax_WO_Fence.cpp:273:     std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp437,
	add	x1, x0, :lo12:.LC4	//, tmp437,
	mov	x0, x2	//, _163
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _164,
// IRIW_Relax_WO_Fence.cpp:273:     std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 60]	// tmp438, rst_cpu0_gpu1
	ucvtf	d0, w0	// _165, tmp438
	mov	x0, 4636737291354636288	// tmp504,
	fmov	d1, x0	// tmp439, tmp504
	fmul	d1, d0, d1	// _166, _165, tmp439
// IRIW_Relax_WO_Fence.cpp:273:     std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp440, t_range
	ucvtf	d0, w0	// _167, tmp440
	fdiv	d0, d1, d0	// _168, _166, _167
	mov	x0, x1	//, _164
	bl	_ZNSolsEd		//
	mov	x2, x0	// _169,
// IRIW_Relax_WO_Fence.cpp:273:     std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp441,
	add	x1, x0, :lo12:.LC5	//, tmp441,
	mov	x0, x2	//, _169
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _170,
// IRIW_Relax_WO_Fence.cpp:273:     std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp442,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp442,
	mov	x0, x2	//, _170
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:274:     std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC8	// tmp443,
	add	x1, x0, :lo12:.LC8	//, tmp443,
	adrp	x0, :got:_ZSt4cout	// tmp444,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp444,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:274:     std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 64]	//, rst_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _172,
// IRIW_Relax_WO_Fence.cpp:274:     std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp445,
	add	x1, x0, :lo12:.LC4	//, tmp445,
	mov	x0, x2	//, _172
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _173,
// IRIW_Relax_WO_Fence.cpp:274:     std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 64]	// tmp446, rst_cpu1_gpu1
	ucvtf	d0, w0	// _174, tmp446
	mov	x0, 4636737291354636288	// tmp505,
	fmov	d1, x0	// tmp447, tmp505
	fmul	d1, d0, d1	// _175, _174, tmp447
// IRIW_Relax_WO_Fence.cpp:274:     std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp448, t_range
	ucvtf	d0, w0	// _176, tmp448
	fdiv	d0, d1, d0	// _177, _175, _176
	mov	x0, x1	//, _173
	bl	_ZNSolsEd		//
	mov	x2, x0	// _178,
// IRIW_Relax_WO_Fence.cpp:274:     std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp449,
	add	x1, x0, :lo12:.LC5	//, tmp449,
	mov	x0, x2	//, _178
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _179,
// IRIW_Relax_WO_Fence.cpp:274:     std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp450,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp450,
	mov	x0, x2	//, _179
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:275:     std::cout << "  Other: " << rst_cpu2_gpu2 << std::endl;
	adrp	x0, .LC9	// tmp451,
	add	x1, x0, :lo12:.LC9	//, tmp451,
	adrp	x0, :got:_ZSt4cout	// tmp452,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp452,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:275:     std::cout << "  Other: " << rst_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 68]	//, rst_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _181,
// IRIW_Relax_WO_Fence.cpp:275:     std::cout << "  Other: " << rst_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp453,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp453,
	mov	x0, x2	//, _181
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:278:     std::cout << "\nForbidden Outcome Analysis:" << std::endl;
	adrp	x0, .LC11	// tmp454,
	add	x1, x0, :lo12:.LC11	//, tmp454,
	adrp	x0, :got:_ZSt4cout	// tmp455,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp455,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _182,
// IRIW_Relax_WO_Fence.cpp:278:     std::cout << "\nForbidden Outcome Analysis:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp456,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp456,
	mov	x0, x2	//, _182
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:279:     std::cout << "  Iterations: " << t_range << std::endl;
	adrp	x0, .LC12	// tmp457,
	add	x1, x0, :lo12:.LC12	//, tmp457,
	adrp	x0, :got:_ZSt4cout	// tmp458,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp458,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:279:     std::cout << "  Iterations: " << t_range << std::endl;
	ldr	w1, [sp, 28]	//, t_range
	bl	_ZNSolsEj		//
	mov	x2, x0	// _184,
// IRIW_Relax_WO_Fence.cpp:279:     std::cout << "  Iterations: " << t_range << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp459,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp459,
	mov	x0, x2	//, _184
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:280:     std::cout << "  Forbidden outcomes: " << forbidden_outcomes << " (" << (100.0 * forbidden_outcomes / t_range) << "%)" << std::endl;
	adrp	x0, .LC13	// tmp460,
	add	x1, x0, :lo12:.LC13	//, tmp460,
	adrp	x0, :got:_ZSt4cout	// tmp461,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp461,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:280:     std::cout << "  Forbidden outcomes: " << forbidden_outcomes << " (" << (100.0 * forbidden_outcomes / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 72]	//, forbidden_outcomes
	bl	_ZNSolsEi		//
	mov	x2, x0	// _186,
	adrp	x0, .LC4	// tmp462,
	add	x1, x0, :lo12:.LC4	//, tmp462,
	mov	x0, x2	//, _186
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _187,
// IRIW_Relax_WO_Fence.cpp:280:     std::cout << "  Forbidden outcomes: " << forbidden_outcomes << " (" << (100.0 * forbidden_outcomes / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 72]	// tmp463, forbidden_outcomes
	scvtf	d0, w0	// _188, tmp463
	mov	x0, 4636737291354636288	// tmp506,
	fmov	d1, x0	// tmp464, tmp506
	fmul	d1, d0, d1	// _189, _188, tmp464
// IRIW_Relax_WO_Fence.cpp:280:     std::cout << "  Forbidden outcomes: " << forbidden_outcomes << " (" << (100.0 * forbidden_outcomes / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp465, t_range
	ucvtf	d0, w0	// _190, tmp465
	fdiv	d0, d1, d0	// _191, _189, _190
	mov	x0, x1	//, _187
	bl	_ZNSolsEd		//
	mov	x2, x0	// _192,
// IRIW_Relax_WO_Fence.cpp:280:     std::cout << "  Forbidden outcomes: " << forbidden_outcomes << " (" << (100.0 * forbidden_outcomes / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp466,
	add	x1, x0, :lo12:.LC5	//, tmp466,
	mov	x0, x2	//, _192
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _193,
// IRIW_Relax_WO_Fence.cpp:280:     std::cout << "  Forbidden outcomes: " << forbidden_outcomes << " (" << (100.0 * forbidden_outcomes / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp467,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp467,
	mov	x0, x2	//, _193
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:282:     if (forbidden_outcomes > 0) {
	ldr	w0, [sp, 72]	// tmp468, forbidden_outcomes
	cmp	w0, 0	// tmp468,
	ble	.L59		//,
// IRIW_Relax_WO_Fence.cpp:283:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC14	// tmp469,
	add	x1, x0, :lo12:.LC14	//, tmp469,
	adrp	x0, :got:_ZSt4cout	// tmp470,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp470,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _194,
// IRIW_Relax_WO_Fence.cpp:283:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp471,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp471,
	mov	x0, x2	//, _194
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:284:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED IN " << forbidden_outcomes << " CASES!" << std::endl;
	adrp	x0, .LC15	// tmp472,
	add	x1, x0, :lo12:.LC15	//, tmp472,
	adrp	x0, :got:_ZSt4cout	// tmp473,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp473,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_WO_Fence.cpp:284:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED IN " << forbidden_outcomes << " CASES!" << std::endl;
	ldr	w1, [sp, 72]	//, forbidden_outcomes
	bl	_ZNSolsEi		//
	mov	x2, x0	// _196,
	adrp	x0, .LC16	// tmp474,
	add	x1, x0, :lo12:.LC16	//, tmp474,
	mov	x0, x2	//, _196
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _197,
// IRIW_Relax_WO_Fence.cpp:284:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED IN " << forbidden_outcomes << " CASES!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp475,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp475,
	mov	x0, x2	//, _197
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:285:         std::cout << "    This indicates non-sequentially consistent memory ordering" << std::endl;
	adrp	x0, .LC17	// tmp476,
	add	x1, x0, :lo12:.LC17	//, tmp476,
	adrp	x0, :got:_ZSt4cout	// tmp477,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp477,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _198,
// IRIW_Relax_WO_Fence.cpp:285:         std::cout << "    This indicates non-sequentially consistent memory ordering" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp478,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp478,
	mov	x0, x2	//, _198
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:286:         std::cout << "    Thread 1 saw: a=1, b=0 while Thread 3 saw: b=1, a=0" << std::endl;
	adrp	x0, .LC18	// tmp479,
	add	x1, x0, :lo12:.LC18	//, tmp479,
	adrp	x0, :got:_ZSt4cout	// tmp480,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp480,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _199,
// IRIW_Relax_WO_Fence.cpp:286:         std::cout << "    Thread 1 saw: a=1, b=0 while Thread 3 saw: b=1, a=0" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp481,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp481,
	mov	x0, x2	//, _199
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:287:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC14	// tmp482,
	add	x1, x0, :lo12:.LC14	//, tmp482,
	adrp	x0, :got:_ZSt4cout	// tmp483,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp483,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _200,
// IRIW_Relax_WO_Fence.cpp:287:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp484,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp484,
	mov	x0, x2	//, _200
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:288:         return 2;  // Forbidden outcome observed
	mov	w0, 2	// _237,
	b	.L60		//
.L59:
// IRIW_Relax_WO_Fence.cpp:290:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC14	// tmp485,
	add	x1, x0, :lo12:.LC14	//, tmp485,
	adrp	x0, :got:_ZSt4cout	// tmp486,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp486,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _201,
// IRIW_Relax_WO_Fence.cpp:290:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp487,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp487,
	mov	x0, x2	//, _201
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:291:         std::cout << "    No forbidden behavior observed" << std::endl;
	adrp	x0, .LC19	// tmp488,
	add	x1, x0, :lo12:.LC19	//, tmp488,
	adrp	x0, :got:_ZSt4cout	// tmp489,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp489,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _202,
// IRIW_Relax_WO_Fence.cpp:291:         std::cout << "    No forbidden behavior observed" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp490,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp490,
	mov	x0, x2	//, _202
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:292:         std::cout << "    Memory operations appear to be sequentially consistent" << std::endl;
	adrp	x0, .LC20	// tmp491,
	add	x1, x0, :lo12:.LC20	//, tmp491,
	adrp	x0, :got:_ZSt4cout	// tmp492,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp492,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _203,
// IRIW_Relax_WO_Fence.cpp:292:         std::cout << "    Memory operations appear to be sequentially consistent" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp493,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp493,
	mov	x0, x2	//, _203
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:293:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC14	// tmp494,
	add	x1, x0, :lo12:.LC14	//, tmp494,
	adrp	x0, :got:_ZSt4cout	// tmp495,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp495,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _204,
// IRIW_Relax_WO_Fence.cpp:293:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp496,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp496,
	mov	x0, x2	//, _204
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:294:         return 0;  // No forbidden outcome observed
	mov	w0, 0	// _237,
.L60:
// IRIW_Relax_WO_Fence.cpp:296: }
	ldp	x29, x30, [sp], 80	//,,,
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
	stp	x29, x30, [sp, -112]!	//,,,
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp	//,
	str	w0, [sp, 28]	// argc, argc
	str	x1, [sp, 16]	// argv, argv
// IRIW_Relax_WO_Fence.cpp:299: {
	adrp	x0, :got:__stack_chk_guard	// tmp214,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp213, tmp214,
	ldr	x1, [x0]	// tmp429,
	str	x1, [sp, 104]	// tmp429, D.48809
	mov	x1, 0	// tmp429
// IRIW_Relax_WO_Fence.cpp:300:     if (argc != 2) { 
	ldr	w0, [sp, 28]	// tmp215, argc
	cmp	w0, 2	// tmp215,
	beq	.L62		//,
// IRIW_Relax_WO_Fence.cpp:301:         printf("usage: %s <thread_count>\n", argv[0]);
	ldr	x0, [sp, 16]	// tmp216, argv
	ldr	x0, [x0]	// _1, *argv_130(D)
	mov	x1, x0	//, _1
	adrp	x0, .LC21	// tmp217,
	add	x0, x0, :lo12:.LC21	//, tmp217,
	bl	printf		//
// IRIW_Relax_WO_Fence.cpp:302:         exit(1);
	mov	w0, 1	//,
	bl	exit		//
.L62:
// IRIW_Relax_WO_Fence.cpp:304:     int thread_count = atoi(argv[1]);
	ldr	x0, [sp, 16]	// tmp218, argv
	add	x0, x0, 8	// _2, tmp218,
// IRIW_Relax_WO_Fence.cpp:304:     int thread_count = atoi(argv[1]);
	ldr	x0, [x0]	// _3, *_2
	bl	atoi		//
	str	w0, [sp, 64]	//, thread_count
// IRIW_Relax_WO_Fence.cpp:306:     printf("Starting %d threads for IRIW litmus test...\n", thread_count);
	ldr	w1, [sp, 64]	//, thread_count
	adrp	x0, .LC22	// tmp219,
	add	x0, x0, :lo12:.LC22	//, tmp219,
	bl	printf		//
// IRIW_Relax_WO_Fence.cpp:307:     printf("This test is DESIGNED to expose the forbidden outcome where different threads\n");
	adrp	x0, .LC23	// tmp220,
	add	x0, x0, :lo12:.LC23	//, tmp220,
	bl	puts		//
// IRIW_Relax_WO_Fence.cpp:308:     printf("observe operations in different orders (non-sequentially consistent behavior)\n");
	adrp	x0, .LC24	// tmp221,
	add	x0, x0, :lo12:.LC24	//, tmp221,
	bl	puts		//
// IRIW_Relax_WO_Fence.cpp:310:     auto num_iterations = DEF_RUNS; 
	mov	w0, 34464	// tmp222,
	movk	w0, 0x1, lsl 16	// tmp222,,
	str	w0, [sp, 68]	// tmp222, num_iterations
// IRIW_Relax_WO_Fence.cpp:311:     auto t_range = num_iterations;
	ldr	w0, [sp, 68]	// tmp223, num_iterations
	str	w0, [sp, 72]	// tmp223, t_range
// IRIW_Relax_WO_Fence.cpp:314:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	ldrsw	x0, [sp, 72]	// _4, t_range
// IRIW_Relax_WO_Fence.cpp:314:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	lsl	x0, x0, 7	// _5, _4,
	bl	malloc		//
	mov	x1, x0	// _6, tmp224
// IRIW_Relax_WO_Fence.cpp:314:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	adrp	x0, var	// tmp226,
	add	x0, x0, :lo12:var	// tmp225, tmp226,
	str	x1, [x0]	// _6, var
// IRIW_Relax_WO_Fence.cpp:317:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 40]	//, i
// IRIW_Relax_WO_Fence.cpp:317:     for (auto i = 0; i < t_range; ++i) {
	b	.L63		//
.L64:
// IRIW_Relax_WO_Fence.cpp:318:         var[i].a = 0;
	adrp	x0, var	// tmp228,
	add	x0, x0, :lo12:var	// tmp227, tmp228,
	ldr	x1, [x0]	// var.69_7, var
// IRIW_Relax_WO_Fence.cpp:318:         var[i].a = 0;
	ldrsw	x0, [sp, 40]	// _8, i
// IRIW_Relax_WO_Fence.cpp:318:         var[i].a = 0;
	lsl	x0, x0, 7	// _9, _8,
	add	x0, x1, x0	// _10, var.69_7, _9
// IRIW_Relax_WO_Fence.cpp:318:         var[i].a = 0;
	str	wzr, [x0]	//, _10->a
// IRIW_Relax_WO_Fence.cpp:319:         var[i].b = 0;
	adrp	x0, var	// tmp230,
	add	x0, x0, :lo12:var	// tmp229, tmp230,
	ldr	x1, [x0]	// var.70_11, var
// IRIW_Relax_WO_Fence.cpp:319:         var[i].b = 0;
	ldrsw	x0, [sp, 40]	// _12, i
// IRIW_Relax_WO_Fence.cpp:319:         var[i].b = 0;
	lsl	x0, x0, 7	// _13, _12,
	add	x0, x1, x0	// _14, var.70_11, _13
// IRIW_Relax_WO_Fence.cpp:319:         var[i].b = 0;
	str	wzr, [x0, 64]	//, _14->b
// IRIW_Relax_WO_Fence.cpp:317:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 40]	// tmp232, i
	add	w0, w0, 1	// tmp231, tmp232,
	str	w0, [sp, 40]	// tmp231, i
.L63:
// IRIW_Relax_WO_Fence.cpp:317:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 40]	// tmp233, i
	ldr	w0, [sp, 72]	// tmp234, t_range
	cmp	w1, w0	// tmp233, tmp234
	blt	.L64		//,
// IRIW_Relax_WO_Fence.cpp:323:     cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	ldrsw	x0, [sp, 72]	// _15, t_range
// IRIW_Relax_WO_Fence.cpp:323:     cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	lsl	x0, x0, 6	// _16, _15,
	bl	malloc		//
	mov	x1, x0	// _17, tmp235
// IRIW_Relax_WO_Fence.cpp:323:     cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	adrp	x0, cpu_res0	// tmp237,
	add	x0, x0, :lo12:cpu_res0	// tmp236, tmp237,
	str	x1, [x0]	// _17, cpu_res0
// IRIW_Relax_WO_Fence.cpp:324:     gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	ldrsw	x0, [sp, 72]	// _18, t_range
// IRIW_Relax_WO_Fence.cpp:324:     gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	lsl	x0, x0, 6	// _19, _18,
	bl	malloc		//
	mov	x1, x0	// _20, tmp238
// IRIW_Relax_WO_Fence.cpp:324:     gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	adrp	x0, gpu_res0	// tmp240,
	add	x0, x0, :lo12:gpu_res0	// tmp239, tmp240,
	str	x1, [x0]	// _20, gpu_res0
// IRIW_Relax_WO_Fence.cpp:325:     cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
	ldrsw	x0, [sp, 72]	// _21, t_range
// IRIW_Relax_WO_Fence.cpp:325:     cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
	lsl	x0, x0, 6	// _22, _21,
	bl	malloc		//
	mov	x1, x0	// _23, tmp241
// IRIW_Relax_WO_Fence.cpp:325:     cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
	adrp	x0, cpu_res1	// tmp243,
	add	x0, x0, :lo12:cpu_res1	// tmp242, tmp243,
	str	x1, [x0]	// _23, cpu_res1
// IRIW_Relax_WO_Fence.cpp:326:     gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
	ldrsw	x0, [sp, 72]	// _24, t_range
// IRIW_Relax_WO_Fence.cpp:326:     gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
	lsl	x0, x0, 6	// _25, _24,
	bl	malloc		//
	mov	x1, x0	// _26, tmp244
// IRIW_Relax_WO_Fence.cpp:326:     gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
	adrp	x0, gpu_res1	// tmp246,
	add	x0, x0, :lo12:gpu_res1	// tmp245, tmp246,
	str	x1, [x0]	// _26, gpu_res1
// IRIW_Relax_WO_Fence.cpp:328:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 44]	//, i
// IRIW_Relax_WO_Fence.cpp:328:     for (auto i = 0; i < t_range; ++i) {
	b	.L65		//
.L66:
// IRIW_Relax_WO_Fence.cpp:329:         cpu_res0[i].r0 = 2;
	adrp	x0, cpu_res0	// tmp248,
	add	x0, x0, :lo12:cpu_res0	// tmp247, tmp248,
	ldr	x1, [x0]	// cpu_res0.71_27, cpu_res0
// IRIW_Relax_WO_Fence.cpp:329:         cpu_res0[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _28, i
// IRIW_Relax_WO_Fence.cpp:329:         cpu_res0[i].r0 = 2;
	lsl	x0, x0, 6	// _29, _28,
	add	x0, x1, x0	// _30, cpu_res0.71_27, _29
// IRIW_Relax_WO_Fence.cpp:329:         cpu_res0[i].r0 = 2;
	mov	w1, 2	// tmp249,
	str	w1, [x0]	// tmp249, _30->r0
// IRIW_Relax_WO_Fence.cpp:330:         gpu_res0[i].r0 = 2;
	adrp	x0, gpu_res0	// tmp251,
	add	x0, x0, :lo12:gpu_res0	// tmp250, tmp251,
	ldr	x1, [x0]	// gpu_res0.72_31, gpu_res0
// IRIW_Relax_WO_Fence.cpp:330:         gpu_res0[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _32, i
// IRIW_Relax_WO_Fence.cpp:330:         gpu_res0[i].r0 = 2;
	lsl	x0, x0, 6	// _33, _32,
	add	x0, x1, x0	// _34, gpu_res0.72_31, _33
// IRIW_Relax_WO_Fence.cpp:330:         gpu_res0[i].r0 = 2;
	mov	w1, 2	// tmp252,
	str	w1, [x0]	// tmp252, _34->r0
// IRIW_Relax_WO_Fence.cpp:331:         cpu_res1[i].r0 = 2;
	adrp	x0, cpu_res1	// tmp254,
	add	x0, x0, :lo12:cpu_res1	// tmp253, tmp254,
	ldr	x1, [x0]	// cpu_res1.73_35, cpu_res1
// IRIW_Relax_WO_Fence.cpp:331:         cpu_res1[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _36, i
// IRIW_Relax_WO_Fence.cpp:331:         cpu_res1[i].r0 = 2;
	lsl	x0, x0, 6	// _37, _36,
	add	x0, x1, x0	// _38, cpu_res1.73_35, _37
// IRIW_Relax_WO_Fence.cpp:331:         cpu_res1[i].r0 = 2;
	mov	w1, 2	// tmp255,
	str	w1, [x0]	// tmp255, _38->r0
// IRIW_Relax_WO_Fence.cpp:332:         gpu_res1[i].r0 = 2;
	adrp	x0, gpu_res1	// tmp257,
	add	x0, x0, :lo12:gpu_res1	// tmp256, tmp257,
	ldr	x1, [x0]	// gpu_res1.74_39, gpu_res1
// IRIW_Relax_WO_Fence.cpp:332:         gpu_res1[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _40, i
// IRIW_Relax_WO_Fence.cpp:332:         gpu_res1[i].r0 = 2;
	lsl	x0, x0, 6	// _41, _40,
	add	x0, x1, x0	// _42, gpu_res1.74_39, _41
// IRIW_Relax_WO_Fence.cpp:332:         gpu_res1[i].r0 = 2;
	mov	w1, 2	// tmp258,
	str	w1, [x0]	// tmp258, _42->r0
// IRIW_Relax_WO_Fence.cpp:328:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 44]	// tmp260, i
	add	w0, w0, 1	// tmp259, tmp260,
	str	w0, [sp, 44]	// tmp259, i
.L65:
// IRIW_Relax_WO_Fence.cpp:328:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 44]	// tmp261, i
	ldr	w0, [sp, 72]	// tmp262, t_range
	cmp	w1, w0	// tmp261, tmp262
	blt	.L66		//,
// IRIW_Relax_WO_Fence.cpp:336:     cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 72]	// _43, t_range
// IRIW_Relax_WO_Fence.cpp:336:     cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _44, _43,
	bl	malloc		//
	mov	x1, x0	// _45, tmp263
// IRIW_Relax_WO_Fence.cpp:336:     cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand1	// tmp265,
	add	x0, x0, :lo12:cpu_rand1	// tmp264, tmp265,
	str	x1, [x0]	// _45, cpu_rand1
// IRIW_Relax_WO_Fence.cpp:337:     gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 72]	// _46, t_range
// IRIW_Relax_WO_Fence.cpp:337:     gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _47, _46,
	bl	malloc		//
	mov	x1, x0	// _48, tmp266
// IRIW_Relax_WO_Fence.cpp:337:     gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand1	// tmp268,
	add	x0, x0, :lo12:gpu_rand1	// tmp267, tmp268,
	str	x1, [x0]	// _48, gpu_rand1
// IRIW_Relax_WO_Fence.cpp:338:     cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 72]	// _49, t_range
// IRIW_Relax_WO_Fence.cpp:338:     cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _50, _49,
	bl	malloc		//
	mov	x1, x0	// _51, tmp269
// IRIW_Relax_WO_Fence.cpp:338:     cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand2	// tmp271,
	add	x0, x0, :lo12:cpu_rand2	// tmp270, tmp271,
	str	x1, [x0]	// _51, cpu_rand2
// IRIW_Relax_WO_Fence.cpp:339:     gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 72]	// _52, t_range
// IRIW_Relax_WO_Fence.cpp:339:     gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _53, _52,
	bl	malloc		//
	mov	x1, x0	// _54, tmp272
// IRIW_Relax_WO_Fence.cpp:339:     gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand2	// tmp274,
	add	x0, x0, :lo12:gpu_rand2	// tmp273, tmp274,
	str	x1, [x0]	// _54, gpu_rand2
// IRIW_Relax_WO_Fence.cpp:342:     for (int iter = 0; iter < num_iterations; iter++) {
	str	wzr, [sp, 48]	//, iter
// IRIW_Relax_WO_Fence.cpp:342:     for (int iter = 0; iter < num_iterations; iter++) {
	b	.L67		//
.L72:
// IRIW_Relax_WO_Fence.cpp:344:         unsigned rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w1, w0	// _55,
// IRIW_Relax_WO_Fence.cpp:344:         unsigned rand_val = std::rand() % RAND_RANGE;
	mov	w0, 34079	// tmp276,
	movk	w0, 0x51eb, lsl 16	// tmp276,,
	smull	x0, w1, w0	// tmp275, _55, tmp276
	lsr	x0, x0, 32	// tmp277, tmp275,
	asr	w2, w0, 8	// tmp278, tmp277,
	asr	w0, w1, 31	// tmp279, _55,
	sub	w0, w2, w0	// _56, tmp278, tmp279
	mov	w2, 800	// tmp281,
	mul	w0, w0, w2	// tmp280, _56, tmp281
	sub	w0, w1, w0	// _56, _55, tmp280
// IRIW_Relax_WO_Fence.cpp:344:         unsigned rand_val = std::rand() % RAND_RANGE;
	str	w0, [sp, 52]	// _56, rand_val
// IRIW_Relax_WO_Fence.cpp:345:         if (std::rand() % 10 < 2) {  // 20% chance of small delay
	bl	rand		//
	mov	w2, w0	// _57,
// IRIW_Relax_WO_Fence.cpp:345:         if (std::rand() % 10 < 2) {  // 20% chance of small delay
	mov	w0, 26215	// tmp283,
	movk	w0, 0x6666, lsl 16	// tmp283,,
	smull	x0, w2, w0	// tmp282, _57, tmp283
	lsr	x0, x0, 32	// tmp284, tmp282,
	asr	w1, w0, 2	// tmp285, tmp284,
	asr	w0, w2, 31	// tmp286, _57,
	sub	w1, w1, w0	// _58, tmp285, tmp286
	mov	w0, w1	// tmp287, _58
	lsl	w0, w0, 2	// tmp288, tmp287,
	add	w0, w0, w1	// tmp287, tmp287, _58
	lsl	w0, w0, 1	// tmp289, tmp287,
	sub	w1, w2, w0	// _58, _57, tmp287
// IRIW_Relax_WO_Fence.cpp:345:         if (std::rand() % 10 < 2) {  // 20% chance of small delay
	cmp	w1, 1	// _58,
	cset	w0, le	// tmp291,
	and	w0, w0, 255	// retval.75_202, tmp290
// IRIW_Relax_WO_Fence.cpp:345:         if (std::rand() % 10 < 2) {  // 20% chance of small delay
	cmp	w0, 0	// retval.75_202,
	beq	.L68		//,
// IRIW_Relax_WO_Fence.cpp:346:             rand_val = rand_val / 10;
	ldr	w1, [sp, 52]	// tmp293, rand_val
	mov	w0, 52429	// tmp295,
	movk	w0, 0xcccc, lsl 16	// tmp295,,
	umull	x0, w1, w0	// tmp294, tmp293, tmp295
	lsr	x0, x0, 32	// tmp296, tmp294,
	lsr	w0, w0, 3	// tmp292, tmp296,
	str	w0, [sp, 52]	// tmp292, rand_val
.L68:
// IRIW_Relax_WO_Fence.cpp:348:         cpu_rand1[iter] = rand_val;
	adrp	x0, cpu_rand1	// tmp298,
	add	x0, x0, :lo12:cpu_rand1	// tmp297, tmp298,
	ldr	x1, [x0]	// cpu_rand1.76_59, cpu_rand1
// IRIW_Relax_WO_Fence.cpp:348:         cpu_rand1[iter] = rand_val;
	ldrsw	x0, [sp, 48]	// _60, iter
// IRIW_Relax_WO_Fence.cpp:348:         cpu_rand1[iter] = rand_val;
	lsl	x0, x0, 2	// _61, _60,
	add	x0, x1, x0	// _62, cpu_rand1.76_59, _61
// IRIW_Relax_WO_Fence.cpp:348:         cpu_rand1[iter] = rand_val;
	ldr	w1, [sp, 52]	// tmp299, rand_val
	str	w1, [x0]	// tmp299, *_62
// IRIW_Relax_WO_Fence.cpp:351:         rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w1, w0	// _63,
// IRIW_Relax_WO_Fence.cpp:351:         rand_val = std::rand() % RAND_RANGE;
	mov	w0, 34079	// tmp301,
	movk	w0, 0x51eb, lsl 16	// tmp301,,
	smull	x0, w1, w0	// tmp300, _63, tmp301
	lsr	x0, x0, 32	// tmp302, tmp300,
	asr	w2, w0, 8	// tmp303, tmp302,
	asr	w0, w1, 31	// tmp304, _63,
	sub	w0, w2, w0	// _64, tmp303, tmp304
	mov	w2, 800	// tmp306,
	mul	w0, w0, w2	// tmp305, _64, tmp306
	sub	w0, w1, w0	// _64, _63, tmp305
// IRIW_Relax_WO_Fence.cpp:351:         rand_val = std::rand() % RAND_RANGE;
	str	w0, [sp, 52]	// _64, rand_val
// IRIW_Relax_WO_Fence.cpp:352:         if (std::rand() % 10 < 1) {  // 10% chance of large delay
	bl	rand		//
	mov	w2, w0	// _65,
// IRIW_Relax_WO_Fence.cpp:352:         if (std::rand() % 10 < 1) {  // 10% chance of large delay
	mov	w0, 26215	// tmp308,
	movk	w0, 0x6666, lsl 16	// tmp308,,
	smull	x0, w2, w0	// tmp307, _65, tmp308
	lsr	x0, x0, 32	// tmp309, tmp307,
	asr	w1, w0, 2	// tmp310, tmp309,
	asr	w0, w2, 31	// tmp311, _65,
	sub	w1, w1, w0	// _66, tmp310, tmp311
	mov	w0, w1	// tmp312, _66
	lsl	w0, w0, 2	// tmp313, tmp312,
	add	w0, w0, w1	// tmp312, tmp312, _66
	lsl	w0, w0, 1	// tmp314, tmp312,
	sub	w1, w2, w0	// _66, _65, tmp312
// IRIW_Relax_WO_Fence.cpp:352:         if (std::rand() % 10 < 1) {  // 10% chance of large delay
	cmp	w1, 0	// _66,
	cset	w0, le	// tmp316,
	and	w0, w0, 255	// retval.77_208, tmp315
// IRIW_Relax_WO_Fence.cpp:352:         if (std::rand() % 10 < 1) {  // 10% chance of large delay
	cmp	w0, 0	// retval.77_208,
	beq	.L69		//,
// IRIW_Relax_WO_Fence.cpp:353:             rand_val = rand_val * 2;
	ldr	w0, [sp, 52]	// tmp318, rand_val
	lsl	w0, w0, 1	// tmp317, tmp318,
	str	w0, [sp, 52]	// tmp317, rand_val
.L69:
// IRIW_Relax_WO_Fence.cpp:355:         gpu_rand1[iter] = rand_val;
	adrp	x0, gpu_rand1	// tmp320,
	add	x0, x0, :lo12:gpu_rand1	// tmp319, tmp320,
	ldr	x1, [x0]	// gpu_rand1.78_67, gpu_rand1
// IRIW_Relax_WO_Fence.cpp:355:         gpu_rand1[iter] = rand_val;
	ldrsw	x0, [sp, 48]	// _68, iter
// IRIW_Relax_WO_Fence.cpp:355:         gpu_rand1[iter] = rand_val;
	lsl	x0, x0, 2	// _69, _68,
	add	x0, x1, x0	// _70, gpu_rand1.78_67, _69
// IRIW_Relax_WO_Fence.cpp:355:         gpu_rand1[iter] = rand_val;
	ldr	w1, [sp, 52]	// tmp321, rand_val
	str	w1, [x0]	// tmp321, *_70
// IRIW_Relax_WO_Fence.cpp:358:         rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w1, w0	// _71,
// IRIW_Relax_WO_Fence.cpp:358:         rand_val = std::rand() % RAND_RANGE;
	mov	w0, 34079	// tmp323,
	movk	w0, 0x51eb, lsl 16	// tmp323,,
	smull	x0, w1, w0	// tmp322, _71, tmp323
	lsr	x0, x0, 32	// tmp324, tmp322,
	asr	w2, w0, 8	// tmp325, tmp324,
	asr	w0, w1, 31	// tmp326, _71,
	sub	w0, w2, w0	// _72, tmp325, tmp326
	mov	w2, 800	// tmp328,
	mul	w0, w0, w2	// tmp327, _72, tmp328
	sub	w0, w1, w0	// _72, _71, tmp327
// IRIW_Relax_WO_Fence.cpp:358:         rand_val = std::rand() % RAND_RANGE;
	str	w0, [sp, 52]	// _72, rand_val
// IRIW_Relax_WO_Fence.cpp:359:         if (std::rand() % 10 < 3) {  // 30% chance of small delay
	bl	rand		//
	mov	w2, w0	// _73,
// IRIW_Relax_WO_Fence.cpp:359:         if (std::rand() % 10 < 3) {  // 30% chance of small delay
	mov	w0, 26215	// tmp330,
	movk	w0, 0x6666, lsl 16	// tmp330,,
	smull	x0, w2, w0	// tmp329, _73, tmp330
	lsr	x0, x0, 32	// tmp331, tmp329,
	asr	w1, w0, 2	// tmp332, tmp331,
	asr	w0, w2, 31	// tmp333, _73,
	sub	w1, w1, w0	// _74, tmp332, tmp333
	mov	w0, w1	// tmp334, _74
	lsl	w0, w0, 2	// tmp335, tmp334,
	add	w0, w0, w1	// tmp334, tmp334, _74
	lsl	w0, w0, 1	// tmp336, tmp334,
	sub	w1, w2, w0	// _74, _73, tmp334
// IRIW_Relax_WO_Fence.cpp:359:         if (std::rand() % 10 < 3) {  // 30% chance of small delay
	cmp	w1, 2	// _74,
	cset	w0, le	// tmp338,
	and	w0, w0, 255	// retval.79_214, tmp337
// IRIW_Relax_WO_Fence.cpp:359:         if (std::rand() % 10 < 3) {  // 30% chance of small delay
	cmp	w0, 0	// retval.79_214,
	beq	.L70		//,
// IRIW_Relax_WO_Fence.cpp:360:             rand_val = rand_val / 8;
	ldr	w0, [sp, 52]	// tmp340, rand_val
	lsr	w0, w0, 3	// tmp339, tmp340,
	str	w0, [sp, 52]	// tmp339, rand_val
.L70:
// IRIW_Relax_WO_Fence.cpp:362:         cpu_rand2[iter] = rand_val;
	adrp	x0, cpu_rand2	// tmp342,
	add	x0, x0, :lo12:cpu_rand2	// tmp341, tmp342,
	ldr	x1, [x0]	// cpu_rand2.80_75, cpu_rand2
// IRIW_Relax_WO_Fence.cpp:362:         cpu_rand2[iter] = rand_val;
	ldrsw	x0, [sp, 48]	// _76, iter
// IRIW_Relax_WO_Fence.cpp:362:         cpu_rand2[iter] = rand_val;
	lsl	x0, x0, 2	// _77, _76,
	add	x0, x1, x0	// _78, cpu_rand2.80_75, _77
// IRIW_Relax_WO_Fence.cpp:362:         cpu_rand2[iter] = rand_val;
	ldr	w1, [sp, 52]	// tmp343, rand_val
	str	w1, [x0]	// tmp343, *_78
// IRIW_Relax_WO_Fence.cpp:365:         rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w1, w0	// _79,
// IRIW_Relax_WO_Fence.cpp:365:         rand_val = std::rand() % RAND_RANGE;
	mov	w0, 34079	// tmp345,
	movk	w0, 0x51eb, lsl 16	// tmp345,,
	smull	x0, w1, w0	// tmp344, _79, tmp345
	lsr	x0, x0, 32	// tmp346, tmp344,
	asr	w2, w0, 8	// tmp347, tmp346,
	asr	w0, w1, 31	// tmp348, _79,
	sub	w0, w2, w0	// _80, tmp347, tmp348
	mov	w2, 800	// tmp350,
	mul	w0, w0, w2	// tmp349, _80, tmp350
	sub	w0, w1, w0	// _80, _79, tmp349
// IRIW_Relax_WO_Fence.cpp:365:         rand_val = std::rand() % RAND_RANGE;
	str	w0, [sp, 52]	// _80, rand_val
// IRIW_Relax_WO_Fence.cpp:366:         if (std::rand() % 10 < 2) {  // 20% chance of large delay
	bl	rand		//
	mov	w2, w0	// _81,
// IRIW_Relax_WO_Fence.cpp:366:         if (std::rand() % 10 < 2) {  // 20% chance of large delay
	mov	w0, 26215	// tmp352,
	movk	w0, 0x6666, lsl 16	// tmp352,,
	smull	x0, w2, w0	// tmp351, _81, tmp352
	lsr	x0, x0, 32	// tmp353, tmp351,
	asr	w1, w0, 2	// tmp354, tmp353,
	asr	w0, w2, 31	// tmp355, _81,
	sub	w1, w1, w0	// _82, tmp354, tmp355
	mov	w0, w1	// tmp356, _82
	lsl	w0, w0, 2	// tmp357, tmp356,
	add	w0, w0, w1	// tmp356, tmp356, _82
	lsl	w0, w0, 1	// tmp358, tmp356,
	sub	w1, w2, w0	// _82, _81, tmp356
// IRIW_Relax_WO_Fence.cpp:366:         if (std::rand() % 10 < 2) {  // 20% chance of large delay
	cmp	w1, 1	// _82,
	cset	w0, le	// tmp360,
	and	w0, w0, 255	// retval.81_220, tmp359
// IRIW_Relax_WO_Fence.cpp:366:         if (std::rand() % 10 < 2) {  // 20% chance of large delay
	cmp	w0, 0	// retval.81_220,
	beq	.L71		//,
// IRIW_Relax_WO_Fence.cpp:367:             rand_val = rand_val * 3;
	ldr	w1, [sp, 52]	// tmp361, rand_val
	mov	w0, w1	// tmp362, tmp361
	lsl	w0, w0, 1	// tmp363, tmp362,
	add	w0, w0, w1	// tmp364, tmp362, tmp361
	str	w0, [sp, 52]	// tmp364, rand_val
.L71:
// IRIW_Relax_WO_Fence.cpp:369:         gpu_rand2[iter] = rand_val;
	adrp	x0, gpu_rand2	// tmp366,
	add	x0, x0, :lo12:gpu_rand2	// tmp365, tmp366,
	ldr	x1, [x0]	// gpu_rand2.82_83, gpu_rand2
// IRIW_Relax_WO_Fence.cpp:369:         gpu_rand2[iter] = rand_val;
	ldrsw	x0, [sp, 48]	// _84, iter
// IRIW_Relax_WO_Fence.cpp:369:         gpu_rand2[iter] = rand_val;
	lsl	x0, x0, 2	// _85, _84,
	add	x0, x1, x0	// _86, gpu_rand2.82_83, _85
// IRIW_Relax_WO_Fence.cpp:369:         gpu_rand2[iter] = rand_val;
	ldr	w1, [sp, 52]	// tmp367, rand_val
	str	w1, [x0]	// tmp367, *_86
// IRIW_Relax_WO_Fence.cpp:342:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w0, [sp, 48]	// tmp369, iter
	add	w0, w0, 1	// tmp368, tmp369,
	str	w0, [sp, 48]	// tmp368, iter
.L67:
// IRIW_Relax_WO_Fence.cpp:342:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w1, [sp, 48]	// tmp370, iter
	ldr	w0, [sp, 68]	// tmp371, num_iterations
	cmp	w1, w0	// tmp370, tmp371
	blt	.L72		//,
// IRIW_Relax_WO_Fence.cpp:372:     std::cout << "Random delays generated with high variability" << std::endl;
	adrp	x0, .LC25	// tmp372,
	add	x1, x0, :lo12:.LC25	//, tmp372,
	adrp	x0, :got:_ZSt4cout	// tmp373,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp373,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _87,
// IRIW_Relax_WO_Fence.cpp:372:     std::cout << "Random delays generated with high variability" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp374,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp374,
	mov	x0, x2	//, _87
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:375:     pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
	ldrsw	x0, [sp, 64]	// _88, thread_count
	mov	x1, 8	//,
	bl	calloc		//
	str	x0, [sp, 96]	// tmp375, threads
// IRIW_Relax_WO_Fence.cpp:376:     pthread_barrier_init(&barrier, NULL, (thread_count));
	ldr	w0, [sp, 64]	// thread_count.83_89, thread_count
	mov	w2, w0	//, thread_count.83_89
	mov	x1, 0	//,
	adrp	x0, barrier	// tmp376,
	add	x0, x0, :lo12:barrier	//, tmp376,
	bl	pthread_barrier_init		//
// IRIW_Relax_WO_Fence.cpp:377:     assert(threads != NULL);
	ldr	x0, [sp, 96]	// tmp377, threads
	cmp	x0, 0	// tmp377,
	bne	.L73		//,
// IRIW_Relax_WO_Fence.cpp:377:     assert(threads != NULL);
	adrp	x0, .LC26	// tmp378,
	add	x3, x0, :lo12:.LC26	//, tmp378,
	mov	w2, 377	//,
	adrp	x0, .LC27	// tmp379,
	add	x1, x0, :lo12:.LC27	//, tmp379,
	adrp	x0, .LC28	// tmp380,
	add	x0, x0, :lo12:.LC28	//, tmp380,
	bl	__assert_fail		//
.L73:
// IRIW_Relax_WO_Fence.cpp:379:     for (int i = 1; i < thread_count; i++) {
	mov	w0, 1	// tmp381,
	str	w0, [sp, 56]	// tmp381, i
// IRIW_Relax_WO_Fence.cpp:379:     for (int i = 1; i < thread_count; i++) {
	b	.L74		//
.L76:
// IRIW_Relax_WO_Fence.cpp:380:         int createResult = pthread_create(&threads[i], 
	ldrsw	x0, [sp, 56]	// _90, i
// IRIW_Relax_WO_Fence.cpp:380:         int createResult = pthread_create(&threads[i], 
	lsl	x0, x0, 3	// _91, _90,
// IRIW_Relax_WO_Fence.cpp:380:         int createResult = pthread_create(&threads[i], 
	ldr	x1, [sp, 96]	// tmp382, threads
	add	x4, x1, x0	// _92, tmp382, _91
// IRIW_Relax_WO_Fence.cpp:383:                                           (void*)i);
	ldrsw	x0, [sp, 56]	// _93, i
// IRIW_Relax_WO_Fence.cpp:380:         int createResult = pthread_create(&threads[i], 
	mov	x3, x0	//, _94
	adrp	x0, _Z7runIRIWPv	// tmp383,
	add	x2, x0, :lo12:_Z7runIRIWPv	//, tmp383,
	mov	x1, 0	//,
	mov	x0, x4	//, _92
	bl	pthread_create		//
	str	w0, [sp, 84]	//, createResult
// IRIW_Relax_WO_Fence.cpp:384:         assert(createResult == 0);
	ldr	w0, [sp, 84]	// tmp384, createResult
	cmp	w0, 0	// tmp384,
	beq	.L75		//,
// IRIW_Relax_WO_Fence.cpp:384:         assert(createResult == 0);
	adrp	x0, .LC26	// tmp385,
	add	x3, x0, :lo12:.LC26	//, tmp385,
	mov	w2, 384	//,
	adrp	x0, .LC27	// tmp386,
	add	x1, x0, :lo12:.LC27	//, tmp386,
	adrp	x0, .LC29	// tmp387,
	add	x0, x0, :lo12:.LC29	//, tmp387,
	bl	__assert_fail		//
.L75:
// IRIW_Relax_WO_Fence.cpp:379:     for (int i = 1; i < thread_count; i++) {
	ldr	w0, [sp, 56]	// tmp389, i
	add	w0, w0, 1	// tmp388, tmp389,
	str	w0, [sp, 56]	// tmp388, i
.L74:
// IRIW_Relax_WO_Fence.cpp:379:     for (int i = 1; i < thread_count; i++) {
	ldr	w1, [sp, 56]	// tmp390, i
	ldr	w0, [sp, 64]	// tmp391, thread_count
	cmp	w1, w0	// tmp390, tmp391
	blt	.L76		//,
// IRIW_Relax_WO_Fence.cpp:387:     long long int local = (long long int)runIRIW((void*)0);
	mov	x0, 0	//,
	bl	_Z7runIRIWPv		//
// IRIW_Relax_WO_Fence.cpp:387:     long long int local = (long long int)runIRIW((void*)0);
	str	x0, [sp, 88]	// _96, local
// IRIW_Relax_WO_Fence.cpp:388:     printf("local[0] = %lld\n", local);
	ldr	x0, [sp, 88]	// local.84_97, local
	mov	x1, x0	//, local.84_97
	adrp	x0, .LC30	// tmp392,
	add	x0, x0, :lo12:.LC30	//, tmp392,
	bl	printf		//
// IRIW_Relax_WO_Fence.cpp:391:     for (int i = 1; i < thread_count; i++) {
	mov	w0, 1	// tmp393,
	str	w0, [sp, 60]	// tmp393, i
// IRIW_Relax_WO_Fence.cpp:391:     for (int i = 1; i < thread_count; i++) {
	b	.L77		//
.L79:
// IRIW_Relax_WO_Fence.cpp:392:         int joinResult = pthread_join(threads[i], 
	ldrsw	x0, [sp, 60]	// _98, i
// IRIW_Relax_WO_Fence.cpp:392:         int joinResult = pthread_join(threads[i], 
	lsl	x0, x0, 3	// _99, _98,
	ldr	x1, [sp, 96]	// tmp394, threads
	add	x0, x1, x0	// _100, tmp394, _99
// IRIW_Relax_WO_Fence.cpp:392:         int joinResult = pthread_join(threads[i], 
	ldr	x0, [x0]	// _101, *_100
	add	x1, sp, 88	// tmp395,,
	bl	pthread_join		//
	str	w0, [sp, 80]	// _190, joinResult
// IRIW_Relax_WO_Fence.cpp:394:         assert(joinResult == 0);
	ldr	w0, [sp, 80]	// tmp396, joinResult
	cmp	w0, 0	// tmp396,
	beq	.L78		//,
// IRIW_Relax_WO_Fence.cpp:394:         assert(joinResult == 0);
	adrp	x0, .LC26	// tmp397,
	add	x3, x0, :lo12:.LC26	//, tmp397,
	mov	w2, 394	//,
	adrp	x0, .LC27	// tmp398,
	add	x1, x0, :lo12:.LC27	//, tmp398,
	adrp	x0, .LC31	// tmp399,
	add	x0, x0, :lo12:.LC31	//, tmp399,
	bl	__assert_fail		//
.L78:
// IRIW_Relax_WO_Fence.cpp:395:         printf("local[%d] = %lld\n", i, local);
	ldr	x0, [sp, 88]	// local.85_102, local
	mov	x2, x0	//, local.85_102
	ldr	w1, [sp, 60]	//, i
	adrp	x0, .LC32	// tmp400,
	add	x0, x0, :lo12:.LC32	//, tmp400,
	bl	printf		//
// IRIW_Relax_WO_Fence.cpp:391:     for (int i = 1; i < thread_count; i++) {
	ldr	w0, [sp, 60]	// tmp402, i
	add	w0, w0, 1	// tmp401, tmp402,
	str	w0, [sp, 60]	// tmp401, i
.L77:
// IRIW_Relax_WO_Fence.cpp:391:     for (int i = 1; i < thread_count; i++) {
	ldr	w1, [sp, 60]	// tmp403, i
	ldr	w0, [sp, 64]	// tmp404, thread_count
	cmp	w1, w0	// tmp403, tmp404
	blt	.L79		//,
// IRIW_Relax_WO_Fence.cpp:399:     std::cout << "Validating..." << std::endl;
	adrp	x0, .LC33	// tmp405,
	add	x1, x0, :lo12:.LC33	//, tmp405,
	adrp	x0, :got:_ZSt4cout	// tmp406,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp406,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _103,
// IRIW_Relax_WO_Fence.cpp:399:     std::cout << "Validating..." << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp407,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp407,
	mov	x0, x2	//, _103
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_WO_Fence.cpp:400:     int res = check_output(t_range);
	ldr	w0, [sp, 72]	// t_range.86_104, t_range
	bl	_Z12check_outputj		//
	str	w0, [sp, 76]	// _175, res
// IRIW_Relax_WO_Fence.cpp:403:     free(threads);
	ldr	x0, [sp, 96]	//, threads
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:404:     free((void*)var);
	adrp	x0, var	// tmp409,
	add	x0, x0, :lo12:var	// tmp408, tmp409,
	ldr	x0, [x0]	// var.87_105, var
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:405:     free((void*)cpu_res0);
	adrp	x0, cpu_res0	// tmp411,
	add	x0, x0, :lo12:cpu_res0	// tmp410, tmp411,
	ldr	x0, [x0]	// cpu_res0.88_106, cpu_res0
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:406:     free((void*)gpu_res0);
	adrp	x0, gpu_res0	// tmp413,
	add	x0, x0, :lo12:gpu_res0	// tmp412, tmp413,
	ldr	x0, [x0]	// gpu_res0.89_107, gpu_res0
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:407:     free((void*)cpu_res1);
	adrp	x0, cpu_res1	// tmp415,
	add	x0, x0, :lo12:cpu_res1	// tmp414, tmp415,
	ldr	x0, [x0]	// cpu_res1.90_108, cpu_res1
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:408:     free((void*)gpu_res1);
	adrp	x0, gpu_res1	// tmp417,
	add	x0, x0, :lo12:gpu_res1	// tmp416, tmp417,
	ldr	x0, [x0]	// gpu_res1.91_109, gpu_res1
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:409:     free((void*)cpu_rand1);
	adrp	x0, cpu_rand1	// tmp419,
	add	x0, x0, :lo12:cpu_rand1	// tmp418, tmp419,
	ldr	x0, [x0]	// cpu_rand1.92_110, cpu_rand1
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:410:     free((void*)gpu_rand1);
	adrp	x0, gpu_rand1	// tmp421,
	add	x0, x0, :lo12:gpu_rand1	// tmp420, tmp421,
	ldr	x0, [x0]	// gpu_rand1.93_111, gpu_rand1
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:411:     free((void*)cpu_rand2);
	adrp	x0, cpu_rand2	// tmp423,
	add	x0, x0, :lo12:cpu_rand2	// tmp422, tmp423,
	ldr	x0, [x0]	// cpu_rand2.94_112, cpu_rand2
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:412:     free((void*)gpu_rand2);
	adrp	x0, gpu_rand2	// tmp425,
	add	x0, x0, :lo12:gpu_rand2	// tmp424, tmp425,
	ldr	x0, [x0]	// gpu_rand2.95_113, gpu_rand2
	bl	free		//
// IRIW_Relax_WO_Fence.cpp:414:     return 0;
	mov	w0, 0	// _187,
// IRIW_Relax_WO_Fence.cpp:415: }
	mov	w1, w0	// <retval>, _187
	adrp	x0, :got:__stack_chk_guard	// tmp428,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp427, tmp428,
	ldr	x3, [sp, 104]	// tmp430, D.48809
	ldr	x2, [x0]	// tmp431,
	subs	x3, x3, x2	// tmp430, tmp431
	mov	x2, 0	// tmp431
	beq	.L81		//,
	bl	__stack_chk_fail		//
.L81:
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
// IRIW_Relax_WO_Fence.cpp:415: }
	ldr	w0, [sp, 28]	// tmp92, __initialize_p
	cmp	w0, 1	// tmp92,
	bne	.L84		//,
// IRIW_Relax_WO_Fence.cpp:415: }
	ldr	w1, [sp, 24]	// tmp93, __priority
	mov	w0, 65535	// tmp94,
	cmp	w1, w0	// tmp93, tmp94
	bne	.L84		//,
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
.L84:
// IRIW_Relax_WO_Fence.cpp:415: }
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
// IRIW_Relax_WO_Fence.cpp:415: }
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
