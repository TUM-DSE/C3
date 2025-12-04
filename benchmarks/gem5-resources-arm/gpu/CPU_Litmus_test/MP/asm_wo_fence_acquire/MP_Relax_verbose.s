	.arch armv8-a
	.file	"MP_Relax_WO_Fence_Acquire.cpp"
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
// MP_Relax_WO_Fence_Acquire.cpp:75:     if (rand() % 10 < 3) {
	bl	rand		//
	mov	w2, w0	// _1,
// MP_Relax_WO_Fence_Acquire.cpp:75:     if (rand() % 10 < 3) {
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
// MP_Relax_WO_Fence_Acquire.cpp:75:     if (rand() % 10 < 3) {
	cmp	w1, 2	// _2,
	cset	w0, le	// tmp118,
	and	w0, w0, 255	// retval.15_20, tmp117
// MP_Relax_WO_Fence_Acquire.cpp:75:     if (rand() % 10 < 3) {
	cmp	w0, 0	// retval.15_20,
	beq	.L4		//,
// MP_Relax_WO_Fence_Acquire.cpp:76:         delay = rand() % 10;
	bl	rand		//
	mov	w1, w0	// _3,
// MP_Relax_WO_Fence_Acquire.cpp:76:         delay = rand() % 10;
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
// MP_Relax_WO_Fence_Acquire.cpp:77:     } else if (rand() % 10 < 1) {
	bl	rand		//
	mov	w2, w0	// _4,
// MP_Relax_WO_Fence_Acquire.cpp:77:     } else if (rand() % 10 < 1) {
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
// MP_Relax_WO_Fence_Acquire.cpp:77:     } else if (rand() % 10 < 1) {
	cmp	w1, 0	// _5,
	cset	w0, le	// tmp138,
	and	w0, w0, 255	// retval.16_22, tmp137
// MP_Relax_WO_Fence_Acquire.cpp:77:     } else if (rand() % 10 < 1) {
	cmp	w0, 0	// retval.16_22,
	beq	.L6		//,
// MP_Relax_WO_Fence_Acquire.cpp:78:         delay = rand() % (max_cycles * 2) + max_cycles;
	bl	rand		//
	mov	w1, w0	// _6,
// MP_Relax_WO_Fence_Acquire.cpp:78:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w0, [sp, 28]	// tmp139, max_cycles
	lsl	w0, w0, 1	// _7, tmp139,
// MP_Relax_WO_Fence_Acquire.cpp:78:         delay = rand() % (max_cycles * 2) + max_cycles;
	sdiv	w2, w1, w0	// tmp151, _6, _7
	mul	w0, w2, w0	// tmp152, tmp151, _7
	sub	w0, w1, w0	// _8, _6, tmp152
// MP_Relax_WO_Fence_Acquire.cpp:78:         delay = rand() % (max_cycles * 2) + max_cycles;
	ldr	w1, [sp, 28]	// tmp154, max_cycles
	add	w0, w1, w0	// tmp153, tmp154, _8
	str	w0, [sp, 44]	// tmp153, delay
	b	.L5		//
.L6:
// MP_Relax_WO_Fence_Acquire.cpp:80:         delay = rand() % max_cycles;
	bl	rand		//
// MP_Relax_WO_Fence_Acquire.cpp:80:         delay = rand() % max_cycles;
	ldr	w1, [sp, 28]	// tmp169, max_cycles
	sdiv	w2, w0, w1	// tmp168, _9, tmp169
	ldr	w1, [sp, 28]	// tmp171, max_cycles
	mul	w1, w2, w1	// tmp170, tmp168, tmp171
	sub	w0, w0, w1	// tmp172, _9, tmp170
	str	w0, [sp, 44]	// tmp172, delay
.L5:
// MP_Relax_WO_Fence_Acquire.cpp:83:     volatile int dummy = 0;
	str	wzr, [sp, 36]	//, dummy
// MP_Relax_WO_Fence_Acquire.cpp:84:     for (volatile int i = 0; i < delay; i++) {
	str	wzr, [sp, 40]	//, i
// MP_Relax_WO_Fence_Acquire.cpp:84:     for (volatile int i = 0; i < delay; i++) {
	b	.L7		//
.L8:
// MP_Relax_WO_Fence_Acquire.cpp:85:         dummy++;
	ldr	w0, [sp, 36]	// dummy.17_10, dummy
	add	w0, w0, 1	// _11, dummy.17_10,
	str	w0, [sp, 36]	// _11, dummy
// MP_Relax_WO_Fence_Acquire.cpp:84:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.18_12, i
	add	w0, w0, 1	// _13, i.18_12,
	str	w0, [sp, 40]	// _13, i
.L7:
// MP_Relax_WO_Fence_Acquire.cpp:84:     for (volatile int i = 0; i < delay; i++) {
	ldr	w0, [sp, 40]	// i.20_14, i
// MP_Relax_WO_Fence_Acquire.cpp:84:     for (volatile int i = 0; i < delay; i++) {
	ldr	w1, [sp, 44]	// tmp174, delay
	cmp	w1, w0	// tmp174, i.20_14
	cset	w0, gt	// tmp175,
	and	w0, w0, 255	// retval.19_32, tmp173
	cmp	w0, 0	// retval.19_32,
	bne	.L8		//,
// MP_Relax_WO_Fence_Acquire.cpp:87: }
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
// MP_Relax_WO_Fence_Acquire.cpp:92:     long long int tid = (long long int)arg;
	ldr	x0, [sp, 24]	// tmp155, arg
	str	x0, [sp, 88]	// tmp155, tid
// MP_Relax_WO_Fence_Acquire.cpp:94:     local += tid;
	ldr	x0, [sp, 88]	// tmp156, tid
	mov	w1, w0	// _1, tmp156
	mrs	x0, tpidr_el0	// tmp158
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp157, tmp158,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp157,
	ldr	w0, [x0]	// local.0_2, local
	add	w0, w1, w0	// _4, _1, local.1_3
	mov	w1, w0	// _5, _4
	mrs	x0, tpidr_el0	// tmp160
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp159, tmp160,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp159,
	str	w1, [x0]	// _5, local
// MP_Relax_WO_Fence_Acquire.cpp:95:     pthread_barrier_wait(&barrier);
	adrp	x0, barrier	// tmp161,
	add	x0, x0, :lo12:barrier	//, tmp161,
	bl	pthread_barrier_wait		//
// MP_Relax_WO_Fence_Acquire.cpp:97:     if(tid == 0)
	ldr	x0, [sp, 88]	// tmp162, tid
	cmp	x0, 0	// tmp162,
	bne	.L10		//,
// MP_Relax_WO_Fence_Acquire.cpp:101:         for (int i = 0; i < DEF_RUNS; ++i)
	str	wzr, [sp, 40]	//, i
// MP_Relax_WO_Fence_Acquire.cpp:101:         for (int i = 0; i < DEF_RUNS; ++i)
	b	.L11		//
.L12:
// MP_Relax_WO_Fence_Acquire.cpp:104:             var[i].a = 0;  // x = 0
	adrp	x0, var	// tmp164,
	add	x0, x0, :lo12:var	// tmp163, tmp164,
	ldr	x1, [x0]	// var.2_6, var
// MP_Relax_WO_Fence_Acquire.cpp:104:             var[i].a = 0;  // x = 0
	ldrsw	x0, [sp, 40]	// _7, i
// MP_Relax_WO_Fence_Acquire.cpp:104:             var[i].a = 0;  // x = 0
	lsl	x0, x0, 7	// _8, _7,
	add	x0, x1, x0	// _9, var.2_6, _8
// MP_Relax_WO_Fence_Acquire.cpp:104:             var[i].a = 0;  // x = 0
	str	wzr, [x0]	//, _9->a
// MP_Relax_WO_Fence_Acquire.cpp:105:             var[i].b = 0;  // flag = 0
	adrp	x0, var	// tmp166,
	add	x0, x0, :lo12:var	// tmp165, tmp166,
	ldr	x1, [x0]	// var.3_10, var
