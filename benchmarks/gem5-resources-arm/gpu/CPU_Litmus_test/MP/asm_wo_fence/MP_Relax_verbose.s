	.arch armv8-a
	.file	"MP_Relax_WO_Fence.cpp"
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
	ldr	w1, [sp, 12]	// __m.14_1, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	ldr	w0, [sp, 8]	// __mod.15_2, __mod
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	and	w0, w1, w0	// _3, __m.14_1, __mod.15_2
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
// MP_Relax_WO_Fence.cpp:78:     if (rand() % 10 < 3) {
	bl	rand		//
	mov	w2, w0	// _1,
// MP_Relax_WO_Fence.cpp:78:     if (rand() % 10 < 3) {
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
// MP_Relax_WO_Fence.cpp:78:     if (rand() % 10 < 3) {
	cmp	w1, 2	// _2,
	cset	w0, le	// tmp118,
	and	w0, w0, 255	// retval.16_20, tmp117
// MP_Relax_WO_Fence.cpp:78:     if (rand() % 10 < 3) {
	cmp	w0, 0	// retval.16_20,
	beq	.L4		//,
// MP_Relax_WO_Fence.cpp:80:         delay = rand() % 10;
	bl	rand		//
	mov	w1, w0	// _3,
// MP_Relax_WO_Fence.cpp:80:         delay = rand() % 10;
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
// MP_Relax_WO_Fence.cpp:81:     } else if (rand() % 10 < 1) {
	bl	rand		//
	mov	w2, w0	// _4,
// MP_Relax_WO_Fence.cpp:81:     } else if (rand() % 10 < 1) {
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
// MP_Relax_WO_Fence.cpp:81:     } else if (rand() % 10 < 1) {
	cmp	w1, 0	// _5,
	cset	w0, le	// tmp138,
	and	w0, w0, 255	// retval.17_22, tmp137
// MP_Relax_WO_Fence.cpp:81:     } else if (rand() % 10 < 1) {
	cmp	w0, 0	// retval.17_22,
	beq	.L6		//,
// MP_Relax_WO_Fence.cpp:83:         delay = rand() % (max_cycles * 2) + max_cycles;
	bl	rand		//
	mov	w1, w0	// _6,
// MP_Relax_WO_Fence.cpp:83:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w0, [sp, 28]	// tmp139, max_cycles
	lsl	w0, w0, 1	// _7, tmp139,
// MP_Relax_WO_Fence.cpp:83:         delay = rand() % (max_cycles * 2) + max_cycles;
	sdiv	w2, w1, w0	// tmp151, _6, _7
	mul	w0, w2, w0	// tmp152, tmp151, _7
	sub	w0, w1, w0	// _8, _6, tmp152
// MP_Relax_WO_Fence.cpp:83:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w1, [sp, 28]	// tmp154, max_cycles
	add	w0, w1, w0	// tmp153, tmp154, _8
	str	w0, [sp, 44]	// tmp153, delay
	b	.L5		//
.L6:
// MP_Relax_WO_Fence.cpp:86:         delay = rand() % max_cycles;
	bl	rand		//
// MP_Relax_WO_Fence.cpp:86:         delay = rand() % max_cycles;
	ldr	w1, [sp, 28]	// tmp169, max_cycles
	sdiv	w2, w0, w1	// tmp168, _9, tmp169
	ldr	w1, [sp, 28]	// tmp171, max_cycles
	mul	w1, w2, w1	// tmp170, tmp168, tmp171
	sub	w0, w0, w1	// tmp172, _9, tmp170
	str	w0, [sp, 44]	// tmp172, delay
.L5:
// MP_Relax_WO_Fence.cpp:89:     volatile int dummy = 0;
	str	wzr, [sp, 36]	//, dummy
// MP_Relax_WO_Fence.cpp:90:     for (volatile int i = 0; i < delay; i++) {
	str	wzr, [sp, 40]	//, i
// MP_Relax_WO_Fence.cpp:90:     for (volatile int i = 0; i < delay; i++) {
	b	.L7		//
.L8:
// MP_Relax_WO_Fence.cpp:91:         dummy++;
	ldr	w0, [sp, 36]	// dummy.18_10, dummy
	add	w0, w0, 1	// _11, dummy.18_10,
	str	w0, [sp, 36]	// _11, dummy
// MP_Relax_WO_Fence.cpp:90:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.19_12, i
	add	w0, w0, 1	// _13, i.19_12,
	str	w0, [sp, 40]	// _13, i
.L7:
// MP_Relax_WO_Fence.cpp:90:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.21_14, i
// MP_Relax_WO_Fence.cpp:90:     for (volatile int i = 0; i < delay; i++) {
	ldr	w1, [sp, 44]	// tmp174, delay
	cmp	w1, w0	// tmp174, i.21_14
	cset	w0, gt	// tmp175,
	and	w0, w0, 255	// retval.20_32, tmp173
	cmp	w0, 0	// retval.20_32,
	bne	.L8		//,
// MP_Relax_WO_Fence.cpp:93: }
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
	.global	_Z5runMPPv
	.type	_Z5runMPPv, %function
_Z5runMPPv:
.LFB1809:
	.cfi_startproc
	stp	x29, x30, [sp, -160]!	//,,,
	.cfi_def_cfa_offset 160
	.cfi_offset 29, -160
	.cfi_offset 30, -152
	mov	x29, sp	//,
	str	x0, [sp, 24]	// arg, arg
// MP_Relax_WO_Fence.cpp:98:     long long int tid = (long long int)arg;
	ldr	x0, [sp, 24]	// tmp156, arg
	str	x0, [sp, 88]	// tmp156, tid
// MP_Relax_WO_Fence.cpp:99:     local += tid;
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
// MP_Relax_WO_Fence.cpp:100:     pthread_barrier_wait(&barrier);
	adrp	x0, barrier	// tmp162,
	add	x0, x0, :lo12:barrier	//, tmp162,
	bl	pthread_barrier_wait		//
// MP_Relax_WO_Fence.cpp:102:     if(tid / DEF_THREADS == 0)
	ldr	x0, [sp, 88]	// tid.2_6, tid
	add	x0, x0, 3	// _7, tid.2_6,
	cmp	x0, 6	// _7,
	bhi	.L10		//,
// MP_Relax_WO_Fence.cpp:105:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 88]	// tmp163, tid
	str	w0, [sp, 40]	// tmp164, i
// MP_Relax_WO_Fence.cpp:105:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	b	.L11		//
.L12:
// MP_Relax_WO_Fence.cpp:108:             var[i].a = 0;  // x = 0
	adrp	x0, var	// tmp166,
	add	x0, x0, :lo12:var	// tmp165, tmp166,
	ldr	x1, [x0]	// var.3_8, var
// MP_Relax_WO_Fence.cpp:108:             var[i].a = 0;  // x = 0
	ldrsw	x0, [sp, 40]	// _9, i
// MP_Relax_WO_Fence.cpp:108:             var[i].a = 0;  // x = 0
	lsl	x0, x0, 7	// _10, _9,
	add	x0, x1, x0	// _11, var.3_8, _10
// MP_Relax_WO_Fence.cpp:108:             var[i].a = 0;  // x = 0
	str	wzr, [x0]	//, _11->a
// MP_Relax_WO_Fence.cpp:109:             var[i].b = 0;  // flag = 0
	adrp	x0, var	// tmp168,
	add	x0, x0, :lo12:var	// tmp167, tmp168,
	ldr	x1, [x0]	// var.4_12, var
// MP_Relax_WO_Fence.cpp:109:             var[i].b = 0;  // flag = 0
	ldrsw	x0, [sp, 40]	// _13, i