// MP_Relax_WO_Fence_Acquire.cpp:105:             var[i].b = 0;  // flag = 0
	ldrsw	x0, [sp, 40]	// _11, i
// MP_Relax_WO_Fence_Acquire.cpp:105:             var[i].b = 0;  // flag = 0
	lsl	x0, x0, 7	// _12, _11,
	add	x0, x1, x0	// _13, var.3_10, _12
// MP_Relax_WO_Fence_Acquire.cpp:105:             var[i].b = 0;  // flag = 0
	str	wzr, [x0, 64]	//, _13->b
// MP_Relax_WO_Fence_Acquire.cpp:107:             random_delay(50);
	mov	w0, 50	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence_Acquire.cpp:110:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp168,
	add	x0, x0, :lo12:var	// tmp167, tmp168,
	ldr	x1, [x0]	// var.4_14, var
// MP_Relax_WO_Fence_Acquire.cpp:110:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 40]	// _15, i
// MP_Relax_WO_Fence_Acquire.cpp:110:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _16, _15,
	add	x0, x1, x0	// _17, var.4_14, _16
// MP_Relax_WO_Fence_Acquire.cpp:110:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 112]	// _17, tmp_a
// MP_Relax_WO_Fence_Acquire.cpp:111:             tmp_a->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 112]	// _18, tmp_a
	str	x0, [sp, 136]	// _18, this
	mov	w0, 1	// tmp169,
	str	w0, [sp, 60]	// tmp169, __i
	str	wzr, [sp, 64]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 64]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 68]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 136]	// _88, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 60]	// __i.11_89, __i
	stlr	w1, [x0]	// __i.11_89,* _88
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// MP_Relax_WO_Fence_Acquire.cpp:113:             random_delay(RAND_RANGE);
	mov	w0, 640	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence_Acquire.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp171,
	add	x0, x0, :lo12:var	// tmp170, tmp171,
	ldr	x1, [x0]	// var.5_19, var
// MP_Relax_WO_Fence_Acquire.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 40]	// _20, i
// MP_Relax_WO_Fence_Acquire.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _21, _20,
	add	x0, x1, x0	// _22, var.5_19, _21
// MP_Relax_WO_Fence_Acquire.cpp:116:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp172, _22,
	str	x0, [sp, 120]	// tmp172, tmp_b
// MP_Relax_WO_Fence_Acquire.cpp:117:             tmp_b->store(1, std::memory_order_relaxed);
	ldr	x0, [sp, 120]	// _23, tmp_b
	str	x0, [sp, 128]	// _23, this
	mov	w0, 1	// tmp173,
	str	w0, [sp, 48]	// tmp173, __i
	str	wzr, [sp, 52]	//, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 52]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 56]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 128]	// _81, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 48]	// __i.11_82, __i
	stlr	w1, [x0]	// __i.11_82,* _81
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// MP_Relax_WO_Fence_Acquire.cpp:101:         for (int i = 0; i < DEF_RUNS; ++i)
	ldr	w0, [sp, 40]	// tmp175, i
	add	w0, w0, 1	// tmp174, tmp175,
	str	w0, [sp, 40]	// tmp174, i
.L11:
// MP_Relax_WO_Fence_Acquire.cpp:101:         for (int i = 0; i < DEF_RUNS; ++i)
	ldr	w1, [sp, 40]	// tmp176, i
	mov	w0, 34463	// tmp177,
	movk	w0, 0x1, lsl 16	// tmp177,,
	cmp	w1, w0	// tmp176, tmp177
	ble	.L12		//,
	b	.L13		//
.L10:
// MP_Relax_WO_Fence_Acquire.cpp:125:         for (int i = (tid - 1); i < DEF_RUNS; i += (THREAD_COUNT - 1))
	ldr	x0, [sp, 88]	// tmp178, tid
	sub	w0, w0, #1	// _25, _24,
// MP_Relax_WO_Fence_Acquire.cpp:125:         for (int i = (tid - 1); i < DEF_RUNS; i += (THREAD_COUNT - 1))
	str	w0, [sp, 44]	// _25, i
// MP_Relax_WO_Fence_Acquire.cpp:125:         for (int i = (tid - 1); i < DEF_RUNS; i += (THREAD_COUNT - 1))
	b	.L14		//
.L17:
// MP_Relax_WO_Fence_Acquire.cpp:127:             random_delay(RAND_RANGE / 2);
	mov	w0, 320	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence_Acquire.cpp:130:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp180,
	add	x0, x0, :lo12:var	// tmp179, tmp180,
	ldr	x1, [x0]	// var.6_26, var
// MP_Relax_WO_Fence_Acquire.cpp:130:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 44]	// _27, i
// MP_Relax_WO_Fence_Acquire.cpp:130:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 7	// _28, _27,
	add	x0, x1, x0	// _29, var.6_26, _28
// MP_Relax_WO_Fence_Acquire.cpp:130:             auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 64	// tmp181, _29,
	str	x0, [sp, 96]	// tmp181, tmp_b
// MP_Relax_WO_Fence_Acquire.cpp:131:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_acquire);
	ldr	x0, [sp, 96]	// _30, tmp_b
	str	x0, [sp, 152]	// _30, this
	mov	w0, 2	// tmp182,
	str	w0, [sp, 80]	// tmp182, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 80]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 84]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 152]	// _101, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _103,* _101
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48639, _103
// MP_Relax_WO_Fence_Acquire.cpp:131:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_acquire);
	adrp	x0, gpu_res	// tmp184,
	add	x0, x0, :lo12:gpu_res	// tmp183, tmp184,
	ldr	x1, [x0]	// gpu_res.7_32, gpu_res
// MP_Relax_WO_Fence_Acquire.cpp:131:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_acquire);
	ldrsw	x0, [sp, 44]	// _33, i
// MP_Relax_WO_Fence_Acquire.cpp:131:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_acquire);
	lsl	x0, x0, 6	// _34, _33,
	add	x0, x1, x0	// _35, gpu_res.7_32, _34
// MP_Relax_WO_Fence_Acquire.cpp:131:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_acquire);
	mov	w1, w2	// _36, D.48639
// MP_Relax_WO_Fence_Acquire.cpp:131:             (gpu_res+i)->r0 = tmp_b->load(std::memory_order_acquire);
	str	w1, [x0]	// _36, _35->r0
// MP_Relax_WO_Fence_Acquire.cpp:133:             random_delay(RAND_RANGE);
	mov	w0, 640	//,
	bl	_Z12random_delayi		//
// MP_Relax_WO_Fence_Acquire.cpp:136:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp186,
	add	x0, x0, :lo12:var	// tmp185, tmp186,
	ldr	x1, [x0]	// var.8_37, var
// MP_Relax_WO_Fence_Acquire.cpp:136:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 44]	// _38, i
// MP_Relax_WO_Fence_Acquire.cpp:136:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 7	// _39, _38,
	add	x0, x1, x0	// _40, var.8_37, _39
// MP_Relax_WO_Fence_Acquire.cpp:136:             auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 104]	// _40, tmp_a
// MP_Relax_WO_Fence_Acquire.cpp:137:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_acquire);
	ldr	x0, [sp, 104]	// _41, tmp_a
	str	x0, [sp, 144]	// _41, this
	mov	w0, 2	// tmp187,
	str	w0, [sp, 72]	// tmp187, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 72]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 76]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 144]	// _94, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _96,* _94
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48633, _96
// MP_Relax_WO_Fence_Acquire.cpp:137:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_acquire);
	adrp	x0, cpu_res	// tmp189,
	add	x0, x0, :lo12:cpu_res	// tmp188, tmp189,
	ldr	x1, [x0]	// cpu_res.9_43, cpu_res
// MP_Relax_WO_Fence_Acquire.cpp:137:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_acquire);
	ldrsw	x0, [sp, 44]	// _44, i
// MP_Relax_WO_Fence_Acquire.cpp:137:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_acquire);
	lsl	x0, x0, 6	// _45, _44,
	add	x0, x1, x0	// _46, cpu_res.9_43, _45
// MP_Relax_WO_Fence_Acquire.cpp:137:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_acquire);
	mov	w1, w2	// _47, D.48633