// MP_Relax_WO_Fence.cpp:109:             var[i].b = 0;  // flag = 0
	lsl	x0, x0, 7	// _14, _13,
	add	x0, x1, x0	// _15, var.4_12, _14
// MP_Relax_WO_Fence.cpp:109:             var[i].b = 0;  // flag = 0
	str	wzr, [x0, 64]	//, _15->b
// MP_Relax_WO_Fence.cpp:112:             random_delay(50);
	mov	w0, 50	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence.cpp:115:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp170,
	add	x0, x0, :lo12:var	// tmp169, tmp170,
	ldr	x1, [x0]	// var.5_16, var
// MP_Relax_WO_Fence.cpp:115:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 40]	// _17, i
// MP_Relax_WO_Fence.cpp:115:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _18, _17,
	add	x0, x1, x0	// _19, var.5_16, _18
// MP_Relax_WO_Fence.cpp:115:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 112]	// _19, tmp_a
// MP_Relax_WO_Fence.cpp:116:             tmp_a->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 112]	// _20, tmp_a
	str	x0, [sp, 136]	// _20, this
	mov	w0, 1	// tmp171,
	str	w0, [sp, 60]	// tmp171, __i
	str	wzr, [sp, 64]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 64]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 68]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 136]	// _89, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 60]	// __i.12_90, __i
	stlr	w1, [x0]	// __i.12_90,* _89
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// MP_Relax_WO_Fence.cpp:119:             random_delay(RAND_RANGE);
	mov	w0, 640	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence.cpp:122:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp173,
	add	x0, x0, :lo12:var	// tmp172, tmp173,
	ldr	x1, [x0]	// var.6_21, var
// MP_Relax_WO_Fence.cpp:122:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 40]	// _22, i
// MP_Relax_WO_Fence.cpp:122:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _23, _22,
	add	x0, x1, x0	// _24, var.6_21, _23
// MP_Relax_WO_Fence.cpp:122:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp174, _24,
	str	x0, [sp, 120]	// tmp174, tmp_b
// MP_Relax_WO_Fence.cpp:123:             tmp_b->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 120]	// _25, tmp_b
	str	x0, [sp, 128]	// _25, this
	mov	w0, 1	// tmp175,
	str	w0, [sp, 48]	// tmp175, __i
	str	wzr, [sp, 52]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 52]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 56]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 128]	// _82, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 48]	// __i.12_83, __i
	stlr	w1, [x0]	// __i.12_83,* _82
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// MP_Relax_WO_Fence.cpp:105:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 40]	// tmp177, i
	add	w0, w0, 4	// tmp176, tmp177,
	str	w0, [sp, 40]	// tmp176, i
.L11:
// MP_Relax_WO_Fence.cpp:105:         for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 40]	// tmp178, i
	mov	w0, 34463	// tmp179,
	movk	w0, 0x1, lsl 16	// tmp179,,
	cmp	w1, w0	// tmp178, tmp179
	ble	.L12		//,
	b	.L13		//
.L10:
// MP_Relax_WO_Fence.cpp:129:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 88]	// tmp180, tid
	negs	x1, x0	// tmp181, tmp180
	and	x0, x0, 3	// tmp182, tmp180,
	and	x1, x1, 3	// tmp183, tmp181,
	csneg	x0, x0, x1, mi	// _26, tmp182, tmp183,
// MP_Relax_WO_Fence.cpp:129:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 44]	// tmp184, i
// MP_Relax_WO_Fence.cpp:129:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L14		//
.L17:
// MP_Relax_WO_Fence.cpp:132:             random_delay(RAND_RANGE / 2);
	mov	w0, 320	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence.cpp:135:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp186,
	add	x0, x0, :lo12:var	// tmp185, tmp186,
	ldr	x1, [x0]	// var.7_27, var
// MP_Relax_WO_Fence.cpp:135:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 44]	// _28, i
// MP_Relax_WO_Fence.cpp:135:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _29, _28,
	add	x0, x1, x0	// _30, var.7_27, _29
// MP_Relax_WO_Fence.cpp:135:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp187, _30,
	str	x0, [sp, 96]	// tmp187, tmp_b
// MP_Relax_WO_Fence.cpp:136:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldr	x0, [sp, 96]	// _31, tmp_b
	str	x0, [sp, 152]	// _31, this
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
	mov	w2, w0	// D.48645, _104
// MP_Relax_WO_Fence.cpp:136:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	adrp	x0, gpu_res	// tmp189,
	add	x0, x0, :lo12:gpu_res	// tmp188, tmp189,
	ldr	x1, [x0]	// gpu_res.8_33, gpu_res
// MP_Relax_WO_Fence.cpp:136:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 44]	// _34, i
// MP_Relax_WO_Fence.cpp:136:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _35, _34,
	add	x0, x1, x0	// _36, gpu_res.8_33, _35
// MP_Relax_WO_Fence.cpp:136:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	mov	w1, w2	// _37, D.48645
// MP_Relax_WO_Fence.cpp:136:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
	str	w1, [x0]	// _37, _36->r0
// MP_Relax_WO_Fence.cpp:140:             random_delay(RAND_RANGE);
	mov	w0, 640	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence.cpp:143:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp191,
	add	x0, x0, :lo12:var	// tmp190, tmp191,
	ldr	x1, [x0]	// var.9_38, var
// MP_Relax_WO_Fence.cpp:143:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 44]	// _39, i
// MP_Relax_WO_Fence.cpp:143:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _40, _39,
	add	x0, x1, x0	// _41, var.9_38, _40
// MP_Relax_WO_Fence.cpp:143:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 104]	// _41, tmp_a
// MP_Relax_WO_Fence.cpp:144:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldr	x0, [sp, 104]	// _42, tmp_a
	str	x0, [sp, 144]	// _42, this
	str	wzr, [sp, 72]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 72]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 76]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 144]	// _95, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _97,* _95
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48639, _97
// MP_Relax_WO_Fence.cpp:144:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	adrp	x0, cpu_res	// tmp193,
	add	x0, x0, :lo12:cpu_res	// tmp192, tmp193,
	ldr	x1, [x0]	// cpu_res.10_44, cpu_res
// MP_Relax_WO_Fence.cpp:144:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	ldrsw	x0, [sp, 44]	// _45, i
// MP_Relax_WO_Fence.cpp:144:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	lsl	x0, x0, 6	// _46, _45,
	add	x0, x1, x0	// _47, cpu_res.10_44, _46
// MP_Relax_WO_Fence.cpp:144:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	mov	w1, w2	// _48, D.48639
// MP_Relax_WO_Fence.cpp:144:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
	str	w1, [x0]	// _48, _47->r0
// MP_Relax_WO_Fence.cpp:129:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 44]	// tmp195, i
	add	w0, w0, 4	// tmp194, tmp195,
	str	w0, [sp, 44]	// tmp194, i
.L14:
// MP_Relax_WO_Fence.cpp:129:         for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 44]	// tmp196, i
	mov	w0, 34463	// tmp197,
	movk	w0, 0x1, lsl 16	// tmp197,,
	cmp	w1, w0	// tmp196, tmp197
	ble	.L17		//,
.L13:
// MP_Relax_WO_Fence.cpp:149:     return (void*)local;
	mrs	x0, tpidr_el0	// tmp199
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp198, tmp199,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp198,
	ldr	w0, [x0]	// local.11_49, local
	sxtw	x0, w0	// _50, local.11_49
// MP_Relax_WO_Fence.cpp:150: }
	ldp	x29, x30, [sp], 160	//,,,
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
	.string	"Message Passing (MP) Litmus Test Results with RELAXED ORDERING:"
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
	stp	x29, x30, [sp, -64]!	//,,,
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	//,
	str	w0, [sp, 28]	// t_range, t_range
// MP_Relax_WO_Fence.cpp:155:     unsigned res_cpu0_gpu0 = 0;  // x=0, flag=0
	str	wzr, [sp, 40]	//, res_cpu0_gpu0
// MP_Relax_WO_Fence.cpp:156:     unsigned res_cpu1_gpu0 = 0;  // x=1, flag=0 (interesting/forbidden)
	str	wzr, [sp, 44]	//, res_cpu1_gpu0
// MP_Relax_WO_Fence.cpp:157:     unsigned res_cpu0_gpu1 = 0;  // x=0, flag=1
	str	wzr, [sp, 48]	//, res_cpu0_gpu1
// MP_Relax_WO_Fence.cpp:158:     unsigned res_cpu1_gpu1 = 0;  // x=1, flag=1
	str	wzr, [sp, 52]	//, res_cpu1_gpu1
// MP_Relax_WO_Fence.cpp:159:     unsigned res_cpu2_gpu2 = 0;  // other (initialization)
	str	wzr, [sp, 56]	//, res_cpu2_gpu2
// MP_Relax_WO_Fence.cpp:161:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 60]	//, i
// MP_Relax_WO_Fence.cpp:161:     for (auto i = 0; i < t_range; ++i) {
	b	.L20		//
.L34:
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp189,
	add	x0, x0, :lo12:cpu_res	// tmp188, tmp189,
	ldr	x1, [x0]	// cpu_res.25_1, cpu_res
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _2, i
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _3, _2,
	add	x0, x1, x0	// _4, cpu_res.25_1, _3
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _5, _4->r0
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _5,
	bne	.L21		//,
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp191,
	add	x0, x0, :lo12:gpu_res	// tmp190, tmp191,
	ldr	x1, [x0]	// gpu_res.26_6, gpu_res
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _7, i
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _8, _7,
	add	x0, x1, x0	// _9, gpu_res.26_6, _8
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _10, _9->r0
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _10,
	bne	.L21		//,
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.24_102,
	b	.L22		//
.L21:
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.24_102,
.L22:
// MP_Relax_WO_Fence.cpp:162:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.24_102,
	beq	.L23		//,
// MP_Relax_WO_Fence.cpp:163:             res_cpu0_gpu0++;
	ldr	w0, [sp, 40]	// tmp193, res_cpu0_gpu0
	add	w0, w0, 1	// tmp192, tmp193,
	str	w0, [sp, 40]	// tmp192, res_cpu0_gpu0
	b	.L24		//
.L23:
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp195,
	add	x0, x0, :lo12:cpu_res	// tmp194, tmp195,
	ldr	x1, [x0]	// cpu_res.29_11, cpu_res
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _12, i
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _13, _12,
	add	x0, x1, x0	// _14, cpu_res.29_11, _13
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _15, _14->r0
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 1	// _15,
	bne	.L25		//,
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp197,
	add	x0, x0, :lo12:gpu_res	// tmp196, tmp197,
	ldr	x1, [x0]	// gpu_res.30_16, gpu_res
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _17, i
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _18, _17,
	add	x0, x1, x0	// _19, gpu_res.30_16, _18
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _20, _19->r0
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _20,
	bne	.L25		//,
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.28_103,
	b	.L26		//
.L25:
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.28_103,
.L26:
// MP_Relax_WO_Fence.cpp:164:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.28_103,
	beq	.L27		//,
// MP_Relax_WO_Fence.cpp:165:             res_cpu1_gpu0++;
	ldr	w0, [sp, 44]	// tmp199, res_cpu1_gpu0
	add	w0, w0, 1	// tmp198, tmp199,
	str	w0, [sp, 44]	// tmp198, res_cpu1_gpu0
	b	.L24		//
.L27:
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp201,
	add	x0, x0, :lo12:cpu_res	// tmp200, tmp201,
	ldr	x1, [x0]	// cpu_res.33_21, cpu_res
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _22, i
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _23, _22,
	add	x0, x1, x0	// _24, cpu_res.33_21, _23
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _25, _24->r0
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// _25,
	bne	.L28		//,
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp203,
	add	x0, x0, :lo12:gpu_res	// tmp202, tmp203,
	ldr	x1, [x0]	// gpu_res.34_26, gpu_res
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _27, i
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _28, _27,
	add	x0, x1, x0	// _29, gpu_res.34_26, _28
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _30, _29->r0
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _30,
	bne	.L28		//,
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.32_104,
	b	.L29		//
.L28:
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.32_104,
.L29:
// MP_Relax_WO_Fence.cpp:166:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.32_104,
	beq	.L30		//,
// MP_Relax_WO_Fence.cpp:167:             res_cpu0_gpu1++;
	ldr	w0, [sp, 48]	// tmp205, res_cpu0_gpu1
	add	w0, w0, 1	// tmp204, tmp205,
	str	w0, [sp, 48]	// tmp204, res_cpu0_gpu1
	b	.L24		//
.L30:
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp207,
	add	x0, x0, :lo12:cpu_res	// tmp206, tmp207,
	ldr	x1, [x0]	// cpu_res.37_31, cpu_res
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _32, i
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _33, _32,
	add	x0, x1, x0	// _34, cpu_res.37_31, _33
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _35, _34->r0
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _35,
	bne	.L31		//,
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp209,
	add	x0, x0, :lo12:gpu_res	// tmp208, tmp209,
	ldr	x1, [x0]	// gpu_res.38_36, gpu_res
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _37, i
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _38, _37,
	add	x0, x1, x0	// _39, gpu_res.38_36, _38
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _40, _39->r0
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _40,
	bne	.L31		//,
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.36_105,
	b	.L32		//
.L31:
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.36_105,
.L32:
// MP_Relax_WO_Fence.cpp:168:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.36_105,
	beq	.L33		//,
// MP_Relax_WO_Fence.cpp:169:             res_cpu1_gpu1++;
	ldr	w0, [sp, 52]	// tmp211, res_cpu1_gpu1
	add	w0, w0, 1	// tmp210, tmp211,
	str	w0, [sp, 52]	// tmp210, res_cpu1_gpu1
	b	.L24		//
.L33:
// MP_Relax_WO_Fence.cpp:172:             res_cpu2_gpu2++;
	ldr	w0, [sp, 56]	// tmp213, res_cpu2_gpu2
	add	w0, w0, 1	// tmp212, tmp213,
	str	w0, [sp, 56]	// tmp212, res_cpu2_gpu2
.L24:
// MP_Relax_WO_Fence.cpp:161:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// tmp215, i
	add	w0, w0, 1	// tmp214, tmp215,
	str	w0, [sp, 60]	// tmp214, i
.L20:
// MP_Relax_WO_Fence.cpp:161:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// i.39_41, i
// MP_Relax_WO_Fence.cpp:161:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 28]	// tmp216, t_range
	cmp	w1, w0	// tmp216, i.39_41
	bhi	.L34		//,
// MP_Relax_WO_Fence.cpp:176:     std::cout << "Message Passing (MP) Litmus Test Results with RELAXED ORDERING:" << std::endl;
	adrp	x0, .LC0	// tmp217,
	add	x1, x0, :lo12:.LC0	//, tmp217,
	adrp	x0, :got:_ZSt4cout	// tmp218,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp218,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _42,
// MP_Relax_WO_Fence.cpp:176:     std::cout << "Message Passing (MP) Litmus Test Results with RELAXED ORDERING:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp219,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp219,
	mov	x0, x2	//, _42
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:177:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC1	// tmp220,
	add	x1, x0, :lo12:.LC1	//, tmp220,
	adrp	x0, :got:_ZSt4cout	// tmp221,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp221,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence.cpp:177:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 40]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _44,