// MP_Relax_WO_Fence_Acquire.cpp:137:             (cpu_res+i)->r0 = tmp_a->load(std::memory_order_acquire);
	str	w1, [x0]	// _47, _46->r0
// MP_Relax_WO_Fence_Acquire.cpp:125:         for (int i = (tid - 1); i < DEF_RUNS; i += (THREAD_COUNT - 1))
	ldr	w0, [sp, 44]	// tmp191, i
	add	w0, w0, 2	// tmp190, tmp191,
	str	w0, [sp, 44]	// tmp190, i
.L14:
// MP_Relax_WO_Fence_Acquire.cpp:125:         for (int i = (tid - 1); i < DEF_RUNS; i += (THREAD_COUNT - 1))
	ldr	w1, [sp, 44]	// tmp192, i
	mov	w0, 34463	// tmp193,
	movk	w0, 0x1, lsl 16	// tmp193,,
	cmp	w1, w0	// tmp192, tmp193
	ble	.L17		//,
.L13:
// MP_Relax_WO_Fence_Acquire.cpp:141:     return (void*)local;
	mrs	x0, tpidr_el0	// tmp195
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp194, tmp195,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp194,
	ldr	w0, [x0]	// local.10_48, local
	sxtw	x0, w0	// _49, local.10_48
// MP_Relax_WO_Fence_Acquire.cpp:142: }
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
	stp	x29, x30, [sp, -64]!	//,,,
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	//,
	str	w0, [sp, 28]	// t_range, t_range
// MP_Relax_WO_Fence_Acquire.cpp:147:     unsigned res_cpu0_gpu0 = 0;  // x=0, flag=0
	str	wzr, [sp, 40]	//, res_cpu0_gpu0
// MP_Relax_WO_Fence_Acquire.cpp:148:     unsigned res_cpu1_gpu0 = 0;  // x=1, flag=0 (interesting/forbidden)
	str	wzr, [sp, 44]	//, res_cpu1_gpu0
// MP_Relax_WO_Fence_Acquire.cpp:149:     unsigned res_cpu0_gpu1 = 0;  // x=0, flag=1
	str	wzr, [sp, 48]	//, res_cpu0_gpu1
// MP_Relax_WO_Fence_Acquire.cpp:150:     unsigned res_cpu1_gpu1 = 0;  // x=1, flag=1
	str	wzr, [sp, 52]	//, res_cpu1_gpu1
// MP_Relax_WO_Fence_Acquire.cpp:151:     unsigned res_cpu2_gpu2 = 0;  // other (initialization)
	str	wzr, [sp, 56]	//, res_cpu2_gpu2
// MP_Relax_WO_Fence_Acquire.cpp:153:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 60]	//, i
// MP_Relax_WO_Fence_Acquire.cpp:153:     for (auto i = 0; i < t_range; ++i) {
	b	.L20		//
.L34:
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp189,
	add	x0, x0, :lo12:cpu_res	// tmp188, tmp189,
	ldr	x1, [x0]	// cpu_res.24_1, cpu_res
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _2, i
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _3, _2,
	add	x0, x1, x0	// _4, cpu_res.24_1, _3
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _5, _4->r0
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _5,
	bne	.L21		//,
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp191,
	add	x0, x0, :lo12:gpu_res	// tmp190, tmp191,
	ldr	x1, [x0]	// gpu_res.25_6, gpu_res
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _7, i
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _8, _7,
	add	x0, x1, x0	// _9, gpu_res.25_6, _8
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _10, _9->r0
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _10,
	bne	.L21		//,
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.23_102,
	b	.L22		//
.L21:
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.23_102,
.L22:
// MP_Relax_WO_Fence_Acquire.cpp:154:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.23_102,
	beq	.L23		//,
// MP_Relax_WO_Fence_Acquire.cpp:155:             res_cpu0_gpu0++;
	ldr	w0, [sp, 40]	// tmp193, res_cpu0_gpu0
	add	w0, w0, 1	// tmp192, tmp193,
	str	w0, [sp, 40]	// tmp192, res_cpu0_gpu0
	b	.L24		//
.L23:
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp195,
	add	x0, x0, :lo12:cpu_res	// tmp194, tmp195,
	ldr	x1, [x0]	// cpu_res.28_11, cpu_res
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _12, i
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _13, _12,
	add	x0, x1, x0	// _14, cpu_res.28_11, _13
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _15, _14->r0
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 1	// _15,
	bne	.L25		//,
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp197,
	add	x0, x0, :lo12:gpu_res	// tmp196, tmp197,
	ldr	x1, [x0]	// gpu_res.29_16, gpu_res
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _17, i
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 6	// _18, _17,
	add	x0, x1, x0	// _19, gpu_res.29_16, _18
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _20, _19->r0
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _20,
	bne	.L25		//,
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.27_103,
	b	.L26		//
.L25:
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.27_103,
.L26:
// MP_Relax_WO_Fence_Acquire.cpp:156:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.27_103,
	beq	.L27		//,
// MP_Relax_WO_Fence_Acquire.cpp:157:             res_cpu1_gpu0++;
	ldr	w0, [sp, 44]	// tmp199, res_cpu1_gpu0
	add	w0, w0, 1	// tmp198, tmp199,
	str	w0, [sp, 44]	// tmp198, res_cpu1_gpu0
	b	.L24		//
.L27:
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp201,
	add	x0, x0, :lo12:cpu_res	// tmp200, tmp201,
	ldr	x1, [x0]	// cpu_res.32_21, cpu_res
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _22, i
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _23, _22,
	add	x0, x1, x0	// _24, cpu_res.32_21, _23
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _25, _24->r0
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// _25,
	bne	.L28		//,
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp203,
	add	x0, x0, :lo12:gpu_res	// tmp202, tmp203,
	ldr	x1, [x0]	// gpu_res.33_26, gpu_res
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _27, i
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _28, _27,
	add	x0, x1, x0	// _29, gpu_res.33_26, _28
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _30, _29->r0
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _30,
	bne	.L28		//,
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.31_104,
	b	.L29		//
.L28:
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.31_104,
.L29:
// MP_Relax_WO_Fence_Acquire.cpp:158:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.31_104,
	beq	.L30		//,
// MP_Relax_WO_Fence_Acquire.cpp:159:             res_cpu0_gpu1++;
	ldr	w0, [sp, 48]	// tmp205, res_cpu0_gpu1
	add	w0, w0, 1	// tmp204, tmp205,
	str	w0, [sp, 48]	// tmp204, res_cpu0_gpu1
	b	.L24		//
.L30:
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp207,
	add	x0, x0, :lo12:cpu_res	// tmp206, tmp207,
	ldr	x1, [x0]	// cpu_res.36_31, cpu_res
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _32, i
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _33, _32,
	add	x0, x1, x0	// _34, cpu_res.36_31, _33
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _35, _34->r0
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _35,
	bne	.L31		//,
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp209,
	add	x0, x0, :lo12:gpu_res	// tmp208, tmp209,
	ldr	x1, [x0]	// gpu_res.37_36, gpu_res
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _37, i
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 6	// _38, _37,
	add	x0, x1, x0	// _39, gpu_res.37_36, _38
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _40, _39->r0
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _40,
	bne	.L31		//,
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.35_105,
	b	.L32		//
.L31:
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.35_105,
.L32:
// MP_Relax_WO_Fence_Acquire.cpp:160:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.35_105,
	beq	.L33		//,
// MP_Relax_WO_Fence_Acquire.cpp:161:             res_cpu1_gpu1++;
	ldr	w0, [sp, 52]	// tmp211, res_cpu1_gpu1
	add	w0, w0, 1	// tmp210, tmp211,
	str	w0, [sp, 52]	// tmp210, res_cpu1_gpu1
	b	.L24		//
.L33:
// MP_Relax_WO_Fence_Acquire.cpp:164:             res_cpu2_gpu2++;
	ldr	w0, [sp, 56]	// tmp213, res_cpu2_gpu2
	add	w0, w0, 1	// tmp212, tmp213,
	str	w0, [sp, 56]	// tmp212, res_cpu2_gpu2