// MP_Relax_WO_Fence.cpp:177:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp222,
	add	x1, x0, :lo12:.LC2	//, tmp222,
	mov	x0, x2	//, _44
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _45,
// MP_Relax_WO_Fence.cpp:177:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 40]	// tmp223, res_cpu0_gpu0
	ucvtf	d0, w0	// _46, tmp223
	mov	x0, 4636737291354636288	// tmp282,
	fmov	d1, x0	// tmp224, tmp282
	fmul	d1, d0, d1	// _47, _46, tmp224
// MP_Relax_WO_Fence.cpp:177:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp225, t_range
	ucvtf	d0, w0	// _48, tmp225
	fdiv	d0, d1, d0	// _49, _47, _48
	mov	x0, x1	//, _45
	bl	_ZNSolsEd		//
	mov	x2, x0	// _50,
// MP_Relax_WO_Fence.cpp:177:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp226,
	add	x1, x0, :lo12:.LC3	//, tmp226,
	mov	x0, x2	//, _50
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _51,
// MP_Relax_WO_Fence.cpp:177:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp227,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp227,
	mov	x0, x2	//, _51
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:178:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp228,
	add	x1, x0, :lo12:.LC4	//, tmp228,
	adrp	x0, :got:_ZSt4cout	// tmp229,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp229,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence.cpp:178:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _53,
// MP_Relax_WO_Fence.cpp:178:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp230,
	add	x1, x0, :lo12:.LC2	//, tmp230,
	mov	x0, x2	//, _53
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _54,
// MP_Relax_WO_Fence.cpp:178:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 52]	// tmp231, res_cpu1_gpu1
	ucvtf	d0, w0	// _55, tmp231
	mov	x0, 4636737291354636288	// tmp283,
	fmov	d1, x0	// tmp232, tmp283
	fmul	d1, d0, d1	// _56, _55, tmp232
// MP_Relax_WO_Fence.cpp:178:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp233, t_range
	ucvtf	d0, w0	// _57, tmp233
	fdiv	d0, d1, d0	// _58, _56, _57
	mov	x0, x1	//, _54
	bl	_ZNSolsEd		//
	mov	x2, x0	// _59,
// MP_Relax_WO_Fence.cpp:178:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp234,
	add	x1, x0, :lo12:.LC3	//, tmp234,
	mov	x0, x2	//, _59
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _60,
// MP_Relax_WO_Fence.cpp:178:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp235,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp235,
	mov	x0, x2	//, _60
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:179:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp236,
	add	x1, x0, :lo12:.LC5	//, tmp236,
	adrp	x0, :got:_ZSt4cout	// tmp237,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp237,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence.cpp:179:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _62,
// MP_Relax_WO_Fence.cpp:179:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp238,
	add	x1, x0, :lo12:.LC2	//, tmp238,
	mov	x0, x2	//, _62
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _63,
// MP_Relax_WO_Fence.cpp:179:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 44]	// tmp239, res_cpu1_gpu0
	ucvtf	d0, w0	// _64, tmp239
	mov	x0, 4636737291354636288	// tmp284,
	fmov	d1, x0	// tmp240, tmp284
	fmul	d1, d0, d1	// _65, _64, tmp240
// MP_Relax_WO_Fence.cpp:179:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp241, t_range
	ucvtf	d0, w0	// _66, tmp241
	fdiv	d0, d1, d0	// _67, _65, _66
	mov	x0, x1	//, _63
	bl	_ZNSolsEd		//
	mov	x2, x0	// _68,
// MP_Relax_WO_Fence.cpp:179:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp242,
	add	x1, x0, :lo12:.LC3	//, tmp242,
	mov	x0, x2	//, _68
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _69,
// MP_Relax_WO_Fence.cpp:179:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp243,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp243,
	mov	x0, x2	//, _69
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:180:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC6	// tmp244,
	add	x1, x0, :lo12:.LC6	//, tmp244,
	adrp	x0, :got:_ZSt4cout	// tmp245,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp245,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence.cpp:180:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _71,
// MP_Relax_WO_Fence.cpp:180:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp246,
	add	x1, x0, :lo12:.LC2	//, tmp246,
	mov	x0, x2	//, _71
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _72,
// MP_Relax_WO_Fence.cpp:180:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 48]	// tmp247, res_cpu0_gpu1
	ucvtf	d0, w0	// _73, tmp247
	mov	x0, 4636737291354636288	// tmp285,
	fmov	d1, x0	// tmp248, tmp285
	fmul	d1, d0, d1	// _74, _73, tmp248
// MP_Relax_WO_Fence.cpp:180:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp249, t_range
	ucvtf	d0, w0	// _75, tmp249
	fdiv	d0, d1, d0	// _76, _74, _75
	mov	x0, x1	//, _72
	bl	_ZNSolsEd		//
	mov	x2, x0	// _77,
// MP_Relax_WO_Fence.cpp:180:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp250,
	add	x1, x0, :lo12:.LC3	//, tmp250,
	mov	x0, x2	//, _77
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _78,
// MP_Relax_WO_Fence.cpp:180:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp251,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp251,
	mov	x0, x2	//, _78
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:181:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, .LC7	// tmp252,
	add	x1, x0, :lo12:.LC7	//, tmp252,
	adrp	x0, :got:_ZSt4cout	// tmp253,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp253,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence.cpp:181:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 56]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _80,
// MP_Relax_WO_Fence.cpp:181:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp254,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp254,
	mov	x0, x2	//, _80
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:183:     if (res_cpu1_gpu0 > 0) {
	ldr	w0, [sp, 44]	// tmp255, res_cpu1_gpu0
	cmp	w0, 0	// tmp255,
	beq	.L35		//,
// MP_Relax_WO_Fence.cpp:184:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp256,
	add	x1, x0, :lo12:.LC8	//, tmp256,
	adrp	x0, :got:_ZSt4cout	// tmp257,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp257,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _81,
// MP_Relax_WO_Fence.cpp:184:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp258,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp258,
	mov	x0, x2	//, _81
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:185:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	adrp	x0, .LC9	// tmp259,
	add	x1, x0, :lo12:.LC9	//, tmp259,
	adrp	x0, :got:_ZSt4cout	// tmp260,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp260,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence.cpp:185:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _83,
// MP_Relax_WO_Fence.cpp:185:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	adrp	x0, .LC10	// tmp261,
	add	x1, x0, :lo12:.LC10	//, tmp261,
	mov	x0, x2	//, _83
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _84,
// MP_Relax_WO_Fence.cpp:185:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp262,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp262,
	mov	x0, x2	//, _84
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:186:         std::cout << "    This indicates memory ordering violations as expected with relaxed semantics" << std::endl;
	adrp	x0, .LC11	// tmp263,
	add	x1, x0, :lo12:.LC11	//, tmp263,
	adrp	x0, :got:_ZSt4cout	// tmp264,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp264,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _85,
// MP_Relax_WO_Fence.cpp:186:         std::cout << "    This indicates memory ordering violations as expected with relaxed semantics" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp265,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp265,
	mov	x0, x2	//, _85
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:187:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp266,
	add	x1, x0, :lo12:.LC8	//, tmp266,
	adrp	x0, :got:_ZSt4cout	// tmp267,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp267,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _86,
// MP_Relax_WO_Fence.cpp:187:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp268,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp268,
	mov	x0, x2	//, _86
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:188:         return 2;
	mov	w0, 2	// _106,
	b	.L36		//
.L35:
// MP_Relax_WO_Fence.cpp:190:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp269,
	add	x1, x0, :lo12:.LC8	//, tmp269,
	adrp	x0, :got:_ZSt4cout	// tmp270,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp270,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _87,
// MP_Relax_WO_Fence.cpp:190:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp271,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp271,
	mov	x0, x2	//, _87
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:191:         std::cout << "    No forbidden behavior observed (x=1, flag=0)" << std::endl;
	adrp	x0, .LC12	// tmp272,
	add	x1, x0, :lo12:.LC12	//, tmp272,
	adrp	x0, :got:_ZSt4cout	// tmp273,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp273,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _88,
// MP_Relax_WO_Fence.cpp:191:         std::cout << "    No forbidden behavior observed (x=1, flag=0)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp274,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp274,
	mov	x0, x2	//, _88
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:192:         std::cout << "    Even with relaxed semantics, no reordering was detected" << std::endl;
	adrp	x0, .LC13	// tmp275,
	add	x1, x0, :lo12:.LC13	//, tmp275,
	adrp	x0, :got:_ZSt4cout	// tmp276,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp276,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _89,
// MP_Relax_WO_Fence.cpp:192:         std::cout << "    Even with relaxed semantics, no reordering was detected" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp277,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp277,
	mov	x0, x2	//, _89
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:193:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp278,
	add	x1, x0, :lo12:.LC8	//, tmp278,
	adrp	x0, :got:_ZSt4cout	// tmp279,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp279,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _90,
// MP_Relax_WO_Fence.cpp:193:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp280,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp280,
	mov	x0, x2	//, _90
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:194:         return 0;
	mov	w0, 0	// _106,
.L36:
// MP_Relax_WO_Fence.cpp:196: }
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
.LC14:
	.string	"usage: %s <thread_count>\n"
	.align	3
.LC15:
	.string	"Starting %d threads for MP litmus test with RELAXED ordering...\n"
	.align	3
.LC16:
	.string	"This test is DESIGNED to expose the forbidden outcome (x=1, flag=0)"
	.align	3
.LC17:
	.string	"Random delays generated with high variability (0-"
	.align	3
.LC18:
	.string	" cycles)"
	.align	3
.LC19:
	.string	"int main(int, char**)"
	.align	3
.LC20:
	.string	"MP_Relax_WO_Fence.cpp"
	.align	3
.LC21:
	.string	"threads != NULL"
	.align	3
.LC22:
	.string	"createResult == 0"
	.align	3
.LC23:
	.string	"local[0] = %lld\n"
	.align	3
.LC24:
	.string	"joinResult == 0"
	.align	3
.LC25:
	.string	"local[%d] = %lld\n"
	.align	3
.LC26:
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
// MP_Relax_WO_Fence.cpp:201: {
	adrp	x0, :got:__stack_chk_guard	// tmp174,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp173, tmp174,
	ldr	x1, [x0]	// tmp322,
	str	x1, [sp, 104]	// tmp322, D.48663
	mov	x1, 0	// tmp322
// MP_Relax_WO_Fence.cpp:202:     if (argc != 2) { 
	ldr	w0, [sp, 28]	// tmp175, argc
	cmp	w0, 2	// tmp175,
	beq	.L38		//,
// MP_Relax_WO_Fence.cpp:203:         printf("usage: %s <thread_count>\n", argv[0]);
	ldr	x0, [sp, 16]	// tmp176, argv
	ldr	x0, [x0]	// _1, *argv_90(D)
	mov	x1, x0	//, _1
	adrp	x0, .LC14	// tmp177,
	add	x0, x0, :lo12:.LC14	//, tmp177,
	bl	printf		//
// MP_Relax_WO_Fence.cpp:204:         exit(1);
	mov	w0, 1	//,
	bl	exit		//
.L38:
// MP_Relax_WO_Fence.cpp:206:     int thread_count = atoi(argv[1]);
	ldr	x0, [sp, 16]	// tmp178, argv
	add	x0, x0, 8	// _2, tmp178,
// MP_Relax_WO_Fence.cpp:206:     int thread_count = atoi(argv[1]);
	ldr	x0, [x0]	// _3, *_2
	bl	atoi		//
	str	w0, [sp, 60]	//, thread_count
// MP_Relax_WO_Fence.cpp:208:     printf("Starting %d threads for MP litmus test with RELAXED ordering...\n", thread_count);
	ldr	w1, [sp, 60]	//, thread_count
	adrp	x0, .LC15	// tmp179,
	add	x0, x0, :lo12:.LC15	//, tmp179,
	bl	printf		//
// MP_Relax_WO_Fence.cpp:209:     printf("This test is DESIGNED to expose the forbidden outcome (x=1, flag=0)\n");
	adrp	x0, .LC16	// tmp180,
	add	x0, x0, :lo12:.LC16	//, tmp180,
	bl	puts		//
// MP_Relax_WO_Fence.cpp:211:     auto num_iterations = DEF_RUNS; 
	mov	w0, 34464	// tmp181,
	movk	w0, 0x1, lsl 16	// tmp181,,
	str	w0, [sp, 64]	// tmp181, num_iterations
// MP_Relax_WO_Fence.cpp:212:     auto t_range = num_iterations;
	ldr	w0, [sp, 64]	// tmp182, num_iterations
	str	w0, [sp, 68]	// tmp182, t_range
// MP_Relax_WO_Fence.cpp:215:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	ldrsw	x0, [sp, 68]	// _4, t_range
// MP_Relax_WO_Fence.cpp:215:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	lsl	x0, x0, 7	// _5, _4,
	bl	malloc		//
	mov	x1, x0	// _6, tmp183
// MP_Relax_WO_Fence.cpp:215:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	adrp	x0, var	// tmp185,
	add	x0, x0, :lo12:var	// tmp184, tmp185,
	str	x1, [x0]	// _6, var
// MP_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 40]	//, i
// MP_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	b	.L39		//
.L40:
// MP_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	adrp	x0, var	// tmp187,
	add	x0, x0, :lo12:var	// tmp186, tmp187,
	ldr	x1, [x0]	// var.40_7, var
// MP_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	ldrsw	x0, [sp, 40]	// _8, i
// MP_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	lsl	x0, x0, 7	// _9, _8,
	add	x0, x1, x0	// _10, var.40_7, _9
// MP_Relax_WO_Fence.cpp:219:         var[i].a = 0;
	str	wzr, [x0]	//, _10->a
// MP_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	adrp	x0, var	// tmp189,
	add	x0, x0, :lo12:var	// tmp188, tmp189,
	ldr	x1, [x0]	// var.41_11, var
// MP_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	ldrsw	x0, [sp, 40]	// _12, i
// MP_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	lsl	x0, x0, 7	// _13, _12,
	add	x0, x1, x0	// _14, var.41_11, _13
// MP_Relax_WO_Fence.cpp:220:         var[i].b = 0;
	str	wzr, [x0, 64]	//, _14->b
// MP_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 40]	// tmp191, i
	add	w0, w0, 1	// tmp190, tmp191,
	str	w0, [sp, 40]	// tmp190, i
.L39:
// MP_Relax_WO_Fence.cpp:218:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 40]	// tmp192, i
	ldr	w0, [sp, 68]	// tmp193, t_range
	cmp	w1, w0	// tmp192, tmp193
	blt	.L40		//,
// MP_Relax_WO_Fence.cpp:224:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	ldrsw	x0, [sp, 68]	// _15, t_range
// MP_Relax_WO_Fence.cpp:224:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	lsl	x0, x0, 6	// _16, _15,
	bl	malloc		//
	mov	x1, x0	// _17, tmp194
// MP_Relax_WO_Fence.cpp:224:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	adrp	x0, cpu_res	// tmp196,
	add	x0, x0, :lo12:cpu_res	// tmp195, tmp196,
	str	x1, [x0]	// _17, cpu_res
// MP_Relax_WO_Fence.cpp:225:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	ldrsw	x0, [sp, 68]	// _18, t_range
// MP_Relax_WO_Fence.cpp:225:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	lsl	x0, x0, 6	// _19, _18,
	bl	malloc		//
	mov	x1, x0	// _20, tmp197
// MP_Relax_WO_Fence.cpp:225:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	adrp	x0, gpu_res	// tmp199,
	add	x0, x0, :lo12:gpu_res	// tmp198, tmp199,
	str	x1, [x0]	// _20, gpu_res
// MP_Relax_WO_Fence.cpp:228:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 44]	//, i
// MP_Relax_WO_Fence.cpp:228:     for (auto i = 0; i < t_range; ++i) {
	b	.L41		//
.L42:
// MP_Relax_WO_Fence.cpp:229:         cpu_res[i].r0 = 2;
	adrp	x0, cpu_res	// tmp201,
	add	x0, x0, :lo12:cpu_res	// tmp200, tmp201,
	ldr	x1, [x0]	// cpu_res.42_21, cpu_res
// MP_Relax_WO_Fence.cpp:229:         cpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _22, i
// MP_Relax_WO_Fence.cpp:229:         cpu_res[i].r0 = 2;
	lsl	x0, x0, 6	// _23, _22,
	add	x0, x1, x0	// _24, cpu_res.42_21, _23
// MP_Relax_WO_Fence.cpp:229:         cpu_res[i].r0 = 2;
	mov	w1, 2	// tmp202,
	str	w1, [x0]	// tmp202, _24->r0
// MP_Relax_WO_Fence.cpp:230:         gpu_res[i].r0 = 2;
	adrp	x0, gpu_res	// tmp204,
	add	x0, x0, :lo12:gpu_res	// tmp203, tmp204,
	ldr	x1, [x0]	// gpu_res.43_25, gpu_res
// MP_Relax_WO_Fence.cpp:230:         gpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _26, i
// MP_Relax_WO_Fence.cpp:230:         gpu_res[i].r0 = 2;
	lsl	x0, x0, 6	// _27, _26,
	add	x0, x1, x0	// _28, gpu_res.43_25, _27
// MP_Relax_WO_Fence.cpp:230:         gpu_res[i].r0 = 2;
	mov	w1, 2	// tmp205,
	str	w1, [x0]	// tmp205, _28->r0
// MP_Relax_WO_Fence.cpp:228:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 44]	// tmp207, i
	add	w0, w0, 1	// tmp206, tmp207,
	str	w0, [sp, 44]	// tmp206, i
.L41:
// MP_Relax_WO_Fence.cpp:228:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 44]	// tmp208, i
	ldr	w0, [sp, 68]	// tmp209, t_range
	cmp	w1, w0	// tmp208, tmp209
	blt	.L42		//,
// MP_Relax_WO_Fence.cpp:234:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 68]	// _29, t_range
// MP_Relax_WO_Fence.cpp:234:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _30, _29,
	bl	malloc		//
	mov	x1, x0	// _31, tmp210
// MP_Relax_WO_Fence.cpp:234:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand	// tmp212,
	add	x0, x0, :lo12:cpu_rand	// tmp211, tmp212,
	str	x1, [x0]	// _31, cpu_rand
// MP_Relax_WO_Fence.cpp:235:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 68]	// _32, t_range
// MP_Relax_WO_Fence.cpp:235:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _33, _32,
	bl	malloc		//
	mov	x1, x0	// _34, tmp213
// MP_Relax_WO_Fence.cpp:235:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand	// tmp215,
	add	x0, x0, :lo12:gpu_rand	// tmp214, tmp215,
	str	x1, [x0]	// _34, gpu_rand
// MP_Relax_WO_Fence.cpp:238:     for (int iter = 0; iter < num_iterations; iter++) {
	str	wzr, [sp, 48]	//, iter
// MP_Relax_WO_Fence.cpp:238:     for (int iter = 0; iter < num_iterations; iter++) {
	b	.L43		//
.L46:
// MP_Relax_WO_Fence.cpp:239:         auto g_tid = iter;
	ldr	w0, [sp, 48]	// tmp216, iter
	str	w0, [sp, 84]	// tmp216, g_tid
// MP_Relax_WO_Fence.cpp:242:         unsigned rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _35,
// MP_Relax_WO_Fence.cpp:242:         unsigned rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp218,
	movk	w0, 0x6666, lsl 16	// tmp218,,
	smull	x0, w2, w0	// tmp217, _35, tmp218
	lsr	x0, x0, 32	// tmp219, tmp217,
	asr	w1, w0, 8	// tmp220, tmp219,
	asr	w0, w2, 31	// tmp221, _35,
	sub	w1, w1, w0	// _36, tmp220, tmp221
	mov	w0, w1	// tmp222, _36
	lsl	w0, w0, 2	// tmp223, tmp222,
	add	w0, w0, w1	// tmp222, tmp222, _36
	lsl	w0, w0, 7	// tmp224, tmp222,
	sub	w1, w2, w0	// _36, _35, tmp222
// MP_Relax_WO_Fence.cpp:242:         unsigned rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 52]	// _36, rand_val
// MP_Relax_WO_Fence.cpp:243:         if (std::rand() % 10 < 2) {  // 20% chance of very large delay
	bl	rand		//
	mov	w2, w0	// _37,
// MP_Relax_WO_Fence.cpp:243:         if (std::rand() % 10 < 2) {  // 20% chance of very large delay
	mov	w0, 26215	// tmp226,
	movk	w0, 0x6666, lsl 16	// tmp226,,
	smull	x0, w2, w0	// tmp225, _37, tmp226
	lsr	x0, x0, 32	// tmp227, tmp225,
	asr	w1, w0, 2	// tmp228, tmp227,
	asr	w0, w2, 31	// tmp229, _37,
	sub	w1, w1, w0	// _38, tmp228, tmp229
	mov	w0, w1	// tmp230, _38
	lsl	w0, w0, 2	// tmp231, tmp230,
	add	w0, w0, w1	// tmp230, tmp230, _38
	lsl	w0, w0, 1	// tmp232, tmp230,
	sub	w1, w2, w0	// _38, _37, tmp230
// MP_Relax_WO_Fence.cpp:243:         if (std::rand() % 10 < 2) {  // 20% chance of very large delay
	cmp	w1, 1	// _38,
	cset	w0, le	// tmp234,
	and	w0, w0, 255	// retval.44_154, tmp233
// MP_Relax_WO_Fence.cpp:243:         if (std::rand() % 10 < 2) {  // 20% chance of very large delay
	cmp	w0, 0	// retval.44_154,
	beq	.L44		//,
// MP_Relax_WO_Fence.cpp:244:             rand_val = rand_val * 3;
	ldr	w1, [sp, 52]	// tmp235, rand_val
	mov	w0, w1	// tmp236, tmp235
	lsl	w0, w0, 1	// tmp237, tmp236,
	add	w0, w0, w1	// tmp238, tmp236, tmp235
	str	w0, [sp, 52]	// tmp238, rand_val
.L44:
// MP_Relax_WO_Fence.cpp:246:         cpu_rand[g_tid] = rand_val;
	adrp	x0, cpu_rand	// tmp240,
	add	x0, x0, :lo12:cpu_rand	// tmp239, tmp240,
	ldr	x1, [x0]	// cpu_rand.45_39, cpu_rand
// MP_Relax_WO_Fence.cpp:246:         cpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 84]	// _40, g_tid
// MP_Relax_WO_Fence.cpp:246:         cpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _41, _40,
	add	x0, x1, x0	// _42, cpu_rand.45_39, _41
// MP_Relax_WO_Fence.cpp:246:         cpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 52]	// tmp241, rand_val
	str	w1, [x0]	// tmp241, *_42
// MP_Relax_WO_Fence.cpp:249:         rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _43,
// MP_Relax_WO_Fence.cpp:249:         rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp243,
	movk	w0, 0x6666, lsl 16	// tmp243,,
	smull	x0, w2, w0	// tmp242, _43, tmp243
	lsr	x0, x0, 32	// tmp244, tmp242,
	asr	w1, w0, 8	// tmp245, tmp244,
	asr	w0, w2, 31	// tmp246, _43,
	sub	w1, w1, w0	// _44, tmp245, tmp246
	mov	w0, w1	// tmp247, _44
	lsl	w0, w0, 2	// tmp248, tmp247,
	add	w0, w0, w1	// tmp247, tmp247, _44
	lsl	w0, w0, 7	// tmp249, tmp247,
	sub	w1, w2, w0	// _44, _43, tmp247
// MP_Relax_WO_Fence.cpp:249:         rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 52]	// _44, rand_val
// MP_Relax_WO_Fence.cpp:250:         if (std::rand() % 10 < 1) {  // 10% chance of very small delay
	bl	rand		//
	mov	w2, w0	// _45,
// MP_Relax_WO_Fence.cpp:250:         if (std::rand() % 10 < 1) {  // 10% chance of very small delay
	mov	w0, 26215	// tmp251,
	movk	w0, 0x6666, lsl 16	// tmp251,,
	smull	x0, w2, w0	// tmp250, _45, tmp251
	lsr	x0, x0, 32	// tmp252, tmp250,
	asr	w1, w0, 2	// tmp253, tmp252,
	asr	w0, w2, 31	// tmp254, _45,
	sub	w1, w1, w0	// _46, tmp253, tmp254
	mov	w0, w1	// tmp255, _46
	lsl	w0, w0, 2	// tmp256, tmp255,
	add	w0, w0, w1	// tmp255, tmp255, _46
	lsl	w0, w0, 1	// tmp257, tmp255,
	sub	w1, w2, w0	// _46, _45, tmp255
// MP_Relax_WO_Fence.cpp:250:         if (std::rand() % 10 < 1) {  // 10% chance of very small delay
	cmp	w1, 0	// _46,
	cset	w0, le	// tmp259,
	and	w0, w0, 255	// retval.46_160, tmp258
// MP_Relax_WO_Fence.cpp:250:         if (std::rand() % 10 < 1) {  // 10% chance of very small delay
	cmp	w0, 0	// retval.46_160,
	beq	.L45		//,
// MP_Relax_WO_Fence.cpp:251:             rand_val = rand_val / 10;
	ldr	w1, [sp, 52]	// tmp261, rand_val
	mov	w0, 52429	// tmp263,
	movk	w0, 0xcccc, lsl 16	// tmp263,,
	umull	x0, w1, w0	// tmp262, tmp261, tmp263
	lsr	x0, x0, 32	// tmp264, tmp262,
	lsr	w0, w0, 3	// tmp260, tmp264,
	str	w0, [sp, 52]	// tmp260, rand_val
.L45:
// MP_Relax_WO_Fence.cpp:253:         gpu_rand[g_tid] = rand_val;
	adrp	x0, gpu_rand	// tmp266,
	add	x0, x0, :lo12:gpu_rand	// tmp265, tmp266,
	ldr	x1, [x0]	// gpu_rand.47_47, gpu_rand
// MP_Relax_WO_Fence.cpp:253:         gpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 84]	// _48, g_tid
// MP_Relax_WO_Fence.cpp:253:         gpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _49, _48,
	add	x0, x1, x0	// _50, gpu_rand.47_47, _49
// MP_Relax_WO_Fence.cpp:253:         gpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 52]	// tmp267, rand_val
	str	w1, [x0]	// tmp267, *_50
// MP_Relax_WO_Fence.cpp:238:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w0, [sp, 48]	// tmp269, iter
	add	w0, w0, 1	// tmp268, tmp269,
	str	w0, [sp, 48]	// tmp268, iter
.L43:
// MP_Relax_WO_Fence.cpp:238:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w1, [sp, 48]	// tmp270, iter
	ldr	w0, [sp, 64]	// tmp271, num_iterations
	cmp	w1, w0	// tmp270, tmp271
	blt	.L46		//,
// MP_Relax_WO_Fence.cpp:256:     std::cout << "Random delays generated with high variability (0-" << RAND_RANGE*3 << " cycles)" << std::endl;
	adrp	x0, .LC17	// tmp272,
	add	x1, x0, :lo12:.LC17	//, tmp272,
	adrp	x0, :got:_ZSt4cout	// tmp273,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp273,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence.cpp:256:     std::cout << "Random delays generated with high variability (0-" << RAND_RANGE*3 << " cycles)" << std::endl;
	mov	w1, 1920	//,
	bl	_ZNSolsEi		//
	mov	x2, x0	// _52,
	adrp	x0, .LC18	// tmp274,
	add	x1, x0, :lo12:.LC18	//, tmp274,
	mov	x0, x2	//, _52
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _53,
// MP_Relax_WO_Fence.cpp:256:     std::cout << "Random delays generated with high variability (0-" << RAND_RANGE*3 << " cycles)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp275,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp275,
	mov	x0, x2	//, _53
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:260:     pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
	ldrsw	x0, [sp, 60]	// _54, thread_count
	mov	x1, 8	//,
	bl	calloc		//
	str	x0, [sp, 96]	// tmp276, threads
// MP_Relax_WO_Fence.cpp:261:     pthread_barrier_init(&barrier, NULL, (thread_count));
	ldr	w0, [sp, 60]	// thread_count.48_55, thread_count
	mov	w2, w0	//, thread_count.48_55
	mov	x1, 0	//,
	adrp	x0, barrier	// tmp277,
	add	x0, x0, :lo12:barrier	//, tmp277,
	bl	pthread_barrier_init		//
// MP_Relax_WO_Fence.cpp:262:     assert(threads != NULL);
	ldr	x0, [sp, 96]	// tmp278, threads
	cmp	x0, 0	// tmp278,
	bne	.L47		//,
// MP_Relax_WO_Fence.cpp:262:     assert(threads != NULL);
	adrp	x0, .LC19	// tmp279,
	add	x3, x0, :lo12:.LC19	//, tmp279,
	mov	w2, 262	//,
	adrp	x0, .LC20	// tmp280,
	add	x1, x0, :lo12:.LC20	//, tmp280,
	adrp	x0, .LC21	// tmp281,
	add	x0, x0, :lo12:.LC21	//, tmp281,
	bl	__assert_fail		//
.L47:
// MP_Relax_WO_Fence.cpp:264:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp282,
	str	w0, [sp, 56]	// tmp282, i
// MP_Relax_WO_Fence.cpp:264:     for (i = 1 ; i < thread_count; i++) {
	b	.L48		//
.L50:
// MP_Relax_WO_Fence.cpp:265:         int createResult = pthread_create(&threads[i], 
	ldrsw	x0, [sp, 56]	// _56, i
// MP_Relax_WO_Fence.cpp:265:         int createResult = pthread_create(&threads[i], 
	lsl	x0, x0, 3	// _57, _56,
// MP_Relax_WO_Fence.cpp:265:         int createResult = pthread_create(&threads[i], 
	ldr	x1, [sp, 96]	// tmp283, threads
	add	x4, x1, x0	// _58, tmp283, _57
// MP_Relax_WO_Fence.cpp:268:                                           (void*)i);
	ldrsw	x0, [sp, 56]	// _59, i
// MP_Relax_WO_Fence.cpp:265:         int createResult = pthread_create(&threads[i], 
	mov	x3, x0	//, _60
	adrp	x0, _Z5runMPPv	// tmp284,
	add	x2, x0, :lo12:_Z5runMPPv	//, tmp284,
	mov	x1, 0	//,
	mov	x0, x4	//, _58
	bl	pthread_create		//
	str	w0, [sp, 80]	//, createResult
// MP_Relax_WO_Fence.cpp:269:         assert(createResult == 0);
	ldr	w0, [sp, 80]	// tmp285, createResult
	cmp	w0, 0	// tmp285,
	beq	.L49		//,
// MP_Relax_WO_Fence.cpp:269:         assert(createResult == 0);
	adrp	x0, .LC19	// tmp286,
	add	x3, x0, :lo12:.LC19	//, tmp286,
	mov	w2, 269	//,
	adrp	x0, .LC20	// tmp287,
	add	x1, x0, :lo12:.LC20	//, tmp287,
	adrp	x0, .LC22	// tmp288,
	add	x0, x0, :lo12:.LC22	//, tmp288,
	bl	__assert_fail		//
.L49:
// MP_Relax_WO_Fence.cpp:264:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 56]	// tmp290, i
	add	w0, w0, 1	// tmp289, tmp290,
	str	w0, [sp, 56]	// tmp289, i
.L48:
// MP_Relax_WO_Fence.cpp:264:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 56]	// tmp291, i
	ldr	w0, [sp, 60]	// tmp292, thread_count
	cmp	w1, w0	// tmp291, tmp292
	blt	.L50		//,
// MP_Relax_WO_Fence.cpp:272:     long long int local = (long long int)runMP((void*)0);
	mov	x0, 0	//,
	bl	_Z5runMPPv		//
// MP_Relax_WO_Fence.cpp:272:     long long int local = (long long int)runMP((void*)0);
	str	x0, [sp, 88]	// _62, local
// MP_Relax_WO_Fence.cpp:273:     printf("local[0] = %lld\n", local);
	ldr	x0, [sp, 88]	// local.49_63, local
	mov	x1, x0	//, local.49_63
	adrp	x0, .LC23	// tmp293,
	add	x0, x0, :lo12:.LC23	//, tmp293,
	bl	printf		//
// MP_Relax_WO_Fence.cpp:276:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp294,
	str	w0, [sp, 56]	// tmp294, i
// MP_Relax_WO_Fence.cpp:276:     for (i = 1 ; i < thread_count; i++) {
	b	.L51		//
.L53:
// MP_Relax_WO_Fence.cpp:277:         int joinResult = pthread_join(threads[i], 
	ldrsw	x0, [sp, 56]	// _64, i
// MP_Relax_WO_Fence.cpp:277:         int joinResult = pthread_join(threads[i], 
	lsl	x0, x0, 3	// _65, _64,
	ldr	x1, [sp, 96]	// tmp295, threads
	add	x0, x1, x0	// _66, tmp295, _65
// MP_Relax_WO_Fence.cpp:277:         int joinResult = pthread_join(threads[i], 
	ldr	x0, [x0]	// _67, *_66
	add	x1, sp, 88	// tmp296,,
	bl	pthread_join		//
	str	w0, [sp, 76]	// _141, joinResult
// MP_Relax_WO_Fence.cpp:279:         assert(joinResult == 0);
	ldr	w0, [sp, 76]	// tmp297, joinResult
	cmp	w0, 0	// tmp297,
	beq	.L52		//,
// MP_Relax_WO_Fence.cpp:279:         assert(joinResult == 0);
	adrp	x0, .LC19	// tmp298,
	add	x3, x0, :lo12:.LC19	//, tmp298,
	mov	w2, 279	//,
	adrp	x0, .LC20	// tmp299,
	add	x1, x0, :lo12:.LC20	//, tmp299,
	adrp	x0, .LC24	// tmp300,
	add	x0, x0, :lo12:.LC24	//, tmp300,
	bl	__assert_fail		//
.L52:
// MP_Relax_WO_Fence.cpp:280:         printf("local[%d] = %lld\n", i, local);
	ldr	x0, [sp, 88]	// local.50_68, local
	mov	x2, x0	//, local.50_68
	ldr	w1, [sp, 56]	//, i
	adrp	x0, .LC25	// tmp301,
	add	x0, x0, :lo12:.LC25	//, tmp301,
	bl	printf		//
// MP_Relax_WO_Fence.cpp:276:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 56]	// tmp303, i
	add	w0, w0, 1	// tmp302, tmp303,
	str	w0, [sp, 56]	// tmp302, i
.L51:
// MP_Relax_WO_Fence.cpp:276:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 56]	// tmp304, i
	ldr	w0, [sp, 60]	// tmp305, thread_count
	cmp	w1, w0	// tmp304, tmp305
	blt	.L53		//,
// MP_Relax_WO_Fence.cpp:284:     std::cout << "Validating..." << std::endl;
	adrp	x0, .LC26	// tmp306,
	add	x1, x0, :lo12:.LC26	//, tmp306,
	adrp	x0, :got:_ZSt4cout	// tmp307,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp307,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _69,
// MP_Relax_WO_Fence.cpp:284:     std::cout << "Validating..." << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp308,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp308,
	mov	x0, x2	//, _69
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence.cpp:285:     int res = check_output(t_range);
	ldr	w0, [sp, 68]	// t_range.51_70, t_range
	bl	_Z12check_outputj		//
	str	w0, [sp, 72]	// _130, res
// MP_Relax_WO_Fence.cpp:288:     free(threads);
	ldr	x0, [sp, 96]	//, threads
	bl	free		//
// MP_Relax_WO_Fence.cpp:289:     free((void*)var);
	adrp	x0, var	// tmp310,
	add	x0, x0, :lo12:var	// tmp309, tmp310,
	ldr	x0, [x0]	// var.52_71, var
	bl	free		//
// MP_Relax_WO_Fence.cpp:290:     free((void*)cpu_res);
	adrp	x0, cpu_res	// tmp312,
	add	x0, x0, :lo12:cpu_res	// tmp311, tmp312,
	ldr	x0, [x0]	// cpu_res.53_72, cpu_res
	bl	free		//
// MP_Relax_WO_Fence.cpp:291:     free((void*)gpu_res);
	adrp	x0, gpu_res	// tmp314,
	add	x0, x0, :lo12:gpu_res	// tmp313, tmp314,
	ldr	x0, [x0]	// gpu_res.54_73, gpu_res
	bl	free		//
// MP_Relax_WO_Fence.cpp:292:     free((void*)cpu_rand);
	adrp	x0, cpu_rand	// tmp316,
	add	x0, x0, :lo12:cpu_rand	// tmp315, tmp316,
	ldr	x0, [x0]	// cpu_rand.55_74, cpu_rand
	bl	free		//
// MP_Relax_WO_Fence.cpp:293:     free((void*)gpu_rand);
	adrp	x0, gpu_rand	// tmp318,
	add	x0, x0, :lo12:gpu_rand	// tmp317, tmp318,
	ldr	x0, [x0]	// gpu_rand.56_75, gpu_rand
	bl	free		//
// MP_Relax_WO_Fence.cpp:295:     return 0;
	mov	w0, 0	// _138,
// MP_Relax_WO_Fence.cpp:296: }
	mov	w1, w0	// <retval>, _138
	adrp	x0, :got:__stack_chk_guard	// tmp321,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp320, tmp321,
	ldr	x3, [sp, 104]	// tmp323, D.48663
	ldr	x2, [x0]	// tmp324,
	subs	x3, x3, x2	// tmp323, tmp324
	mov	x2, 0	// tmp324
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
// MP_Relax_WO_Fence.cpp:296: }
	ldr	w0, [sp, 28]	// tmp92, __initialize_p
	cmp	w0, 1	// tmp92,
	bne	.L58		//,
// MP_Relax_WO_Fence.cpp:296: }
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
// MP_Relax_WO_Fence.cpp:296: }
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
// MP_Relax_WO_Fence.cpp:296: }
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