.L24:
// MP_Relax_WO_Fence_Acquire.cpp:153:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// tmp215, i
	add	w0, w0, 1	// tmp214, tmp215,
	str	w0, [sp, 60]	// tmp214, i
.L20:
// MP_Relax_WO_Fence_Acquire.cpp:153:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// i.38_41, i
// MP_Relax_WO_Fence_Acquire.cpp:153:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 28]	// tmp216, t_range
	cmp	w1, w0	// tmp216, i.38_41
	bhi	.L34		//,
// MP_Relax_WO_Fence_Acquire.cpp:168:     std::cout << "\nMessage Passing (MP) Litmus Test Results with RELAXED ORDERING:" << std::endl;
	adrp	x0, .LC0	// tmp217,
	add	x1, x0, :lo12:.LC0	//, tmp217,
	adrp	x0, :got:_ZSt4cout	// tmp218,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp218,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _42,
// MP_Relax_WO_Fence_Acquire.cpp:168:     std::cout << "\nMessage Passing (MP) Litmus Test Results with RELAXED ORDERING:" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp219,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp219,
	mov	x0, x2	//, _42
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:169:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC1	// tmp220,
	add	x1, x0, :lo12:.LC1	//, tmp220,
	adrp	x0, :got:_ZSt4cout	// tmp221,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp221,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence_Acquire.cpp:169:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 40]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _44,
// MP_Relax_WO_Fence_Acquire.cpp:169:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp222,
	add	x1, x0, :lo12:.LC2	//, tmp222,
	mov	x0, x2	//, _44
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _45,
// MP_Relax_WO_Fence_Acquire.cpp:169:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 40]	// tmp223, res_cpu0_gpu0
	ucvtf	d0, w0	// _46, tmp223
	mov	x0, 4636737291354636288	// tmp282,
	fmov	d1, x0	// tmp224, tmp282
	fmul	d1, d0, d1	// _47, _46, tmp224
// MP_Relax_WO_Fence_Acquire.cpp:169:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp225, t_range
	ucvtf	d0, w0	// _48, tmp225
	fdiv	d0, d1, d0	// _49, _47, _48
	mov	x0, x1	//, _45
	bl	_ZNSolsEd		//
	mov	x2, x0	// _50,
// MP_Relax_WO_Fence_Acquire.cpp:169:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp226,
	add	x1, x0, :lo12:.LC3	//, tmp226,
	mov	x0, x2	//, _50
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _51,
// MP_Relax_WO_Fence_Acquire.cpp:169:     std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp227,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp227,
	mov	x0, x2	//, _51
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:170:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC4	// tmp228,
	add	x1, x0, :lo12:.LC4	//, tmp228,
	adrp	x0, :got:_ZSt4cout	// tmp229,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp229,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence_Acquire.cpp:170:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _53,
// MP_Relax_WO_Fence_Acquire.cpp:170:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp230,
	add	x1, x0, :lo12:.LC2	//, tmp230,
	mov	x0, x2	//, _53
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _54,
// MP_Relax_WO_Fence_Acquire.cpp:170:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 52]	// tmp231, res_cpu1_gpu1
	ucvtf	d0, w0	// _55, tmp231
	mov	x0, 4636737291354636288	// tmp283,
	fmov	d1, x0	// tmp232, tmp283
	fmul	d1, d0, d1	// _56, _55, tmp232
// MP_Relax_WO_Fence_Acquire.cpp:170:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp233, t_range
	ucvtf	d0, w0	// _57, tmp233
	fdiv	d0, d1, d0	// _58, _56, _57
	mov	x0, x1	//, _54
	bl	_ZNSolsEd		//
	mov	x2, x0	// _59,
// MP_Relax_WO_Fence_Acquire.cpp:170:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp234,
	add	x1, x0, :lo12:.LC3	//, tmp234,
	mov	x0, x2	//, _59
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _60,
// MP_Relax_WO_Fence_Acquire.cpp:170:     std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp235,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp235,
	mov	x0, x2	//, _60
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:171:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC5	// tmp236,
	add	x1, x0, :lo12:.LC5	//, tmp236,
	adrp	x0, :got:_ZSt4cout	// tmp237,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp237,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence_Acquire.cpp:171:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _62,
// MP_Relax_WO_Fence_Acquire.cpp:171:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp238,
	add	x1, x0, :lo12:.LC2	//, tmp238,
	mov	x0, x2	//, _62
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _63,
// MP_Relax_WO_Fence_Acquire.cpp:171:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 44]	// tmp239, res_cpu1_gpu0
	ucvtf	d0, w0	// _64, tmp239
	mov	x0, 4636737291354636288	// tmp284,
	fmov	d1, x0	// tmp240, tmp284
	fmul	d1, d0, d1	// _65, _64, tmp240
// MP_Relax_WO_Fence_Acquire.cpp:171:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp241, t_range
	ucvtf	d0, w0	// _66, tmp241
	fdiv	d0, d1, d0	// _67, _65, _66
	mov	x0, x1	//, _63
	bl	_ZNSolsEd		//
	mov	x2, x0	// _68,
// MP_Relax_WO_Fence_Acquire.cpp:171:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp242,
	add	x1, x0, :lo12:.LC3	//, tmp242,
	mov	x0, x2	//, _68
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _69,
// MP_Relax_WO_Fence_Acquire.cpp:171:     std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp243,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp243,
	mov	x0, x2	//, _69
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:172:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC6	// tmp244,
	add	x1, x0, :lo12:.LC6	//, tmp244,
	adrp	x0, :got:_ZSt4cout	// tmp245,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp245,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence_Acquire.cpp:172:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _71,
// MP_Relax_WO_Fence_Acquire.cpp:172:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC2	// tmp246,
	add	x1, x0, :lo12:.LC2	//, tmp246,
	mov	x0, x2	//, _71
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x1, x0	// _72,
// MP_Relax_WO_Fence_Acquire.cpp:172:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 48]	// tmp247, res_cpu0_gpu1
	ucvtf	d0, w0	// _73, tmp247
	mov	x0, 4636737291354636288	// tmp285,
	fmov	d1, x0	// tmp248, tmp285
	fmul	d1, d0, d1	// _74, _73, tmp248
// MP_Relax_WO_Fence_Acquire.cpp:172:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	ldr	w0, [sp, 28]	// tmp249, t_range
	ucvtf	d0, w0	// _75, tmp249
	fdiv	d0, d1, d0	// _76, _74, _75
	mov	x0, x1	//, _72
	bl	_ZNSolsEd		//
	mov	x2, x0	// _77,
// MP_Relax_WO_Fence_Acquire.cpp:172:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, .LC3	// tmp250,
	add	x1, x0, :lo12:.LC3	//, tmp250,
	mov	x0, x2	//, _77
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _78,
// MP_Relax_WO_Fence_Acquire.cpp:172:     std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp251,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp251,
	mov	x0, x2	//, _78
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:173:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, .LC7	// tmp252,
	add	x1, x0, :lo12:.LC7	//, tmp252,
	adrp	x0, :got:_ZSt4cout	// tmp253,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp253,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence_Acquire.cpp:173:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 56]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _80,
// MP_Relax_WO_Fence_Acquire.cpp:173:     std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp254,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp254,
	mov	x0, x2	//, _80
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:175:     if (res_cpu1_gpu0 > 0) {
	ldr	w0, [sp, 44]	// tmp255, res_cpu1_gpu0
	cmp	w0, 0	// tmp255,
	beq	.L35		//,
// MP_Relax_WO_Fence_Acquire.cpp:176:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp256,
	add	x1, x0, :lo12:.LC8	//, tmp256,
	adrp	x0, :got:_ZSt4cout	// tmp257,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp257,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _81,
// MP_Relax_WO_Fence_Acquire.cpp:176:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp258,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp258,
	mov	x0, x2	//, _81
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:177:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	adrp	x0, .LC9	// tmp259,
	add	x1, x0, :lo12:.LC9	//, tmp259,
	adrp	x0, :got:_ZSt4cout	// tmp260,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp260,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence_Acquire.cpp:177:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _83,
// MP_Relax_WO_Fence_Acquire.cpp:177:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	adrp	x0, .LC10	// tmp261,
	add	x1, x0, :lo12:.LC10	//, tmp261,
	mov	x0, x2	//, _83
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _84,
// MP_Relax_WO_Fence_Acquire.cpp:177:         std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp262,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp262,
	mov	x0, x2	//, _84
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:178:         std::cout << "    This indicates memory ordering violations as expected with relaxed semantics" << std::endl;
	adrp	x0, .LC11	// tmp263,
	add	x1, x0, :lo12:.LC11	//, tmp263,
	adrp	x0, :got:_ZSt4cout	// tmp264,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp264,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _85,
// MP_Relax_WO_Fence_Acquire.cpp:178:         std::cout << "    This indicates memory ordering violations as expected with relaxed semantics" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp265,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp265,
	mov	x0, x2	//, _85
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:179:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp266,
	add	x1, x0, :lo12:.LC8	//, tmp266,
	adrp	x0, :got:_ZSt4cout	// tmp267,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp267,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _86,
// MP_Relax_WO_Fence_Acquire.cpp:179:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp268,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp268,
	mov	x0, x2	//, _86
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:180:         return 2;
	mov	w0, 2	// _106,
	b	.L36		//
.L35:
// MP_Relax_WO_Fence_Acquire.cpp:182:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp269,
	add	x1, x0, :lo12:.LC8	//, tmp269,
	adrp	x0, :got:_ZSt4cout	// tmp270,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp270,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _87,
// MP_Relax_WO_Fence_Acquire.cpp:182:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp271,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp271,
	mov	x0, x2	//, _87
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:183:         std::cout << "    No forbidden behavior observed (x=1, flag=0)" << std::endl;
	adrp	x0, .LC12	// tmp272,
	add	x1, x0, :lo12:.LC12	//, tmp272,
	adrp	x0, :got:_ZSt4cout	// tmp273,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp273,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _88,
// MP_Relax_WO_Fence_Acquire.cpp:183:         std::cout << "    No forbidden behavior observed (x=1, flag=0)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp274,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp274,
	mov	x0, x2	//, _88
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:184:         std::cout << "    Even with relaxed semantics, no reordering was detected" << std::endl;
	adrp	x0, .LC13	// tmp275,
	add	x1, x0, :lo12:.LC13	//, tmp275,
	adrp	x0, :got:_ZSt4cout	// tmp276,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp276,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _89,
// MP_Relax_WO_Fence_Acquire.cpp:184:         std::cout << "    Even with relaxed semantics, no reordering was detected" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp277,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp277,
	mov	x0, x2	//, _89
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:185:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp278,
	add	x1, x0, :lo12:.LC8	//, tmp278,
	adrp	x0, :got:_ZSt4cout	// tmp279,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp279,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _90,
// MP_Relax_WO_Fence_Acquire.cpp:185:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp280,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp280,
	mov	x0, x2	//, _90
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:186:         return 0;
	mov	w0, 0	// _106,
.L36:
// MP_Relax_WO_Fence_Acquire.cpp:188: }
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
	stp	x29, x30, [sp, -96]!	//,,,
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp	//,
// MP_Relax_WO_Fence_Acquire.cpp:193: {
	adrp	x0, :got:__stack_chk_guard	// tmp165,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp164, tmp165,
	ldr	x1, [x0]	// tmp305,
	str	x1, [sp, 88]	// tmp305, D.48657
	mov	x1, 0	// tmp305
// MP_Relax_WO_Fence_Acquire.cpp:194:     printf("Starting %d threads for MP litmus test with RELAXED ordering...\n", THREAD_COUNT);
	mov	w1, 3	//,
	adrp	x0, .LC14	// tmp166,
	add	x0, x0, :lo12:.LC14	//, tmp166,
	bl	printf		//
// MP_Relax_WO_Fence_Acquire.cpp:195:     printf("This test is DESIGNED to expose the forbidden outcome (x=1, flag=0)\n\n");
	adrp	x0, .LC15	// tmp167,
	add	x0, x0, :lo12:.LC15	//, tmp167,
	bl	puts		//
// MP_Relax_WO_Fence_Acquire.cpp:197:     auto num_iterations = DEF_RUNS; 
	mov	w0, 34464	// tmp168,
	movk	w0, 0x1, lsl 16	// tmp168,,
	str	w0, [sp, 48]	// tmp168, num_iterations
// MP_Relax_WO_Fence_Acquire.cpp:198:     auto t_range = num_iterations;
	ldr	w0, [sp, 48]	// tmp169, num_iterations
	str	w0, [sp, 52]	// tmp169, t_range
// MP_Relax_WO_Fence_Acquire.cpp:200:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	ldrsw	x0, [sp, 52]	// _1, t_range
// MP_Relax_WO_Fence_Acquire.cpp:200:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	lsl	x0, x0, 7	// _2, _1,
	bl	malloc		//
	mov	x1, x0	// _3, tmp170
// MP_Relax_WO_Fence_Acquire.cpp:200:     var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	adrp	x0, var	// tmp172,
	add	x0, x0, :lo12:var	// tmp171, tmp172,
	str	x1, [x0]	// _3, var
// MP_Relax_WO_Fence_Acquire.cpp:202:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 28]	//, i
// MP_Relax_WO_Fence_Acquire.cpp:202:     for (auto i = 0; i < t_range; ++i) {
	b	.L38		//
.L39:
// MP_Relax_WO_Fence_Acquire.cpp:203:         var[i].a = 0;
	adrp	x0, var	// tmp174,
	add	x0, x0, :lo12:var	// tmp173, tmp174,
	ldr	x1, [x0]	// var.39_4, var
// MP_Relax_WO_Fence_Acquire.cpp:203:         var[i].a = 0;
	ldrsw	x0, [sp, 28]	// _5, i
// MP_Relax_WO_Fence_Acquire.cpp:203:         var[i].a = 0;
	lsl	x0, x0, 7	// _6, _5,
	add	x0, x1, x0	// _7, var.39_4, _6
// MP_Relax_WO_Fence_Acquire.cpp:203:         var[i].a = 0;
	str	wzr, [x0]	//, _7->a
// MP_Relax_WO_Fence_Acquire.cpp:204:         var[i].b = 0;
	adrp	x0, var	// tmp176,
	add	x0, x0, :lo12:var	// tmp175, tmp176,
	ldr	x1, [x0]	// var.40_8, var
// MP_Relax_WO_Fence_Acquire.cpp:204:         var[i].b = 0;
	ldrsw	x0, [sp, 28]	// _9, i
// MP_Relax_WO_Fence_Acquire.cpp:204:         var[i].b = 0;
	lsl	x0, x0, 7	// _10, _9,
	add	x0, x1, x0	// _11, var.40_8, _10
// MP_Relax_WO_Fence_Acquire.cpp:204:         var[i].b = 0;
	str	wzr, [x0, 64]	//, _11->b
// MP_Relax_WO_Fence_Acquire.cpp:202:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 28]	// tmp178, i
	add	w0, w0, 1	// tmp177, tmp178,
	str	w0, [sp, 28]	// tmp177, i
.L38:
// MP_Relax_WO_Fence_Acquire.cpp:202:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 28]	// tmp179, i
	ldr	w0, [sp, 52]	// tmp180, t_range
	cmp	w1, w0	// tmp179, tmp180
	blt	.L39		//,
// MP_Relax_WO_Fence_Acquire.cpp:207:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	ldrsw	x0, [sp, 52]	// _12, t_range
// MP_Relax_WO_Fence_Acquire.cpp:207:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	lsl	x0, x0, 6	// _13, _12,
	bl	malloc		//
	mov	x1, x0	// _14, tmp181
// MP_Relax_WO_Fence_Acquire.cpp:207:     cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	adrp	x0, cpu_res	// tmp183,
	add	x0, x0, :lo12:cpu_res	// tmp182, tmp183,
	str	x1, [x0]	// _14, cpu_res
// MP_Relax_WO_Fence_Acquire.cpp:208:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	ldrsw	x0, [sp, 52]	// _15, t_range
// MP_Relax_WO_Fence_Acquire.cpp:208:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	lsl	x0, x0, 6	// _16, _15,
	bl	malloc		//
	mov	x1, x0	// _17, tmp184
// MP_Relax_WO_Fence_Acquire.cpp:208:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	adrp	x0, gpu_res	// tmp186,
	add	x0, x0, :lo12:gpu_res	// tmp185, tmp186,
	str	x1, [x0]	// _17, gpu_res
// MP_Relax_WO_Fence_Acquire.cpp:210:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 32]	//, i
// MP_Relax_WO_Fence_Acquire.cpp:210:     for (auto i = 0; i < t_range; ++i) {
	b	.L40		//
.L41:
// MP_Relax_WO_Fence_Acquire.cpp:211:         cpu_res[i].r0 = 2;
	adrp	x0, cpu_res	// tmp188,
	add	x0, x0, :lo12:cpu_res	// tmp187, tmp188,
	ldr	x1, [x0]	// cpu_res.41_18, cpu_res
// MP_Relax_WO_Fence_Acquire.cpp:211:         cpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 32]	// _19, i
// MP_Relax_WO_Fence_Acquire.cpp:211:         cpu_res[i].r0 = 2;
	lsl	x0, x0, 6	// _20, _19,
	add	x0, x1, x0	// _21, cpu_res.41_18, _20
// MP_Relax_WO_Fence_Acquire.cpp:211:         cpu_res[i].r0 = 2;
	mov	w1, 2	// tmp189,
	str	w1, [x0]	// tmp189, _21->r0
// MP_Relax_WO_Fence_Acquire.cpp:212:         gpu_res[i].r0 = 2;
	adrp	x0, gpu_res	// tmp191,
	add	x0, x0, :lo12:gpu_res	// tmp190, tmp191,
	ldr	x1, [x0]	// gpu_res.42_22, gpu_res
// MP_Relax_WO_Fence_Acquire.cpp:212:         gpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 32]	// _23, i
// MP_Relax_WO_Fence_Acquire.cpp:212:         gpu_res[i].r0 = 2;
	lsl	x0, x0, 6	// _24, _23,
	add	x0, x1, x0	// _25, gpu_res.42_22, _24
// MP_Relax_WO_Fence_Acquire.cpp:212:         gpu_res[i].r0 = 2;
	mov	w1, 2	// tmp192,
	str	w1, [x0]	// tmp192, _25->r0
// MP_Relax_WO_Fence_Acquire.cpp:210:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 32]	// tmp194, i
	add	w0, w0, 1	// tmp193, tmp194,
	str	w0, [sp, 32]	// tmp193, i
.L40:
// MP_Relax_WO_Fence_Acquire.cpp:210:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 32]	// tmp195, i
	ldr	w0, [sp, 52]	// tmp196, t_range
	cmp	w1, w0	// tmp195, tmp196
	blt	.L41		//,
// MP_Relax_WO_Fence_Acquire.cpp:215:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 52]	// _26, t_range
// MP_Relax_WO_Fence_Acquire.cpp:215:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _27, _26,
	bl	malloc		//
	mov	x1, x0	// _28, tmp197
// MP_Relax_WO_Fence_Acquire.cpp:215:     cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand	// tmp199,
	add	x0, x0, :lo12:cpu_rand	// tmp198, tmp199,
	str	x1, [x0]	// _28, cpu_rand
// MP_Relax_WO_Fence_Acquire.cpp:216:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 52]	// _29, t_range
// MP_Relax_WO_Fence_Acquire.cpp:216:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _30, _29,
	bl	malloc		//
	mov	x1, x0	// _31, tmp200
// MP_Relax_WO_Fence_Acquire.cpp:216:     gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand	// tmp202,
	add	x0, x0, :lo12:gpu_rand	// tmp201, tmp202,
	str	x1, [x0]	// _31, gpu_rand
// MP_Relax_WO_Fence_Acquire.cpp:218:     for (int iter = 0; iter < num_iterations; iter++) {
	str	wzr, [sp, 36]	//, iter
// MP_Relax_WO_Fence_Acquire.cpp:218:     for (int iter = 0; iter < num_iterations; iter++) {
	b	.L42		//
.L45:
// MP_Relax_WO_Fence_Acquire.cpp:219:         auto g_tid = iter;
	ldr	w0, [sp, 36]	// tmp203, iter
	str	w0, [sp, 68]	// tmp203, g_tid
// MP_Relax_WO_Fence_Acquire.cpp:220:         unsigned rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _32,
// MP_Relax_WO_Fence_Acquire.cpp:220:         unsigned rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp205,
	movk	w0, 0x6666, lsl 16	// tmp205,,
	smull	x0, w2, w0	// tmp204, _32, tmp205
	lsr	x0, x0, 32	// tmp206, tmp204,
	asr	w1, w0, 8	// tmp207, tmp206,
	asr	w0, w2, 31	// tmp208, _32,
	sub	w1, w1, w0	// _33, tmp207, tmp208
	mov	w0, w1	// tmp209, _33
	lsl	w0, w0, 2	// tmp210, tmp209,
	add	w0, w0, w1	// tmp209, tmp209, _33
	lsl	w0, w0, 7	// tmp211, tmp209,
	sub	w1, w2, w0	// _33, _32, tmp209
// MP_Relax_WO_Fence_Acquire.cpp:220:         unsigned rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 40]	// _33, rand_val
// MP_Relax_WO_Fence_Acquire.cpp:221:         if (std::rand() % 10 < 2) {
	bl	rand		//
	mov	w2, w0	// _34,
// MP_Relax_WO_Fence_Acquire.cpp:221:         if (std::rand() % 10 < 2) {
	mov	w0, 26215	// tmp213,
	movk	w0, 0x6666, lsl 16	// tmp213,,
	smull	x0, w2, w0	// tmp212, _34, tmp213
	lsr	x0, x0, 32	// tmp214, tmp212,
	asr	w1, w0, 2	// tmp215, tmp214,
	asr	w0, w2, 31	// tmp216, _34,
	sub	w1, w1, w0	// _35, tmp215, tmp216
	mov	w0, w1	// tmp217, _35
	lsl	w0, w0, 2	// tmp218, tmp217,
	add	w0, w0, w1	// tmp217, tmp217, _35
	lsl	w0, w0, 1	// tmp219, tmp217,
	sub	w1, w2, w0	// _35, _34, tmp217
// MP_Relax_WO_Fence_Acquire.cpp:221:         if (std::rand() % 10 < 2) {
	cmp	w1, 1	// _35,
	cset	w0, le	// tmp221,
	and	w0, w0, 255	// retval.43_139, tmp220
// MP_Relax_WO_Fence_Acquire.cpp:221:         if (std::rand() % 10 < 2) {
	cmp	w0, 0	// retval.43_139,
	beq	.L43		//,
// MP_Relax_WO_Fence_Acquire.cpp:222:             rand_val = rand_val * 3;
	ldr	w1, [sp, 40]	// tmp222, rand_val
	mov	w0, w1	// tmp223, tmp222
	lsl	w0, w0, 1	// tmp224, tmp223,
	add	w0, w0, w1	// tmp225, tmp223, tmp222
	str	w0, [sp, 40]	// tmp225, rand_val
.L43:
// MP_Relax_WO_Fence_Acquire.cpp:224:         cpu_rand[g_tid] = rand_val;
	adrp	x0, cpu_rand	// tmp227,
	add	x0, x0, :lo12:cpu_rand	// tmp226, tmp227,
	ldr	x1, [x0]	// cpu_rand.44_36, cpu_rand
// MP_Relax_WO_Fence_Acquire.cpp:224:         cpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 68]	// _37, g_tid
// MP_Relax_WO_Fence_Acquire.cpp:224:         cpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _38, _37,
	add	x0, x1, x0	// _39, cpu_rand.44_36, _38
// MP_Relax_WO_Fence_Acquire.cpp:224:         cpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 40]	// tmp228, rand_val
	str	w1, [x0]	// tmp228, *_39
// MP_Relax_WO_Fence_Acquire.cpp:225:         rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _40,
// MP_Relax_WO_Fence_Acquire.cpp:225:         rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp230,
	movk	w0, 0x6666, lsl 16	// tmp230,,
	smull	x0, w2, w0	// tmp229, _40, tmp230
	lsr	x0, x0, 32	// tmp231, tmp229,
	asr	w1, w0, 8	// tmp232, tmp231,
	asr	w0, w2, 31	// tmp233, _40,
	sub	w1, w1, w0	// _41, tmp232, tmp233
	mov	w0, w1	// tmp234, _41
	lsl	w0, w0, 2	// tmp235, tmp234,
	add	w0, w0, w1	// tmp234, tmp234, _41
	lsl	w0, w0, 7	// tmp236, tmp234,
	sub	w1, w2, w0	// _41, _40, tmp234
// MP_Relax_WO_Fence_Acquire.cpp:225:         rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 40]	// _41, rand_val
// MP_Relax_WO_Fence_Acquire.cpp:226:         if (std::rand() % 10 < 1) {
	bl	rand		//
	mov	w2, w0	// _42,
// MP_Relax_WO_Fence_Acquire.cpp:226:         if (std::rand() % 10 < 1) {
	mov	w0, 26215	// tmp238,
	movk	w0, 0x6666, lsl 16	// tmp238,,
	smull	x0, w2, w0	// tmp237, _42, tmp238
	lsr	x0, x0, 32	// tmp239, tmp237,
	asr	w1, w0, 2	// tmp240, tmp239,
	asr	w0, w2, 31	// tmp241, _42,
	sub	w1, w1, w0	// _43, tmp240, tmp241
	mov	w0, w1	// tmp242, _43
	lsl	w0, w0, 2	// tmp243, tmp242,
	add	w0, w0, w1	// tmp242, tmp242, _43
	lsl	w0, w0, 1	// tmp244, tmp242,
	sub	w1, w2, w0	// _43, _42, tmp242
// MP_Relax_WO_Fence_Acquire.cpp:226:         if (std::rand() % 10 < 1) {
	cmp	w1, 0	// _43,
	cset	w0, le	// tmp246,
	and	w0, w0, 255	// retval.45_145, tmp245
// MP_Relax_WO_Fence_Acquire.cpp:226:         if (std::rand() % 10 < 1) {
	cmp	w0, 0	// retval.45_145,
	beq	.L44		//,
// MP_Relax_WO_Fence_Acquire.cpp:227:             rand_val = rand_val / 10;
	ldr	w1, [sp, 40]	// tmp248, rand_val
	mov	w0, 52429	// tmp250,
	movk	w0, 0xcccc, lsl 16	// tmp250,,
	umull	x0, w1, w0	// tmp249, tmp248, tmp250
	lsr	x0, x0, 32	// tmp251, tmp249,
	lsr	w0, w0, 3	// tmp247, tmp251,
	str	w0, [sp, 40]	// tmp247, rand_val
.L44:
// MP_Relax_WO_Fence_Acquire.cpp:229:         gpu_rand[g_tid] = rand_val;
	adrp	x0, gpu_rand	// tmp253,
	add	x0, x0, :lo12:gpu_rand	// tmp252, tmp253,
	ldr	x1, [x0]	// gpu_rand.46_44, gpu_rand
// MP_Relax_WO_Fence_Acquire.cpp:229:         gpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 68]	// _45, g_tid
// MP_Relax_WO_Fence_Acquire.cpp:229:         gpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _46, _45,
	add	x0, x1, x0	// _47, gpu_rand.46_44, _46
// MP_Relax_WO_Fence_Acquire.cpp:229:         gpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 40]	// tmp254, rand_val
	str	w1, [x0]	// tmp254, *_47
// MP_Relax_WO_Fence_Acquire.cpp:218:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w0, [sp, 36]	// tmp256, iter
	add	w0, w0, 1	// tmp255, tmp256,
	str	w0, [sp, 36]	// tmp255, iter
.L42:
// MP_Relax_WO_Fence_Acquire.cpp:218:     for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w1, [sp, 36]	// tmp257, iter
	ldr	w0, [sp, 48]	// tmp258, num_iterations
	cmp	w1, w0	// tmp257, tmp258
	blt	.L45		//,
// MP_Relax_WO_Fence_Acquire.cpp:232:     std::cout << "Random delays generated with high variability (0-" << RAND_RANGE*3 << " cycles)" << std::endl;
	adrp	x0, .LC16	// tmp259,
	add	x1, x0, :lo12:.LC16	//, tmp259,
	adrp	x0, :got:_ZSt4cout	// tmp260,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp260,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// MP_Relax_WO_Fence_Acquire.cpp:232:     std::cout << "Random delays generated with high variability (0-" << RAND_RANGE*3 << " cycles)" << std::endl;
	mov	w1, 1920	//,
	bl	_ZNSolsEi		//
	mov	x2, x0	// _49,
	adrp	x0, .LC17	// tmp261,
	add	x1, x0, :lo12:.LC17	//, tmp261,
	mov	x0, x2	//, _49
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _50,
// MP_Relax_WO_Fence_Acquire.cpp:232:     std::cout << "Random delays generated with high variability (0-" << RAND_RANGE*3 << " cycles)" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp262,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp262,
	mov	x0, x2	//, _50
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:236:     pthread_t* threads = (pthread_t*)calloc(THREAD_COUNT, sizeof(pthread_t));
	mov	x1, 8	//,
	mov	x0, 3	//,
	bl	calloc		//
	str	x0, [sp, 80]	// tmp263, threads
// MP_Relax_WO_Fence_Acquire.cpp:237:     pthread_barrier_init(&barrier, NULL, THREAD_COUNT);
	mov	w2, 3	//,
	mov	x1, 0	//,
	adrp	x0, barrier	// tmp264,
	add	x0, x0, :lo12:barrier	//, tmp264,
	bl	pthread_barrier_init		//
// MP_Relax_WO_Fence_Acquire.cpp:238:     assert(threads != NULL);
	ldr	x0, [sp, 80]	// tmp265, threads
	cmp	x0, 0	// tmp265,
	bne	.L46		//,
// MP_Relax_WO_Fence_Acquire.cpp:238:     assert(threads != NULL);
	adrp	x0, .LC18	// tmp266,
	add	x3, x0, :lo12:.LC18	//, tmp266,
	mov	w2, 238	//,
	adrp	x0, .LC19	// tmp267,
	add	x1, x0, :lo12:.LC19	//, tmp267,
	adrp	x0, .LC20	// tmp268,
	add	x0, x0, :lo12:.LC20	//, tmp268,
	bl	__assert_fail		//
.L46:
// MP_Relax_WO_Fence_Acquire.cpp:241:     for (i = 1 ; i < THREAD_COUNT; i++) {
	mov	w0, 1	// tmp269,
	str	w0, [sp, 44]	// tmp269, i
// MP_Relax_WO_Fence_Acquire.cpp:241:     for (i = 1 ; i < THREAD_COUNT; i++) {
	b	.L47		//
.L49:
// MP_Relax_WO_Fence_Acquire.cpp:242:         int createResult = pthread_create(&threads[i], 
	ldrsw	x0, [sp, 44]	// _51, i
// MP_Relax_WO_Fence_Acquire.cpp:242:         int createResult = pthread_create(&threads[i], 
	lsl	x0, x0, 3	// _52, _51,
// MP_Relax_WO_Fence_Acquire.cpp:242:         int createResult = pthread_create(&threads[i], 
	ldr	x1, [sp, 80]	// tmp270, threads
	add	x4, x1, x0	// _53, tmp270, _52
// MP_Relax_WO_Fence_Acquire.cpp:245:                                           (void*)(long long int)i);
	ldrsw	x0, [sp, 44]	// _54, i
// MP_Relax_WO_Fence_Acquire.cpp:242:         int createResult = pthread_create(&threads[i], 
	mov	x3, x0	//, _55
	adrp	x0, _Z5runMPPv	// tmp271,
	add	x2, x0, :lo12:_Z5runMPPv	//, tmp271,
	mov	x1, 0	//,
	mov	x0, x4	//, _53
	bl	pthread_create		//
	str	w0, [sp, 64]	//, createResult
// MP_Relax_WO_Fence_Acquire.cpp:246:         assert(createResult == 0);
	ldr	w0, [sp, 64]	// tmp272, createResult
	cmp	w0, 0	// tmp272,
	beq	.L48		//,
// MP_Relax_WO_Fence_Acquire.cpp:246:         assert(createResult == 0);
	adrp	x0, .LC18	// tmp273,
	add	x3, x0, :lo12:.LC18	//, tmp273,
	mov	w2, 246	//,
	adrp	x0, .LC19	// tmp274,
	add	x1, x0, :lo12:.LC19	//, tmp274,
	adrp	x0, .LC21	// tmp275,
	add	x0, x0, :lo12:.LC21	//, tmp275,
	bl	__assert_fail		//
.L48:
// MP_Relax_WO_Fence_Acquire.cpp:241:     for (i = 1 ; i < THREAD_COUNT; i++) {
	ldr	w0, [sp, 44]	// tmp277, i
	add	w0, w0, 1	// tmp276, tmp277,
	str	w0, [sp, 44]	// tmp276, i
.L47:
// MP_Relax_WO_Fence_Acquire.cpp:241:     for (i = 1 ; i < THREAD_COUNT; i++) {
	ldr	w0, [sp, 44]	// tmp278, i
	cmp	w0, 2	// tmp278,
	ble	.L49		//,
// MP_Relax_WO_Fence_Acquire.cpp:250:     runMP((void*)0);
	mov	x0, 0	//,
	bl	_Z5runMPPv		//
// MP_Relax_WO_Fence_Acquire.cpp:253:     for (i = 1 ; i < THREAD_COUNT; i++) {
	mov	w0, 1	// tmp279,
	str	w0, [sp, 44]	// tmp279, i
// MP_Relax_WO_Fence_Acquire.cpp:253:     for (i = 1 ; i < THREAD_COUNT; i++) {
	b	.L50		//
.L52:
// MP_Relax_WO_Fence_Acquire.cpp:255:         int joinResult = pthread_join(threads[i], &status);
	ldrsw	x0, [sp, 44]	// _56, i
// MP_Relax_WO_Fence_Acquire.cpp:255:         int joinResult = pthread_join(threads[i], &status);
	lsl	x0, x0, 3	// _57, _56,
	ldr	x1, [sp, 80]	// tmp280, threads
	add	x0, x1, x0	// _58, tmp280, _57
// MP_Relax_WO_Fence_Acquire.cpp:255:         int joinResult = pthread_join(threads[i], &status);
	ldr	x0, [x0]	// _59, *_58
	add	x1, sp, 72	// tmp281,,
	bl	pthread_join		//
	str	w0, [sp, 60]	// _125, joinResult
// MP_Relax_WO_Fence_Acquire.cpp:256:         assert(joinResult == 0);
	ldr	w0, [sp, 60]	// tmp282, joinResult
	cmp	w0, 0	// tmp282,
	beq	.L51		//,
// MP_Relax_WO_Fence_Acquire.cpp:256:         assert(joinResult == 0);
	adrp	x0, .LC18	// tmp283,
	add	x3, x0, :lo12:.LC18	//, tmp283,
	mov	w2, 256	//,
	adrp	x0, .LC19	// tmp284,
	add	x1, x0, :lo12:.LC19	//, tmp284,
	adrp	x0, .LC22	// tmp285,
	add	x0, x0, :lo12:.LC22	//, tmp285,
	bl	__assert_fail		//
.L51:
// MP_Relax_WO_Fence_Acquire.cpp:253:     for (i = 1 ; i < THREAD_COUNT; i++) {
	ldr	w0, [sp, 44]	// tmp287, i
	add	w0, w0, 1	// tmp286, tmp287,
	str	w0, [sp, 44]	// tmp286, i
.L50:
// MP_Relax_WO_Fence_Acquire.cpp:253:     for (i = 1 ; i < THREAD_COUNT; i++) {
	ldr	w0, [sp, 44]	// tmp288, i
	cmp	w0, 2	// tmp288,
	ble	.L52		//,
// MP_Relax_WO_Fence_Acquire.cpp:260:     std::cout << "\nValidating..." << std::endl;
	adrp	x0, .LC23	// tmp289,
	add	x1, x0, :lo12:.LC23	//, tmp289,
	adrp	x0, :got:_ZSt4cout	// tmp290,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp290,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _60,
// MP_Relax_WO_Fence_Acquire.cpp:260:     std::cout << "\nValidating..." << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp291,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp291,
	mov	x0, x2	//, _60
	bl	_ZNSolsEPFRSoS_E		//
// MP_Relax_WO_Fence_Acquire.cpp:261:     int res = check_output(t_range);
	ldr	w0, [sp, 52]	// t_range.47_61, t_range
	bl	_Z12check_outputj		//
	str	w0, [sp, 56]	// _115, res
// MP_Relax_WO_Fence_Acquire.cpp:264:     free(threads);
	ldr	x0, [sp, 80]	//, threads
	bl	free		//
// MP_Relax_WO_Fence_Acquire.cpp:265:     free((void*)var);
	adrp	x0, var	// tmp293,
	add	x0, x0, :lo12:var	// tmp292, tmp293,
	ldr	x0, [x0]	// var.48_62, var
	bl	free		//
// MP_Relax_WO_Fence_Acquire.cpp:266:     free((void*)cpu_res);
	adrp	x0, cpu_res	// tmp295,
	add	x0, x0, :lo12:cpu_res	// tmp294, tmp295,
	ldr	x0, [x0]	// cpu_res.49_63, cpu_res
	bl	free		//
// MP_Relax_WO_Fence_Acquire.cpp:267:     free((void*)gpu_res);
	adrp	x0, gpu_res	// tmp297,
	add	x0, x0, :lo12:gpu_res	// tmp296, tmp297,
	ldr	x0, [x0]	// gpu_res.50_64, gpu_res
	bl	free		//
// MP_Relax_WO_Fence_Acquire.cpp:268:     free((void*)cpu_rand);
	adrp	x0, cpu_rand	// tmp299,
	add	x0, x0, :lo12:cpu_rand	// tmp298, tmp299,
	ldr	x0, [x0]	// cpu_rand.51_65, cpu_rand
	bl	free		//
// MP_Relax_WO_Fence_Acquire.cpp:269:     free((void*)gpu_rand);
	adrp	x0, gpu_rand	// tmp301,
	add	x0, x0, :lo12:gpu_rand	// tmp300, tmp301,
	ldr	x0, [x0]	// gpu_rand.52_66, gpu_rand
	bl	free		//
// MP_Relax_WO_Fence_Acquire.cpp:271:     return 0;
	mov	w0, 0	// _123,
// MP_Relax_WO_Fence_Acquire.cpp:272: }
	mov	w1, w0	// <retval>, _123
	adrp	x0, :got:__stack_chk_guard	// tmp304,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp303, tmp304,
	ldr	x3, [sp, 88]	// tmp306, D.48657
	ldr	x2, [x0]	// tmp307,
	subs	x3, x3, x2	// tmp306, tmp307
	mov	x2, 0	// tmp307
	beq	.L54		//,
	bl	__stack_chk_fail		//
.L54:
	mov	w0, w1	//, <retval>
	ldp	x29, x30, [sp], 96	//,,,
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
// MP_Relax_WO_Fence_Acquire.cpp:272: }
	ldr	w0, [sp, 28]	// tmp92, __initialize_p
	cmp	w0, 1	// tmp92,
	bne	.L57		//,
// MP_Relax_WO_Fence_Acquire.cpp:272: }
	ldr	w1, [sp, 24]	// tmp93, __priority
	mov	w0, 65535	// tmp94,
	cmp	w1, w0	// tmp93, tmp94
	bne	.L57		//,
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
.L57:
// MP_Relax_WO_Fence_Acquire.cpp:272: }
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
// MP_Relax_WO_Fence_Acquire.cpp:272: }
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
