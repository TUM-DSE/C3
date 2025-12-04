	.arch armv8-a
	.file	"IRIW_Relax_po_sys.cpp"
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
	ldr	w1, [sp, 12]	// __m.60_1, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	ldr	w0, [sp, 8]	// __mod.61_2, __mod
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	and	w0, w1, w0	// _3, __m.60_1, __mod.61_2
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
	.text
	.align	2
	.global	_Z7runIRIWPv
	.type	_Z7runIRIWPv, %function
_Z7runIRIWPv:
.LFB1808:
	.cfi_startproc
	stp	x29, x30, [sp, -304]!	//,,,
	.cfi_def_cfa_offset 304
	.cfi_offset 29, -304
	.cfi_offset 30, -296
	mov	x29, sp	//,
	str	x0, [sp, 24]	// arg, arg
// IRIW_Relax_po_sys.cpp:95:     long long int tid = (long long int)arg;
	ldr	x0, [sp, 24]	// tmp294, arg
	str	x0, [sp, 200]	// tmp294, tid
// IRIW_Relax_po_sys.cpp:96:     local += tid;
	ldr	x0, [sp, 200]	// tmp295, tid
	mov	w1, w0	// _1, tmp295
	mrs	x0, tpidr_el0	// tmp297
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp296, tmp297,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp296,
	ldr	w0, [x0]	// local.0_2, local
	add	w0, w1, w0	// _4, _1, local.1_3
	mov	w1, w0	// _5, _4
	mrs	x0, tpidr_el0	// tmp299
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp298, tmp299,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp298,
	str	w1, [x0]	// _5, local
// IRIW_Relax_po_sys.cpp:97:     pthread_barrier_wait(&barrier);
	adrp	x0, barrier	// tmp300,
	add	x0, x0, :lo12:barrier	//, tmp300,
	bl	pthread_barrier_wait		//
// IRIW_Relax_po_sys.cpp:101: if(tid / DEF_THREADS == 0)
	ldr	x0, [sp, 200]	// tid.2_6, tid
	add	x0, x0, 3	// _7, tid.2_6,
	cmp	x0, 6	// _7,
	bhi	.L4		//,
// IRIW_Relax_po_sys.cpp:103: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 200]	// tmp301, tid
	str	w0, [sp, 40]	// tmp302, i
// IRIW_Relax_po_sys.cpp:103: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	b	.L5		//
.L12:
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	str	xzr, [sp, 152]	//, j
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	b	.L6		//
.L7:
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	x0, [sp, 152]	// tmp304, j
	add	x0, x0, 1	// tmp303, tmp304,
	str	x0, [sp, 152]	// tmp303, j
.L6:
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	adrp	x0, cpu_rand1	// tmp306,
	add	x0, x0, :lo12:cpu_rand1	// tmp305, tmp306,
	ldr	x1, [x0]	// cpu_rand1.4_8, cpu_rand1
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldrsw	x0, [sp, 40]	// _9, i
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	lsl	x0, x0, 2	// _10, _9,
	add	x0, x1, x0	// _11, cpu_rand1.4_8, _10
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	w0, [x0]	// _12, *_11
	uxtw	x0, w0	// _13, _12
// IRIW_Relax_po_sys.cpp:107:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	x1, [sp, 152]	// tmp308, j
	cmp	x1, x0	// tmp308, _13
	cset	w0, lt	// tmp309,
	and	w0, w0, 255	// retval.3_253, tmp307
	cmp	w0, 0	// retval.3_253,
	bne	.L7		//,
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	str	xzr, [sp, 160]	//, j
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	b	.L8		//
.L9:
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	x0, [sp, 160]	// tmp311, j
	add	x0, x0, 1	// tmp310, tmp311,
	str	x0, [sp, 160]	// tmp310, j
.L8:
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	adrp	x0, cpu_rand1	// tmp313,
	add	x0, x0, :lo12:cpu_rand1	// tmp312, tmp313,
	ldr	x1, [x0]	// cpu_rand1.6_14, cpu_rand1
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldrsw	x0, [sp, 40]	// _15, i
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	lsl	x0, x0, 2	// _16, _15,
	add	x0, x1, x0	// _17, cpu_rand1.6_14, _16
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	w0, [x0]	// _18, *_17
	uxtw	x0, w0	// _19, _18
// IRIW_Relax_po_sys.cpp:108:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	x1, [sp, 160]	// tmp315, j
	cmp	x1, x0	// tmp315, _19
	cset	w0, lt	// tmp316,
	and	w0, w0, 255	// retval.5_255, tmp314
	cmp	w0, 0	// retval.5_255,
	bne	.L9		//,
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	str	xzr, [sp, 168]	//, j
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	b	.L10		//
.L11:
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	x0, [sp, 168]	// tmp318, j
	add	x0, x0, 1	// tmp317, tmp318,
	str	x0, [sp, 168]	// tmp317, j
.L10:
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	adrp	x0, cpu_rand1	// tmp320,
	add	x0, x0, :lo12:cpu_rand1	// tmp319, tmp320,
	ldr	x1, [x0]	// cpu_rand1.8_20, cpu_rand1
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldrsw	x0, [sp, 40]	// _21, i
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	lsl	x0, x0, 2	// _22, _21,
	add	x0, x1, x0	// _23, cpu_rand1.8_20, _22
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	w0, [x0]	// _24, *_23
	uxtw	x0, w0	// _25, _24
// IRIW_Relax_po_sys.cpp:109:     		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	ldr	x1, [sp, 168]	// tmp322, j
	cmp	x1, x0	// tmp322, _25
	cset	w0, lt	// tmp323,
	and	w0, w0, 255	// retval.7_257, tmp321
	cmp	w0, 0	// retval.7_257,
	bne	.L11		//,
// IRIW_Relax_po_sys.cpp:110: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp325,
	add	x0, x0, :lo12:var	// tmp324, tmp325,
	ldr	x1, [x0]	// var.9_26, var
// IRIW_Relax_po_sys.cpp:110: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 40]	// _27, i
// IRIW_Relax_po_sys.cpp:110: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 8	// _28, _27,
	add	x0, x1, x0	// _29, var.9_26, _28
// IRIW_Relax_po_sys.cpp:110: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 248]	// _29, tmp_a
// IRIW_Relax_po_sys.cpp:111:     		tmp_a->store(1, std::memory_order_release);
	ldr	x0, [sp, 248]	// _30, tmp_a
	str	x0, [sp, 256]	// _30, this
	mov	w0, 1	// tmp326,
	str	w0, [sp, 96]	// tmp326, __i
	mov	w0, 3	// tmp327,
	str	w0, [sp, 100]	// tmp327, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 100]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 104]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 256]	// _268, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 96]	// __i.58_269, __i
	stlr	w1, [x0]	// __i.58_269,* _268
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// IRIW_Relax_po_sys.cpp:103: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 40]	// tmp329, i
	add	w0, w0, 4	// tmp328, tmp329,
	str	w0, [sp, 40]	// tmp328, i
.L5:
// IRIW_Relax_po_sys.cpp:103: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 40]	// tmp330, i
	mov	w0, 34463	// tmp331,
	movk	w0, 0x1, lsl 16	// tmp331,,
	cmp	w1, w0	// tmp330, tmp331
	ble	.L12		//,
	b	.L13		//
.L4:
// IRIW_Relax_po_sys.cpp:114: else if (tid / DEF_THREADS == 1)
	ldr	x0, [sp, 200]	// tid.10_31, tid
	sub	x0, x0, #4	// _32, tid.10_31,
	cmp	x0, 3	// _32,
	bhi	.L14		//,
// IRIW_Relax_po_sys.cpp:116: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 200]	// tmp332, tid
	negs	x1, x0	// tmp333, tmp332
	and	x0, x0, 3	// tmp334, tmp332,
	and	x1, x1, 3	// tmp335, tmp333,
	csneg	x0, x0, x1, mi	// _33, tmp334, tmp335,
// IRIW_Relax_po_sys.cpp:116: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 44]	// tmp336, i
// IRIW_Relax_po_sys.cpp:116: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L15		//
.L28:
// IRIW_Relax_po_sys.cpp:119: 		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp338,
	add	x0, x0, :lo12:var	// tmp337, tmp338,
	ldr	x1, [x0]	// var.11_34, var
// IRIW_Relax_po_sys.cpp:119: 		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 44]	// _35, i
// IRIW_Relax_po_sys.cpp:119: 		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 8	// _36, _35,
	add	x0, x1, x0	// _37, var.11_34, _36
// IRIW_Relax_po_sys.cpp:119: 		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 232]	// _37, tmp_a
// IRIW_Relax_po_sys.cpp:120:     		(cpu_res0+i)->r0 = tmp_a->load(std::memory_order_acquire);
	ldr	x0, [sp, 232]	// _38, tmp_a
	str	x0, [sp, 264]	// _38, this
	mov	w0, 2	// tmp339,
	str	w0, [sp, 108]	// tmp339, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 108]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 112]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 264]	// _274, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _276,* _274
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48821, _276
// IRIW_Relax_po_sys.cpp:120:     		(cpu_res0+i)->r0 = tmp_a->load(std::memory_order_acquire);
	adrp	x0, cpu_res0	// tmp341,
	add	x0, x0, :lo12:cpu_res0	// tmp340, tmp341,
	ldr	x1, [x0]	// cpu_res0.12_40, cpu_res0
// IRIW_Relax_po_sys.cpp:120:     		(cpu_res0+i)->r0 = tmp_a->load(std::memory_order_acquire);
	ldrsw	x0, [sp, 44]	// _41, i
// IRIW_Relax_po_sys.cpp:120:     		(cpu_res0+i)->r0 = tmp_a->load(std::memory_order_acquire);
	lsl	x0, x0, 7	// _42, _41,
	add	x0, x1, x0	// _43, cpu_res0.12_40, _42
// IRIW_Relax_po_sys.cpp:120:     		(cpu_res0+i)->r0 = tmp_a->load(std::memory_order_acquire);
	mov	w1, w2	// _44, D.48821
// IRIW_Relax_po_sys.cpp:120:     		(cpu_res0+i)->r0 = tmp_a->load(std::memory_order_acquire);
	str	w1, [x0]	// _44, _43->r0
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	str	wzr, [sp, 48]	//, j
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	b	.L17		//
.L18:
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 48]	// tmp343, j
	add	w0, w0, 1	// tmp342, tmp343,
	str	w0, [sp, 48]	// tmp342, j
.L17:
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	adrp	x0, gpu_rand1	// tmp345,
	add	x0, x0, :lo12:gpu_rand1	// tmp344, tmp345,
	ldr	x1, [x0]	// gpu_rand1.14_45, gpu_rand1
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldrsw	x0, [sp, 44]	// _46, i
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	lsl	x0, x0, 2	// _47, _46,
	add	x0, x1, x0	// _48, gpu_rand1.14_45, _47
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w1, [x0]	// _49, *_48
// IRIW_Relax_po_sys.cpp:121:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 48]	// j.15_50, j
	cmp	w1, w0	// _49, j.15_50
	cset	w0, hi	// tmp347,
	and	w0, w0, 255	// retval.13_234, tmp346
	cmp	w0, 0	// retval.13_234,
	bne	.L18		//,
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	str	wzr, [sp, 52]	//, j
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	b	.L19		//
.L20:
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 52]	// tmp349, j
	add	w0, w0, 1	// tmp348, tmp349,
	str	w0, [sp, 52]	// tmp348, j
.L19:
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	adrp	x0, gpu_rand1	// tmp351,
	add	x0, x0, :lo12:gpu_rand1	// tmp350, tmp351,
	ldr	x1, [x0]	// gpu_rand1.17_51, gpu_rand1
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldrsw	x0, [sp, 44]	// _52, i
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	lsl	x0, x0, 2	// _53, _52,
	add	x0, x1, x0	// _54, gpu_rand1.17_51, _53
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w1, [x0]	// _55, *_54
// IRIW_Relax_po_sys.cpp:122:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 52]	// j.18_56, j
	cmp	w1, w0	// _55, j.18_56
	cset	w0, hi	// tmp353,
	and	w0, w0, 255	// retval.16_236, tmp352
	cmp	w0, 0	// retval.16_236,
	bne	.L20		//,
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	str	wzr, [sp, 56]	//, j
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	b	.L21		//
.L22:
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 56]	// tmp355, j
	add	w0, w0, 1	// tmp354, tmp355,
	str	w0, [sp, 56]	// tmp354, j
.L21:
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	adrp	x0, gpu_rand1	// tmp357,
	add	x0, x0, :lo12:gpu_rand1	// tmp356, tmp357,
	ldr	x1, [x0]	// gpu_rand1.20_57, gpu_rand1
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldrsw	x0, [sp, 44]	// _58, i
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	lsl	x0, x0, 2	// _59, _58,
	add	x0, x1, x0	// _60, gpu_rand1.20_57, _59
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w1, [x0]	// _61, *_60
// IRIW_Relax_po_sys.cpp:123:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 56]	// j.21_62, j
	cmp	w1, w0	// _61, j.21_62
	cset	w0, hi	// tmp359,
	and	w0, w0, 255	// retval.19_238, tmp358
	cmp	w0, 0	// retval.19_238,
	bne	.L22		//,
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	str	wzr, [sp, 60]	//, j
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	b	.L23		//
.L24:
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 60]	// tmp361, j
	add	w0, w0, 1	// tmp360, tmp361,
	str	w0, [sp, 60]	// tmp360, j
.L23:
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	adrp	x0, gpu_rand1	// tmp363,
	add	x0, x0, :lo12:gpu_rand1	// tmp362, tmp363,
	ldr	x1, [x0]	// gpu_rand1.23_63, gpu_rand1
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldrsw	x0, [sp, 44]	// _64, i
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	lsl	x0, x0, 2	// _65, _64,
	add	x0, x1, x0	// _66, gpu_rand1.23_63, _65
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w1, [x0]	// _67, *_66
// IRIW_Relax_po_sys.cpp:124:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 60]	// j.24_68, j
	cmp	w1, w0	// _67, j.24_68
	cset	w0, hi	// tmp365,
	and	w0, w0, 255	// retval.22_240, tmp364
	cmp	w0, 0	// retval.22_240,
	bne	.L24		//,
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	str	wzr, [sp, 64]	//, j
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	b	.L25		//
.L26:
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 64]	// tmp367, j
	add	w0, w0, 1	// tmp366, tmp367,
	str	w0, [sp, 64]	// tmp366, j
.L25:
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	adrp	x0, gpu_rand1	// tmp369,
	add	x0, x0, :lo12:gpu_rand1	// tmp368, tmp369,
	ldr	x1, [x0]	// gpu_rand1.26_69, gpu_rand1
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldrsw	x0, [sp, 44]	// _70, i
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	lsl	x0, x0, 2	// _71, _70,
	add	x0, x1, x0	// _72, gpu_rand1.26_69, _71
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w1, [x0]	// _73, *_72
// IRIW_Relax_po_sys.cpp:125:     		for (int j = 0; j < (*(gpu_rand1+i)); j++);
	ldr	w0, [sp, 64]	// j.27_74, j
	cmp	w1, w0	// _73, j.27_74
	cset	w0, hi	// tmp371,
	and	w0, w0, 255	// retval.25_242, tmp370
	cmp	w0, 0	// retval.25_242,
	bne	.L26		//,
// IRIW_Relax_po_sys.cpp:126:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b); 
	adrp	x0, var	// tmp373,
	add	x0, x0, :lo12:var	// tmp372, tmp373,
	ldr	x1, [x0]	// var.28_75, var
// IRIW_Relax_po_sys.cpp:126:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b); 
	ldrsw	x0, [sp, 44]	// _76, i
// IRIW_Relax_po_sys.cpp:126:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b); 
	lsl	x0, x0, 8	// _77, _76,
	add	x0, x1, x0	// _78, var.28_75, _77
// IRIW_Relax_po_sys.cpp:126:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b); 
	add	x0, x0, 128	// tmp374, _78,
	str	x0, [sp, 240]	// tmp374, tmp_b
// IRIW_Relax_po_sys.cpp:127:     		(gpu_res0+i)->r0 = tmp_b->load(std::memory_order_acquire);
	ldr	x0, [sp, 240]	// _79, tmp_b
	str	x0, [sp, 272]	// _79, this
	mov	w0, 2	// tmp375,
	str	w0, [sp, 116]	// tmp375, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 116]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 120]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 272]	// _281, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _283,* _281
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48827, _283
// IRIW_Relax_po_sys.cpp:127:     		(gpu_res0+i)->r0 = tmp_b->load(std::memory_order_acquire);
	adrp	x0, gpu_res0	// tmp377,
	add	x0, x0, :lo12:gpu_res0	// tmp376, tmp377,
	ldr	x1, [x0]	// gpu_res0.29_81, gpu_res0
// IRIW_Relax_po_sys.cpp:127:     		(gpu_res0+i)->r0 = tmp_b->load(std::memory_order_acquire);
	ldrsw	x0, [sp, 44]	// _82, i
// IRIW_Relax_po_sys.cpp:127:     		(gpu_res0+i)->r0 = tmp_b->load(std::memory_order_acquire);
	lsl	x0, x0, 7	// _83, _82,
	add	x0, x1, x0	// _84, gpu_res0.29_81, _83
// IRIW_Relax_po_sys.cpp:127:     		(gpu_res0+i)->r0 = tmp_b->load(std::memory_order_acquire);
	mov	w1, w2	// _85, D.48827
// IRIW_Relax_po_sys.cpp:127:     		(gpu_res0+i)->r0 = tmp_b->load(std::memory_order_acquire);
	str	w1, [x0]	// _85, _84->r0
// IRIW_Relax_po_sys.cpp:116: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 44]	// tmp379, i
	add	w0, w0, 4	// tmp378, tmp379,
	str	w0, [sp, 44]	// tmp378, i
.L15:
// IRIW_Relax_po_sys.cpp:116: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 44]	// tmp380, i
	mov	w0, 34463	// tmp381,
	movk	w0, 0x1, lsl 16	// tmp381,,
	cmp	w1, w0	// tmp380, tmp381
	ble	.L28		//,
	b	.L13		//
.L14:
// IRIW_Relax_po_sys.cpp:131: else if (tid / DEF_THREADS == 2)
	ldr	x0, [sp, 200]	// tid.30_86, tid
	sub	x0, x0, #8	// _87, tid.30_86,
	cmp	x0, 3	// _87,
	bhi	.L29		//,
// IRIW_Relax_po_sys.cpp:133: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 200]	// tmp382, tid
	negs	x1, x0	// tmp383, tmp382
	and	x0, x0, 3	// tmp384, tmp382,
	and	x1, x1, 3	// tmp385, tmp383,
	csneg	x0, x0, x1, mi	// _88, tmp384, tmp385,
// IRIW_Relax_po_sys.cpp:133: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 68]	// tmp386, i
// IRIW_Relax_po_sys.cpp:133: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L30		//
.L37:
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	str	xzr, [sp, 176]	//, j
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	b	.L31		//
.L32:
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	x0, [sp, 176]	// tmp388, j
	add	x0, x0, 1	// tmp387, tmp388,
	str	x0, [sp, 176]	// tmp387, j
.L31:
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	adrp	x0, cpu_rand2	// tmp390,
	add	x0, x0, :lo12:cpu_rand2	// tmp389, tmp390,
	ldr	x1, [x0]	// cpu_rand2.32_89, cpu_rand2
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldrsw	x0, [sp, 68]	// _90, i
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	lsl	x0, x0, 2	// _91, _90,
	add	x0, x1, x0	// _92, cpu_rand2.32_89, _91
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	w0, [x0]	// _93, *_92
	uxtw	x0, w0	// _94, _93
// IRIW_Relax_po_sys.cpp:136: 		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	x1, [sp, 176]	// tmp392, j
	cmp	x1, x0	// tmp392, _94
	cset	w0, lt	// tmp393,
	and	w0, w0, 255	// retval.31_220, tmp391
	cmp	w0, 0	// retval.31_220,
	bne	.L32		//,
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	str	xzr, [sp, 184]	//, j
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	b	.L33		//
.L34:
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	x0, [sp, 184]	// tmp395, j
	add	x0, x0, 1	// tmp394, tmp395,
	str	x0, [sp, 184]	// tmp394, j
.L33:
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	adrp	x0, cpu_rand2	// tmp397,
	add	x0, x0, :lo12:cpu_rand2	// tmp396, tmp397,
	ldr	x1, [x0]	// cpu_rand2.34_95, cpu_rand2
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldrsw	x0, [sp, 68]	// _96, i
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	lsl	x0, x0, 2	// _97, _96,
	add	x0, x1, x0	// _98, cpu_rand2.34_95, _97
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	w0, [x0]	// _99, *_98
	uxtw	x0, w0	// _100, _99
// IRIW_Relax_po_sys.cpp:137:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	x1, [sp, 184]	// tmp399, j
	cmp	x1, x0	// tmp399, _100
	cset	w0, lt	// tmp400,
	and	w0, w0, 255	// retval.33_222, tmp398
	cmp	w0, 0	// retval.33_222,
	bne	.L34		//,
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	str	xzr, [sp, 192]	//, j
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	b	.L35		//
.L36:
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	x0, [sp, 192]	// tmp402, j
	add	x0, x0, 1	// tmp401, tmp402,
	str	x0, [sp, 192]	// tmp401, j
.L35:
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	adrp	x0, cpu_rand2	// tmp404,
	add	x0, x0, :lo12:cpu_rand2	// tmp403, tmp404,
	ldr	x1, [x0]	// cpu_rand2.36_101, cpu_rand2
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldrsw	x0, [sp, 68]	// _102, i
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	lsl	x0, x0, 2	// _103, _102,
	add	x0, x1, x0	// _104, cpu_rand2.36_101, _103
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	w0, [x0]	// _105, *_104
	uxtw	x0, w0	// _106, _105
// IRIW_Relax_po_sys.cpp:138:     		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
	ldr	x1, [sp, 192]	// tmp406, j
	cmp	x1, x0	// tmp406, _106
	cset	w0, lt	// tmp407,
	and	w0, w0, 255	// retval.35_224, tmp405
	cmp	w0, 0	// retval.35_224,
	bne	.L36		//,
// IRIW_Relax_po_sys.cpp:139:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp409,
	add	x0, x0, :lo12:var	// tmp408, tmp409,
	ldr	x1, [x0]	// var.37_107, var
// IRIW_Relax_po_sys.cpp:139:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 68]	// _108, i
// IRIW_Relax_po_sys.cpp:139:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 8	// _109, _108,
	add	x0, x1, x0	// _110, var.37_107, _109
// IRIW_Relax_po_sys.cpp:139:     		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 128	// tmp410, _110,
	str	x0, [sp, 224]	// tmp410, tmp_b
// IRIW_Relax_po_sys.cpp:140:     		tmp_b->store(1, std::memory_order_release);
	ldr	x0, [sp, 224]	// _111, tmp_b
	str	x0, [sp, 280]	// _111, this
	mov	w0, 1	// tmp411,
	str	w0, [sp, 124]	// tmp411, __i
	mov	w0, 3	// tmp412,
	str	w0, [sp, 128]	// tmp412, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 128]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 132]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 280]	// _289, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 124]	// __i.58_290, __i
	stlr	w1, [x0]	// __i.58_290,* _289
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// IRIW_Relax_po_sys.cpp:133: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 68]	// tmp414, i
	add	w0, w0, 4	// tmp413, tmp414,
	str	w0, [sp, 68]	// tmp413, i
.L30:
// IRIW_Relax_po_sys.cpp:133: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 68]	// tmp415, i
	mov	w0, 34463	// tmp416,
	movk	w0, 0x1, lsl 16	// tmp416,,
	cmp	w1, w0	// tmp415, tmp416
	ble	.L37		//,
	b	.L13		//
.L29:
// IRIW_Relax_po_sys.cpp:145: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 200]	// tmp417, tid
	negs	x1, x0	// tmp418, tmp417
	and	x0, x0, 3	// tmp419, tmp417,
	and	x1, x1, 3	// tmp420, tmp418,
	csneg	x0, x0, x1, mi	// _112, tmp419, tmp420,
// IRIW_Relax_po_sys.cpp:145: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 72]	// tmp421, i
// IRIW_Relax_po_sys.cpp:145: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L38		//
.L51:
// IRIW_Relax_po_sys.cpp:148: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp423,
	add	x0, x0, :lo12:var	// tmp422, tmp423,
	ldr	x1, [x0]	// var.38_113, var
// IRIW_Relax_po_sys.cpp:148: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 72]	// _114, i
// IRIW_Relax_po_sys.cpp:148: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 8	// _115, _114,
	add	x0, x1, x0	// _116, var.38_113, _115
// IRIW_Relax_po_sys.cpp:148: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 128	// tmp424, _116,
	str	x0, [sp, 208]	// tmp424, tmp_b
// IRIW_Relax_po_sys.cpp:149: 		(gpu_res1+i)->r0 = tmp_b->load(std::memory_order_acquire);
	ldr	x0, [sp, 208]	// _117, tmp_b
	str	x0, [sp, 288]	// _117, this
	mov	w0, 2	// tmp425,
	str	w0, [sp, 136]	// tmp425, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 136]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 140]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 288]	// _295, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _297,* _295
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48837, _297
// IRIW_Relax_po_sys.cpp:149: 		(gpu_res1+i)->r0 = tmp_b->load(std::memory_order_acquire);
	adrp	x0, gpu_res1	// tmp427,
	add	x0, x0, :lo12:gpu_res1	// tmp426, tmp427,
	ldr	x1, [x0]	// gpu_res1.39_119, gpu_res1
// IRIW_Relax_po_sys.cpp:149: 		(gpu_res1+i)->r0 = tmp_b->load(std::memory_order_acquire);
	ldrsw	x0, [sp, 72]	// _120, i
// IRIW_Relax_po_sys.cpp:149: 		(gpu_res1+i)->r0 = tmp_b->load(std::memory_order_acquire);
	lsl	x0, x0, 7	// _121, _120,
	add	x0, x1, x0	// _122, gpu_res1.39_119, _121
// IRIW_Relax_po_sys.cpp:149: 		(gpu_res1+i)->r0 = tmp_b->load(std::memory_order_acquire);
	mov	w1, w2	// _123, D.48837
// IRIW_Relax_po_sys.cpp:149: 		(gpu_res1+i)->r0 = tmp_b->load(std::memory_order_acquire);
	str	w1, [x0]	// _123, _122->r0
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	str	wzr, [sp, 76]	//, j
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	b	.L40		//
.L41:
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 76]	// tmp429, j
	add	w0, w0, 1	// tmp428, tmp429,
	str	w0, [sp, 76]	// tmp428, j
.L40:
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	adrp	x0, gpu_rand2	// tmp431,
	add	x0, x0, :lo12:gpu_rand2	// tmp430, tmp431,
	ldr	x1, [x0]	// gpu_rand2.41_124, gpu_rand2
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldrsw	x0, [sp, 72]	// _125, i
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	lsl	x0, x0, 2	// _126, _125,
	add	x0, x1, x0	// _127, gpu_rand2.41_124, _126
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w1, [x0]	// _128, *_127
// IRIW_Relax_po_sys.cpp:150: 		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 76]	// j.42_129, j
	cmp	w1, w0	// _128, j.42_129
	cset	w0, hi	// tmp433,
	and	w0, w0, 255	// retval.40_201, tmp432
	cmp	w0, 0	// retval.40_201,
	bne	.L41		//,
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	str	wzr, [sp, 80]	//, j
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	b	.L42		//
.L43:
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 80]	// tmp435, j
	add	w0, w0, 1	// tmp434, tmp435,
	str	w0, [sp, 80]	// tmp434, j
.L42:
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	adrp	x0, gpu_rand2	// tmp437,
	add	x0, x0, :lo12:gpu_rand2	// tmp436, tmp437,
	ldr	x1, [x0]	// gpu_rand2.44_130, gpu_rand2
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldrsw	x0, [sp, 72]	// _131, i
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	lsl	x0, x0, 2	// _132, _131,
	add	x0, x1, x0	// _133, gpu_rand2.44_130, _132
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w1, [x0]	// _134, *_133
// IRIW_Relax_po_sys.cpp:151:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 80]	// j.45_135, j
	cmp	w1, w0	// _134, j.45_135
	cset	w0, hi	// tmp439,
	and	w0, w0, 255	// retval.43_203, tmp438
	cmp	w0, 0	// retval.43_203,
	bne	.L43		//,
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	str	wzr, [sp, 84]	//, j
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	b	.L44		//
.L45:
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 84]	// tmp441, j
	add	w0, w0, 1	// tmp440, tmp441,
	str	w0, [sp, 84]	// tmp440, j
.L44:
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	adrp	x0, gpu_rand2	// tmp443,
	add	x0, x0, :lo12:gpu_rand2	// tmp442, tmp443,
	ldr	x1, [x0]	// gpu_rand2.47_136, gpu_rand2
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldrsw	x0, [sp, 72]	// _137, i
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	lsl	x0, x0, 2	// _138, _137,
	add	x0, x1, x0	// _139, gpu_rand2.47_136, _138
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w1, [x0]	// _140, *_139
// IRIW_Relax_po_sys.cpp:152:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 84]	// j.48_141, j
	cmp	w1, w0	// _140, j.48_141
	cset	w0, hi	// tmp445,
	and	w0, w0, 255	// retval.46_205, tmp444
	cmp	w0, 0	// retval.46_205,
	bne	.L45		//,
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	str	wzr, [sp, 88]	//, j
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	b	.L46		//
.L47:
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 88]	// tmp447, j
	add	w0, w0, 1	// tmp446, tmp447,
	str	w0, [sp, 88]	// tmp446, j
.L46:
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	adrp	x0, gpu_rand2	// tmp449,
	add	x0, x0, :lo12:gpu_rand2	// tmp448, tmp449,
	ldr	x1, [x0]	// gpu_rand2.50_142, gpu_rand2
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldrsw	x0, [sp, 72]	// _143, i
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	lsl	x0, x0, 2	// _144, _143,
	add	x0, x1, x0	// _145, gpu_rand2.50_142, _144
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w1, [x0]	// _146, *_145
// IRIW_Relax_po_sys.cpp:153:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 88]	// j.51_147, j
	cmp	w1, w0	// _146, j.51_147
	cset	w0, hi	// tmp451,
	and	w0, w0, 255	// retval.49_207, tmp450
	cmp	w0, 0	// retval.49_207,
	bne	.L47		//,
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	str	wzr, [sp, 92]	//, j
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	b	.L48		//
.L49:
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 92]	// tmp453, j
	add	w0, w0, 1	// tmp452, tmp453,
	str	w0, [sp, 92]	// tmp452, j
.L48:
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	adrp	x0, gpu_rand2	// tmp455,
	add	x0, x0, :lo12:gpu_rand2	// tmp454, tmp455,
	ldr	x1, [x0]	// gpu_rand2.53_148, gpu_rand2
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldrsw	x0, [sp, 72]	// _149, i
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	lsl	x0, x0, 2	// _150, _149,
	add	x0, x1, x0	// _151, gpu_rand2.53_148, _150
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w1, [x0]	// _152, *_151
// IRIW_Relax_po_sys.cpp:154:     		for (int j = 0; j < (*(gpu_rand2+i)); j++);
	ldr	w0, [sp, 92]	// j.54_153, j
	cmp	w1, w0	// _152, j.54_153
	cset	w0, hi	// tmp457,
	and	w0, w0, 255	// retval.52_209, tmp456
	cmp	w0, 0	// retval.52_209,
	bne	.L49		//,
// IRIW_Relax_po_sys.cpp:155:     		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp459,
	add	x0, x0, :lo12:var	// tmp458, tmp459,
	ldr	x1, [x0]	// var.55_154, var
// IRIW_Relax_po_sys.cpp:155:     		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 72]	// _155, i
// IRIW_Relax_po_sys.cpp:155:     		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 8	// _156, _155,
	add	x0, x1, x0	// _157, var.55_154, _156
// IRIW_Relax_po_sys.cpp:155:     		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 216]	// _157, tmp_a
// IRIW_Relax_po_sys.cpp:156:     		(cpu_res1+i)->r0 = tmp_a->load(std::memory_order_acquire);
	ldr	x0, [sp, 216]	// _158, tmp_a
	str	x0, [sp, 296]	// _158, this
	mov	w0, 2	// tmp460,
	str	w0, [sp, 144]	// tmp460, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 144]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 148]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 296]	// _302, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _304,* _302
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48843, _304
// IRIW_Relax_po_sys.cpp:156:     		(cpu_res1+i)->r0 = tmp_a->load(std::memory_order_acquire);
	adrp	x0, cpu_res1	// tmp462,
	add	x0, x0, :lo12:cpu_res1	// tmp461, tmp462,
	ldr	x1, [x0]	// cpu_res1.56_160, cpu_res1
// IRIW_Relax_po_sys.cpp:156:     		(cpu_res1+i)->r0 = tmp_a->load(std::memory_order_acquire);
	ldrsw	x0, [sp, 72]	// _161, i
// IRIW_Relax_po_sys.cpp:156:     		(cpu_res1+i)->r0 = tmp_a->load(std::memory_order_acquire);
	lsl	x0, x0, 7	// _162, _161,
	add	x0, x1, x0	// _163, cpu_res1.56_160, _162
// IRIW_Relax_po_sys.cpp:156:     		(cpu_res1+i)->r0 = tmp_a->load(std::memory_order_acquire);
	mov	w1, w2	// _164, D.48843
// IRIW_Relax_po_sys.cpp:156:     		(cpu_res1+i)->r0 = tmp_a->load(std::memory_order_acquire);
	str	w1, [x0]	// _164, _163->r0
// IRIW_Relax_po_sys.cpp:145: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 72]	// tmp464, i
	add	w0, w0, 4	// tmp463, tmp464,
	str	w0, [sp, 72]	// tmp463, i
.L38:
// IRIW_Relax_po_sys.cpp:145: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w1, [sp, 72]	// tmp465, i
	mov	w0, 34463	// tmp466,
	movk	w0, 0x1, lsl 16	// tmp466,,
	cmp	w1, w0	// tmp465, tmp466
	ble	.L51		//,
.L13:
// IRIW_Relax_po_sys.cpp:163:     return (void*)local;
	mrs	x0, tpidr_el0	// tmp468
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp467, tmp468,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp467,
	ldr	w0, [x0]	// local.57_165, local
	sxtw	x0, w0	// _166, local.57_165
// IRIW_Relax_po_sys.cpp:164: }
	ldp	x29, x30, [sp], 304	//,,,
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
	stp	x29, x30, [sp, -96]!	//,,,
	.cfi_def_cfa_offset 96
	.cfi_offset 29, -96
	.cfi_offset 30, -88
	mov	x29, sp	//,
	str	w0, [sp, 28]	// t_range, t_range
// IRIW_Relax_po_sys.cpp:169:     unsigned res_cpu0_gpu0 = 0;
	str	wzr, [sp, 44]	//, res_cpu0_gpu0
// IRIW_Relax_po_sys.cpp:170:     unsigned res_cpu1_gpu0 = 0;
	str	wzr, [sp, 48]	//, res_cpu1_gpu0
// IRIW_Relax_po_sys.cpp:171:     unsigned res_cpu0_gpu1 = 0;
	str	wzr, [sp, 52]	//, res_cpu0_gpu1
// IRIW_Relax_po_sys.cpp:172:     unsigned res_cpu1_gpu1 = 0;
	str	wzr, [sp, 56]	//, res_cpu1_gpu1
// IRIW_Relax_po_sys.cpp:173:     unsigned res_cpu2_gpu2 = 0;
	str	wzr, [sp, 60]	//, res_cpu2_gpu2
// IRIW_Relax_po_sys.cpp:175:     unsigned rst_cpu0_gpu0 = 0;
	str	wzr, [sp, 64]	//, rst_cpu0_gpu0
// IRIW_Relax_po_sys.cpp:176:     unsigned rst_cpu1_gpu0 = 0;
	str	wzr, [sp, 68]	//, rst_cpu1_gpu0
// IRIW_Relax_po_sys.cpp:177:     unsigned rst_cpu0_gpu1 = 0;
	str	wzr, [sp, 72]	//, rst_cpu0_gpu1
// IRIW_Relax_po_sys.cpp:178:     unsigned rst_cpu1_gpu1 = 0;
	str	wzr, [sp, 76]	//, rst_cpu1_gpu1
// IRIW_Relax_po_sys.cpp:179:     unsigned rst_cpu2_gpu2 = 0;
	str	wzr, [sp, 80]	//, rst_cpu2_gpu2
// IRIW_Relax_po_sys.cpp:180:     int pass = 0;
	str	wzr, [sp, 84]	//, pass
// IRIW_Relax_po_sys.cpp:181:     int failure = 0;
	str	wzr, [sp, 88]	//, failure
// IRIW_Relax_po_sys.cpp:183:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 92]	//, i
// IRIW_Relax_po_sys.cpp:183:     for (auto i = 0; i < t_range; ++i) {
	b	.L54		//
.L85:
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, cpu_res0	// tmp257,
	add	x0, x0, :lo12:cpu_res0	// tmp256, tmp257,
	ldr	x1, [x0]	// cpu_res0.65_1, cpu_res0
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _2, i
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 7	// _3, _2,
	add	x0, x1, x0	// _4, cpu_res0.65_1, _3
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _5, _4->r0
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// _5,
	bne	.L55		//,
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, gpu_res0	// tmp259,
	add	x0, x0, :lo12:gpu_res0	// tmp258, tmp259,
	ldr	x1, [x0]	// gpu_res0.66_6, gpu_res0
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _7, i
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 7	// _8, _7,
	add	x0, x1, x0	// _9, gpu_res0.66_6, _8
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _10, _9->r0
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// _10,
	bne	.L55		//,
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 1	// iftmp.64_179,
	b	.L56		//
.L55:
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 0	// iftmp.64_179,
.L56:
// IRIW_Relax_po_sys.cpp:184:         if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.64_179,
	beq	.L57		//,
// IRIW_Relax_po_sys.cpp:185:             res_cpu0_gpu0++;
	ldr	w0, [sp, 44]	// tmp261, res_cpu0_gpu0
	add	w0, w0, 1	// tmp260, tmp261,
	str	w0, [sp, 44]	// tmp260, res_cpu0_gpu0
	b	.L58		//
.L57:
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, cpu_res0	// tmp263,
	add	x0, x0, :lo12:cpu_res0	// tmp262, tmp263,
	ldr	x1, [x0]	// cpu_res0.69_11, cpu_res0
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _12, i
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 7	// _13, _12,
	add	x0, x1, x0	// _14, cpu_res0.69_11, _13
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _15, _14->r0
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 1	// _15,
	bne	.L59		//,
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	adrp	x0, gpu_res0	// tmp265,
	add	x0, x0, :lo12:gpu_res0	// tmp264, tmp265,
	ldr	x1, [x0]	// gpu_res0.70_16, gpu_res0
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _17, i
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	lsl	x0, x0, 7	// _18, _17,
	add	x0, x1, x0	// _19, gpu_res0.70_16, _18
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	ldr	w0, [x0]	// _20, _19->r0
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// _20,
	bne	.L59		//,
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 1	// iftmp.68_180,
	b	.L60		//
.L59:
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	mov	w0, 0	// iftmp.68_180,
.L60:
// IRIW_Relax_po_sys.cpp:186:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.68_180,
	beq	.L61		//,
// IRIW_Relax_po_sys.cpp:187:             res_cpu1_gpu0++;
	ldr	w0, [sp, 48]	// tmp267, res_cpu1_gpu0
	add	w0, w0, 1	// tmp266, tmp267,
	str	w0, [sp, 48]	// tmp266, res_cpu1_gpu0
	b	.L58		//
.L61:
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, cpu_res0	// tmp269,
	add	x0, x0, :lo12:cpu_res0	// tmp268, tmp269,
	ldr	x1, [x0]	// cpu_res0.73_21, cpu_res0
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _22, i
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 7	// _23, _22,
	add	x0, x1, x0	// _24, cpu_res0.73_21, _23
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _25, _24->r0
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 0	// _25,
	bne	.L62		//,
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, gpu_res0	// tmp271,
	add	x0, x0, :lo12:gpu_res0	// tmp270, tmp271,
	ldr	x1, [x0]	// gpu_res0.74_26, gpu_res0
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _27, i
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 7	// _28, _27,
	add	x0, x1, x0	// _29, gpu_res0.74_26, _28
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _30, _29->r0
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 1	// _30,
	bne	.L62		//,
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 1	// iftmp.72_181,
	b	.L63		//
.L62:
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 0	// iftmp.72_181,
.L63:
// IRIW_Relax_po_sys.cpp:188:         } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.72_181,
	beq	.L64		//,
// IRIW_Relax_po_sys.cpp:189:             res_cpu0_gpu1++;
	ldr	w0, [sp, 52]	// tmp273, res_cpu0_gpu1
	add	w0, w0, 1	// tmp272, tmp273,
	str	w0, [sp, 52]	// tmp272, res_cpu0_gpu1
	b	.L58		//
.L64:
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, cpu_res0	// tmp275,
	add	x0, x0, :lo12:cpu_res0	// tmp274, tmp275,
	ldr	x1, [x0]	// cpu_res0.77_31, cpu_res0
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _32, i
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 7	// _33, _32,
	add	x0, x1, x0	// _34, cpu_res0.77_31, _33
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _35, _34->r0
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 1	// _35,
	bne	.L65		//,
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	adrp	x0, gpu_res0	// tmp277,
	add	x0, x0, :lo12:gpu_res0	// tmp276, tmp277,
	ldr	x1, [x0]	// gpu_res0.78_36, gpu_res0
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _37, i
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	lsl	x0, x0, 7	// _38, _37,
	add	x0, x1, x0	// _39, gpu_res0.78_36, _38
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	ldr	w0, [x0]	// _40, _39->r0
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 1	// _40,
	bne	.L65		//,
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 1	// iftmp.76_182,
	b	.L66		//
.L65:
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	mov	w0, 0	// iftmp.76_182,
.L66:
// IRIW_Relax_po_sys.cpp:190:         } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.76_182,
	beq	.L67		//,
// IRIW_Relax_po_sys.cpp:191:             res_cpu1_gpu1++;
	ldr	w0, [sp, 56]	// tmp279, res_cpu1_gpu1
	add	w0, w0, 1	// tmp278, tmp279,
	str	w0, [sp, 56]	// tmp278, res_cpu1_gpu1
	b	.L58		//
.L67:
// IRIW_Relax_po_sys.cpp:194:             res_cpu2_gpu2++;
	ldr	w0, [sp, 60]	// tmp281, res_cpu2_gpu2
	add	w0, w0, 1	// tmp280, tmp281,
	str	w0, [sp, 60]	// tmp280, res_cpu2_gpu2
.L58:
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, cpu_res1	// tmp283,
	add	x0, x0, :lo12:cpu_res1	// tmp282, tmp283,
	ldr	x1, [x0]	// cpu_res1.81_41, cpu_res1
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _42, i
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 7	// _43, _42,
	add	x0, x1, x0	// _44, cpu_res1.81_41, _43
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _45, _44->r0
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// _45,
	bne	.L68		//,
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, gpu_res1	// tmp285,
	add	x0, x0, :lo12:gpu_res1	// tmp284, tmp285,
	ldr	x1, [x0]	// gpu_res1.82_46, gpu_res1
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _47, i
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 7	// _48, _47,
	add	x0, x1, x0	// _49, gpu_res1.82_46, _48
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _50, _49->r0
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// _50,
	bne	.L68		//,
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 1	// iftmp.80_183,
	b	.L69		//
.L68:
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 0	// iftmp.80_183,
.L69:
// IRIW_Relax_po_sys.cpp:197:         if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.80_183,
	beq	.L70		//,
// IRIW_Relax_po_sys.cpp:198:             rst_cpu0_gpu0++;
	ldr	w0, [sp, 64]	// tmp287, rst_cpu0_gpu0
	add	w0, w0, 1	// tmp286, tmp287,
	str	w0, [sp, 64]	// tmp286, rst_cpu0_gpu0
	b	.L71		//
.L70:
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, cpu_res1	// tmp289,
	add	x0, x0, :lo12:cpu_res1	// tmp288, tmp289,
	ldr	x1, [x0]	// cpu_res1.85_51, cpu_res1
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _52, i
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 7	// _53, _52,
	add	x0, x1, x0	// _54, cpu_res1.85_51, _53
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _55, _54->r0
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 1	// _55,
	bne	.L72		//,
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	adrp	x0, gpu_res1	// tmp291,
	add	x0, x0, :lo12:gpu_res1	// tmp290, tmp291,
	ldr	x1, [x0]	// gpu_res1.86_56, gpu_res1
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldrsw	x0, [sp, 92]	// _57, i
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	lsl	x0, x0, 7	// _58, _57,
	add	x0, x1, x0	// _59, gpu_res1.86_56, _58
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	ldr	w0, [x0]	// _60, _59->r0
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// _60,
	bne	.L72		//,
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 1	// iftmp.84_184,
	b	.L73		//
.L72:
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	mov	w0, 0	// iftmp.84_184,
.L73:
// IRIW_Relax_po_sys.cpp:199:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.84_184,
	beq	.L74		//,
// IRIW_Relax_po_sys.cpp:200:             rst_cpu1_gpu0++;
	ldr	w0, [sp, 68]	// tmp293, rst_cpu1_gpu0
	add	w0, w0, 1	// tmp292, tmp293,
	str	w0, [sp, 68]	// tmp292, rst_cpu1_gpu0
	b	.L71		//
.L74:
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, cpu_res1	// tmp295,
	add	x0, x0, :lo12:cpu_res1	// tmp294, tmp295,
	ldr	x1, [x0]	// cpu_res1.89_61, cpu_res1
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _62, i
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _63, _62,
	add	x0, x1, x0	// _64, cpu_res1.89_61, _63
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _65, _64->r0
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// _65,
	bne	.L75		//,
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, gpu_res1	// tmp297,
	add	x0, x0, :lo12:gpu_res1	// tmp296, tmp297,
	ldr	x1, [x0]	// gpu_res1.90_66, gpu_res1
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _67, i
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _68, _67,
	add	x0, x1, x0	// _69, gpu_res1.90_66, _68
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _70, _69->r0
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _70,
	bne	.L75		//,
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 1	// iftmp.88_185,
	b	.L76		//
.L75:
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 0	// iftmp.88_185,
.L76:
// IRIW_Relax_po_sys.cpp:201:         } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.88_185,
	beq	.L77		//,
// IRIW_Relax_po_sys.cpp:202:             rst_cpu0_gpu1++;
	ldr	w0, [sp, 72]	// tmp299, rst_cpu0_gpu1
	add	w0, w0, 1	// tmp298, tmp299,
	str	w0, [sp, 72]	// tmp298, rst_cpu0_gpu1
	b	.L71		//
.L77:
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, cpu_res1	// tmp301,
	add	x0, x0, :lo12:cpu_res1	// tmp300, tmp301,
	ldr	x1, [x0]	// cpu_res1.93_71, cpu_res1
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _72, i
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _73, _72,
	add	x0, x1, x0	// _74, cpu_res1.93_71, _73
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _75, _74->r0
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _75,
	bne	.L78		//,
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, gpu_res1	// tmp303,
	add	x0, x0, :lo12:gpu_res1	// tmp302, tmp303,
	ldr	x1, [x0]	// gpu_res1.94_76, gpu_res1
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _77, i
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _78, _77,
	add	x0, x1, x0	// _79, gpu_res1.94_76, _78
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _80, _79->r0
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _80,
	bne	.L78		//,
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 1	// iftmp.92_186,
	b	.L79		//
.L78:
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 0	// iftmp.92_186,
.L79:
// IRIW_Relax_po_sys.cpp:203:         } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.92_186,
	beq	.L80		//,
// IRIW_Relax_po_sys.cpp:204:             rst_cpu1_gpu1++;
	ldr	w0, [sp, 76]	// tmp305, rst_cpu1_gpu1
	add	w0, w0, 1	// tmp304, tmp305,
	str	w0, [sp, 76]	// tmp304, rst_cpu1_gpu1
	b	.L71		//
.L80:
// IRIW_Relax_po_sys.cpp:207:             rst_cpu2_gpu2++;
	ldr	w0, [sp, 80]	// tmp307, rst_cpu2_gpu2
	add	w0, w0, 1	// tmp306, tmp307,
	str	w0, [sp, 80]	// tmp306, rst_cpu2_gpu2
.L71:
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, cpu_res0	// tmp309,
	add	x0, x0, :lo12:cpu_res0	// tmp308, tmp309,
	ldr	x1, [x0]	// cpu_res0.97_81, cpu_res0
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _82, i
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _83, _82,
	add	x0, x1, x0	// _84, cpu_res0.97_81, _83
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _85, _84->r0
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _85,
	bne	.L81		//,
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, gpu_res0	// tmp311,
	add	x0, x0, :lo12:gpu_res0	// tmp310, tmp311,
	ldr	x1, [x0]	// gpu_res0.98_86, gpu_res0
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _87, i
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _88, _87,
	add	x0, x1, x0	// _89, gpu_res0.98_86, _88
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _90, _89->r0
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// _90,
	bne	.L81		//,
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, cpu_res1	// tmp313,
	add	x0, x0, :lo12:cpu_res1	// tmp312, tmp313,
	ldr	x1, [x0]	// cpu_res1.99_91, cpu_res1
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _92, i
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _93, _92,
	add	x0, x1, x0	// _94, cpu_res1.99_91, _93
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _95, _94->r0
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// _95,
	bne	.L81		//,
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	adrp	x0, gpu_res1	// tmp315,
	add	x0, x0, :lo12:gpu_res1	// tmp314, tmp315,
	ldr	x1, [x0]	// gpu_res1.100_96, gpu_res1
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldrsw	x0, [sp, 92]	// _97, i
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	lsl	x0, x0, 7	// _98, _97,
	add	x0, x1, x0	// _99, gpu_res1.100_96, _98
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	ldr	w0, [x0]	// _100, _99->r0
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 1	// _100,
	bne	.L81		//,
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 1	// iftmp.96_187,
	b	.L82		//
.L81:
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	mov	w0, 0	// iftmp.96_187,
.L82:
// IRIW_Relax_po_sys.cpp:210:         if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.96_187,
	beq	.L83		//,
// IRIW_Relax_po_sys.cpp:211:     		failure++;
	ldr	w0, [sp, 88]	// tmp317, failure
	add	w0, w0, 1	// tmp316, tmp317,
	str	w0, [sp, 88]	// tmp316, failure
	b	.L84		//
.L83:
// IRIW_Relax_po_sys.cpp:215:         	pass++;
	ldr	w0, [sp, 84]	// tmp319, pass
	add	w0, w0, 1	// tmp318, tmp319,
	str	w0, [sp, 84]	// tmp318, pass
.L84:
// IRIW_Relax_po_sys.cpp:183:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 92]	// tmp321, i
	add	w0, w0, 1	// tmp320, tmp321,
	str	w0, [sp, 92]	// tmp320, i
.L54:
// IRIW_Relax_po_sys.cpp:183:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 92]	// i.101_101, i
// IRIW_Relax_po_sys.cpp:183:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 28]	// tmp322, t_range
	cmp	w1, w0	// tmp322, i.101_101
	bhi	.L85		//,
// IRIW_Relax_po_sys.cpp:219:      	std::cout << "Pass Test: " << pass << std::endl;
	adrp	x0, .LC0	// tmp323,
	add	x1, x0, :lo12:.LC0	//, tmp323,
	adrp	x0, :got:_ZSt4cout	// tmp324,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp324,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:219:      	std::cout << "Pass Test: " << pass << std::endl;
	ldr	w1, [sp, 84]	//, pass
	bl	_ZNSolsEi		//
	mov	x2, x0	// _103,
// IRIW_Relax_po_sys.cpp:219:      	std::cout << "Pass Test: " << pass << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp325,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp325,
	mov	x0, x2	//, _103
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:220: 	std::cout << "Failure Test: " << failure << std::endl;
	adrp	x0, .LC1	// tmp326,
	add	x1, x0, :lo12:.LC1	//, tmp326,
	adrp	x0, :got:_ZSt4cout	// tmp327,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp327,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:220: 	std::cout << "Failure Test: " << failure << std::endl;
	ldr	w1, [sp, 88]	//, failure
	bl	_ZNSolsEi		//
	mov	x2, x0	// _105,
// IRIW_Relax_po_sys.cpp:220: 	std::cout << "Failure Test: " << failure << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp328,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp328,
	mov	x0, x2	//, _105
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:221:         if (failure != 0)
	ldr	w0, [sp, 88]	// tmp329, failure
	cmp	w0, 0	// tmp329,
	beq	.L86		//,
// IRIW_Relax_po_sys.cpp:223: 		std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC2	// tmp330,
	add	x1, x0, :lo12:.LC2	//, tmp330,
	adrp	x0, :got:_ZSt4cout	// tmp331,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp331,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _106,
// IRIW_Relax_po_sys.cpp:223: 		std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp332,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp332,
	mov	x0, x2	//, _106
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:224:         	std::cout << "	\t CPU-Only IRIW-sys Allowed  \t " << std::endl;						
	adrp	x0, .LC3	// tmp333,
	add	x1, x0, :lo12:.LC3	//, tmp333,
	adrp	x0, :got:_ZSt4cout	// tmp334,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp334,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _107,
// IRIW_Relax_po_sys.cpp:224:         	std::cout << "	\t CPU-Only IRIW-sys Allowed  \t " << std::endl;						
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp335,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp335,
	mov	x0, x2	//, _107
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:225:         	std::cout << "=========================================================================" << std::endl;  
	adrp	x0, .LC2	// tmp336,
	add	x1, x0, :lo12:.LC2	//, tmp336,
	adrp	x0, :got:_ZSt4cout	// tmp337,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp337,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _108,
// IRIW_Relax_po_sys.cpp:225:         	std::cout << "=========================================================================" << std::endl;  
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp338,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp338,
	mov	x0, x2	//, _108
	bl	_ZNSolsEPFRSoS_E		//
	b	.L87		//
.L86:
// IRIW_Relax_po_sys.cpp:229: 		std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC2	// tmp339,
	add	x1, x0, :lo12:.LC2	//, tmp339,
	adrp	x0, :got:_ZSt4cout	// tmp340,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp340,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _109,
// IRIW_Relax_po_sys.cpp:229: 		std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp341,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp341,
	mov	x0, x2	//, _109
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:230:         	std::cout << "	\t CPU-Only IRIW-sys Disallowed  \t " << std::endl;						
	adrp	x0, .LC4	// tmp342,
	add	x1, x0, :lo12:.LC4	//, tmp342,
	adrp	x0, :got:_ZSt4cout	// tmp343,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp343,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _110,
// IRIW_Relax_po_sys.cpp:230:         	std::cout << "	\t CPU-Only IRIW-sys Disallowed  \t " << std::endl;						
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp344,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp344,
	mov	x0, x2	//, _110
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:231:         	std::cout << "=========================================================================" << std::endl;  
	adrp	x0, .LC2	// tmp345,
	add	x1, x0, :lo12:.LC2	//, tmp345,
	adrp	x0, :got:_ZSt4cout	// tmp346,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp346,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _111,
// IRIW_Relax_po_sys.cpp:231:         	std::cout << "=========================================================================" << std::endl;  
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp347,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp347,
	mov	x0, x2	//, _111
	bl	_ZNSolsEPFRSoS_E		//
.L87:
// IRIW_Relax_po_sys.cpp:234:     if ((!res_cpu1_gpu0) && (!rst_cpu0_gpu1)) {
	ldr	w0, [sp, 48]	// tmp348, res_cpu1_gpu0
	cmp	w0, 0	// tmp348,
	bne	.L88		//,
// IRIW_Relax_po_sys.cpp:234:     if ((!res_cpu1_gpu0) && (!rst_cpu0_gpu1)) {
	ldr	w0, [sp, 72]	// tmp349, rst_cpu0_gpu1
	cmp	w0, 0	// tmp349,
	bne	.L88		//,
// IRIW_Relax_po_sys.cpp:235:         std::cout << "Success!" << std::endl;
	adrp	x0, .LC5	// tmp350,
	add	x1, x0, :lo12:.LC5	//, tmp350,
	adrp	x0, :got:_ZSt4cout	// tmp351,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp351,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _112,
// IRIW_Relax_po_sys.cpp:235:         std::cout << "Success!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp352,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp352,
	mov	x0, x2	//, _112
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:236:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, .LC6	// tmp353,
	add	x1, x0, :lo12:.LC6	//, tmp353,
	adrp	x0, :got:_ZSt4cout	// tmp354,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp354,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:236:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _114,
// IRIW_Relax_po_sys.cpp:236:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp355,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp355,
	mov	x0, x2	//, _114
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:237:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, .LC7	// tmp356,
	add	x1, x0, :lo12:.LC7	//, tmp356,
	adrp	x0, :got:_ZSt4cout	// tmp357,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp357,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:237:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _116,
// IRIW_Relax_po_sys.cpp:237:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp358,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp358,
	mov	x0, x2	//, _116
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:238:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, .LC8	// tmp359,
	add	x1, x0, :lo12:.LC8	//, tmp359,
	adrp	x0, :got:_ZSt4cout	// tmp360,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp360,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:238:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _118,
// IRIW_Relax_po_sys.cpp:238:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp361,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp361,
	mov	x0, x2	//, _118
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:239:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, .LC9	// tmp362,
	add	x1, x0, :lo12:.LC9	//, tmp362,
	adrp	x0, :got:_ZSt4cout	// tmp363,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp363,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:239:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 56]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _120,
// IRIW_Relax_po_sys.cpp:239:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp364,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp364,
	mov	x0, x2	//, _120
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:240:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl; 
	adrp	x0, .LC10	// tmp365,
	add	x1, x0, :lo12:.LC10	//, tmp365,
	adrp	x0, :got:_ZSt4cout	// tmp366,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp366,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:240:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl; 
	ldr	w1, [sp, 60]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _122,
// IRIW_Relax_po_sys.cpp:240:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl; 
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp367,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp367,
	mov	x0, x2	//, _122
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:241:         std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
	adrp	x0, .LC6	// tmp368,
	add	x1, x0, :lo12:.LC6	//, tmp368,
	adrp	x0, :got:_ZSt4cout	// tmp369,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp369,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:241:         std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
	ldr	w1, [sp, 64]	//, rst_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _124,
// IRIW_Relax_po_sys.cpp:241:         std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp370,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp370,
	mov	x0, x2	//, _124
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:242:         std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
	adrp	x0, .LC7	// tmp371,
	add	x1, x0, :lo12:.LC7	//, tmp371,
	adrp	x0, :got:_ZSt4cout	// tmp372,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp372,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:242:         std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
	ldr	w1, [sp, 68]	//, rst_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _126,
// IRIW_Relax_po_sys.cpp:242:         std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp373,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp373,
	mov	x0, x2	//, _126
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:243:         std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
	adrp	x0, .LC8	// tmp374,
	add	x1, x0, :lo12:.LC8	//, tmp374,
	adrp	x0, :got:_ZSt4cout	// tmp375,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp375,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:243:         std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
	ldr	w1, [sp, 72]	//, rst_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _128,
// IRIW_Relax_po_sys.cpp:243:         std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp376,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp376,
	mov	x0, x2	//, _128
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:244:         std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
	adrp	x0, .LC9	// tmp377,
	add	x1, x0, :lo12:.LC9	//, tmp377,
	adrp	x0, :got:_ZSt4cout	// tmp378,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp378,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:244:         std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 76]	//, rst_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _130,
// IRIW_Relax_po_sys.cpp:244:         std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp379,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp379,
	mov	x0, x2	//, _130
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:245:         std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
	adrp	x0, .LC10	// tmp380,
	add	x1, x0, :lo12:.LC10	//, tmp380,
	adrp	x0, :got:_ZSt4cout	// tmp381,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp381,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:245:         std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 80]	//, rst_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _132,
// IRIW_Relax_po_sys.cpp:245:         std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp382,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp382,
	mov	x0, x2	//, _132
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:248:         return 0;
	mov	w0, 0	// _188,
	b	.L89		//
.L88:
// IRIW_Relax_po_sys.cpp:250:         std::cout << "Fail!" << std::endl;
	adrp	x0, .LC11	// tmp383,
	add	x1, x0, :lo12:.LC11	//, tmp383,
	adrp	x0, :got:_ZSt4cout	// tmp384,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp384,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _133,
// IRIW_Relax_po_sys.cpp:250:         std::cout << "Fail!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp385,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp385,
	mov	x0, x2	//, _133
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:251:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, .LC6	// tmp386,
	add	x1, x0, :lo12:.LC6	//, tmp386,
	adrp	x0, :got:_ZSt4cout	// tmp387,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp387,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:251:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _135,
// IRIW_Relax_po_sys.cpp:251:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp388,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp388,
	mov	x0, x2	//, _135
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:252:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, .LC7	// tmp389,
	add	x1, x0, :lo12:.LC7	//, tmp389,
	adrp	x0, :got:_ZSt4cout	// tmp390,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp390,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:252:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _137,
// IRIW_Relax_po_sys.cpp:252:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp391,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp391,
	mov	x0, x2	//, _137
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:253:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, .LC8	// tmp392,
	add	x1, x0, :lo12:.LC8	//, tmp392,
	adrp	x0, :got:_ZSt4cout	// tmp393,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp393,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:253:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _139,
// IRIW_Relax_po_sys.cpp:253:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp394,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp394,
	mov	x0, x2	//, _139
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:254:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, .LC9	// tmp395,
	add	x1, x0, :lo12:.LC9	//, tmp395,
	adrp	x0, :got:_ZSt4cout	// tmp396,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp396,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:254:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 56]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _141,
// IRIW_Relax_po_sys.cpp:254:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp397,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp397,
	mov	x0, x2	//, _141
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:255:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	adrp	x0, .LC10	// tmp398,
	add	x1, x0, :lo12:.LC10	//, tmp398,
	adrp	x0, :got:_ZSt4cout	// tmp399,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp399,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:255:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 60]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _143,
// IRIW_Relax_po_sys.cpp:255:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp400,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp400,
	mov	x0, x2	//, _143
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:256:         std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
	adrp	x0, .LC6	// tmp401,
	add	x1, x0, :lo12:.LC6	//, tmp401,
	adrp	x0, :got:_ZSt4cout	// tmp402,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp402,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:256:         std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
	ldr	w1, [sp, 64]	//, rst_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _145,
// IRIW_Relax_po_sys.cpp:256:         std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp403,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp403,
	mov	x0, x2	//, _145
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:257:         std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
	adrp	x0, .LC7	// tmp404,
	add	x1, x0, :lo12:.LC7	//, tmp404,
	adrp	x0, :got:_ZSt4cout	// tmp405,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp405,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:257:         std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
	ldr	w1, [sp, 68]	//, rst_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _147,
// IRIW_Relax_po_sys.cpp:257:         std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp406,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp406,
	mov	x0, x2	//, _147
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:258:         std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
	adrp	x0, .LC8	// tmp407,
	add	x1, x0, :lo12:.LC8	//, tmp407,
	adrp	x0, :got:_ZSt4cout	// tmp408,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp408,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:258:         std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
	ldr	w1, [sp, 72]	//, rst_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _149,
// IRIW_Relax_po_sys.cpp:258:         std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp409,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp409,
	mov	x0, x2	//, _149
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:259:         std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
	adrp	x0, .LC9	// tmp410,
	add	x1, x0, :lo12:.LC9	//, tmp410,
	adrp	x0, :got:_ZSt4cout	// tmp411,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp411,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:259:         std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 76]	//, rst_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _151,
// IRIW_Relax_po_sys.cpp:259:         std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp412,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp412,
	mov	x0, x2	//, _151
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:260:         std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
	adrp	x0, .LC10	// tmp413,
	add	x1, x0, :lo12:.LC10	//, tmp413,
	adrp	x0, :got:_ZSt4cout	// tmp414,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp414,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// IRIW_Relax_po_sys.cpp:260:         std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 80]	//, rst_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _153,
// IRIW_Relax_po_sys.cpp:260:         std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp415,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp415,
	mov	x0, x2	//, _153
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:263:         return 2;
	mov	w0, 2	// _188,
.L89:
// IRIW_Relax_po_sys.cpp:266: }
	ldp	x29, x30, [sp], 96	//,,,
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
	stp	x29, x30, [sp, -128]!	//,,,
	.cfi_def_cfa_offset 128
	.cfi_offset 29, -128
	.cfi_offset 30, -120
	mov	x29, sp	//,
	str	w0, [sp, 28]	// argc, argc
	str	x1, [sp, 16]	// argv, argv
// IRIW_Relax_po_sys.cpp:271: {
	adrp	x0, :got:__stack_chk_guard	// tmp193,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp192, tmp193,
	ldr	x1, [x0]	// tmp352,
	str	x1, [sp, 120]	// tmp352, D.48858
	mov	x1, 0	// tmp352
// IRIW_Relax_po_sys.cpp:272:     if (argc != 2) { 
	ldr	w0, [sp, 28]	// tmp194, argc
	cmp	w0, 2	// tmp194,
	beq	.L91		//,
// IRIW_Relax_po_sys.cpp:273:         printf("usage: %s <thread_count>\n", argv[0]);
	ldr	x0, [sp, 16]	// tmp195, argv
	ldr	x0, [x0]	// _1, *argv_115(D)
	mov	x1, x0	//, _1
	adrp	x0, .LC12	// tmp196,
	add	x0, x0, :lo12:.LC12	//, tmp196,
	bl	printf		//
// IRIW_Relax_po_sys.cpp:274:         exit(1);
	mov	w0, 1	//,
	bl	exit		//
.L91:
// IRIW_Relax_po_sys.cpp:276:     int thread_count = atoi(argv[1]);
	ldr	x0, [sp, 16]	// tmp197, argv
	add	x0, x0, 8	// _2, tmp197,
// IRIW_Relax_po_sys.cpp:276:     int thread_count = atoi(argv[1]);
	ldr	x0, [x0]	// _3, *_2
	bl	atoi		//
	str	w0, [sp, 72]	//, thread_count
// IRIW_Relax_po_sys.cpp:278:     printf("Starting %d threads...\n", thread_count);
	ldr	w1, [sp, 72]	//, thread_count
	adrp	x0, .LC13	// tmp198,
	add	x0, x0, :lo12:.LC13	//, tmp198,
	bl	printf		//
// IRIW_Relax_po_sys.cpp:280: auto num_iterations = DEF_RUNS; 
	mov	w0, 34464	// tmp199,
	movk	w0, 0x1, lsl 16	// tmp199,,
	str	w0, [sp, 76]	// tmp199, num_iterations
// IRIW_Relax_po_sys.cpp:282: auto t_range = num_iterations;
	ldr	w0, [sp, 76]	// tmp200, num_iterations
	str	w0, [sp, 80]	// tmp200, t_range
// IRIW_Relax_po_sys.cpp:284:    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	ldrsw	x0, [sp, 80]	// _4, t_range
// IRIW_Relax_po_sys.cpp:284:    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	lsl	x0, x0, 8	// _5, _4,
	bl	malloc		//
	mov	x1, x0	// _6, tmp201
// IRIW_Relax_po_sys.cpp:284:    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	adrp	x0, var	// tmp203,
	add	x0, x0, :lo12:var	// tmp202, tmp203,
	str	x1, [x0]	// _6, var
// IRIW_Relax_po_sys.cpp:286:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 44]	//, i
// IRIW_Relax_po_sys.cpp:286:     for (auto i = 0; i < t_range; ++i) {
	b	.L92		//
.L93:
// IRIW_Relax_po_sys.cpp:287:         var[i].a = 0;
	adrp	x0, var	// tmp205,
	add	x0, x0, :lo12:var	// tmp204, tmp205,
	ldr	x1, [x0]	// var.102_7, var
// IRIW_Relax_po_sys.cpp:287:         var[i].a = 0;
	ldrsw	x0, [sp, 44]	// _8, i
// IRIW_Relax_po_sys.cpp:287:         var[i].a = 0;
	lsl	x0, x0, 8	// _9, _8,
	add	x0, x1, x0	// _10, var.102_7, _9
// IRIW_Relax_po_sys.cpp:287:         var[i].a = 0;
	str	wzr, [x0]	//, _10->a
// IRIW_Relax_po_sys.cpp:288:         var[i].b = 0;
	adrp	x0, var	// tmp207,
	add	x0, x0, :lo12:var	// tmp206, tmp207,
	ldr	x1, [x0]	// var.103_11, var
// IRIW_Relax_po_sys.cpp:288:         var[i].b = 0;
	ldrsw	x0, [sp, 44]	// _12, i
// IRIW_Relax_po_sys.cpp:288:         var[i].b = 0;
	lsl	x0, x0, 8	// _13, _12,
	add	x0, x1, x0	// _14, var.103_11, _13
// IRIW_Relax_po_sys.cpp:288:         var[i].b = 0;
	str	wzr, [x0, 128]	//, _14->b
// IRIW_Relax_po_sys.cpp:286:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 44]	// tmp209, i
	add	w0, w0, 1	// tmp208, tmp209,
	str	w0, [sp, 44]	// tmp208, i
.L92:
// IRIW_Relax_po_sys.cpp:286:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 44]	// tmp210, i
	ldr	w0, [sp, 80]	// tmp211, t_range
	cmp	w1, w0	// tmp210, tmp211
	blt	.L93		//,
// IRIW_Relax_po_sys.cpp:292:    cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	ldrsw	x0, [sp, 80]	// _15, t_range
// IRIW_Relax_po_sys.cpp:292:    cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	lsl	x0, x0, 7	// _16, _15,
	bl	malloc		//
	mov	x1, x0	// _17, tmp212
// IRIW_Relax_po_sys.cpp:292:    cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	adrp	x0, cpu_res0	// tmp214,
	add	x0, x0, :lo12:cpu_res0	// tmp213, tmp214,
	str	x1, [x0]	// _17, cpu_res0
// IRIW_Relax_po_sys.cpp:294:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 48]	//, i
// IRIW_Relax_po_sys.cpp:294:     for (auto i = 0; i < t_range; ++i) {
	b	.L94		//
.L95:
// IRIW_Relax_po_sys.cpp:295:         cpu_res0[i].r0 = 2;
	adrp	x0, cpu_res0	// tmp216,
	add	x0, x0, :lo12:cpu_res0	// tmp215, tmp216,
	ldr	x1, [x0]	// cpu_res0.104_18, cpu_res0
// IRIW_Relax_po_sys.cpp:295:         cpu_res0[i].r0 = 2;
	ldrsw	x0, [sp, 48]	// _19, i
// IRIW_Relax_po_sys.cpp:295:         cpu_res0[i].r0 = 2;
	lsl	x0, x0, 7	// _20, _19,
	add	x0, x1, x0	// _21, cpu_res0.104_18, _20
// IRIW_Relax_po_sys.cpp:295:         cpu_res0[i].r0 = 2;
	mov	w1, 2	// tmp217,
	str	w1, [x0]	// tmp217, _21->r0
// IRIW_Relax_po_sys.cpp:294:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 48]	// tmp219, i
	add	w0, w0, 1	// tmp218, tmp219,
	str	w0, [sp, 48]	// tmp218, i
.L94:
// IRIW_Relax_po_sys.cpp:294:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 48]	// tmp220, i
	ldr	w0, [sp, 80]	// tmp221, t_range
	cmp	w1, w0	// tmp220, tmp221
	blt	.L95		//,
// IRIW_Relax_po_sys.cpp:299:     gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	ldrsw	x0, [sp, 80]	// _22, t_range
// IRIW_Relax_po_sys.cpp:299:     gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	lsl	x0, x0, 7	// _23, _22,
	bl	malloc		//
	mov	x1, x0	// _24, tmp222
// IRIW_Relax_po_sys.cpp:299:     gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	adrp	x0, gpu_res0	// tmp224,
	add	x0, x0, :lo12:gpu_res0	// tmp223, tmp224,
	str	x1, [x0]	// _24, gpu_res0
// IRIW_Relax_po_sys.cpp:301:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 52]	//, i
// IRIW_Relax_po_sys.cpp:301:     for (auto i = 0; i < t_range; ++i) {
	b	.L96		//
.L97:
// IRIW_Relax_po_sys.cpp:302:         gpu_res0[i].r0 = 2;
	adrp	x0, gpu_res0	// tmp226,
	add	x0, x0, :lo12:gpu_res0	// tmp225, tmp226,
	ldr	x1, [x0]	// gpu_res0.105_25, gpu_res0
// IRIW_Relax_po_sys.cpp:302:         gpu_res0[i].r0 = 2;
	ldrsw	x0, [sp, 52]	// _26, i
// IRIW_Relax_po_sys.cpp:302:         gpu_res0[i].r0 = 2;
	lsl	x0, x0, 7	// _27, _26,
	add	x0, x1, x0	// _28, gpu_res0.105_25, _27
// IRIW_Relax_po_sys.cpp:302:         gpu_res0[i].r0 = 2;
	mov	w1, 2	// tmp227,
	str	w1, [x0]	// tmp227, _28->r0
// IRIW_Relax_po_sys.cpp:301:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 52]	// tmp229, i
	add	w0, w0, 1	// tmp228, tmp229,
	str	w0, [sp, 52]	// tmp228, i
.L96:
// IRIW_Relax_po_sys.cpp:301:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 52]	// tmp230, i
	ldr	w0, [sp, 80]	// tmp231, t_range
	cmp	w1, w0	// tmp230, tmp231
	blt	.L97		//,
// IRIW_Relax_po_sys.cpp:305:     cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
	ldrsw	x0, [sp, 80]	// _29, t_range
// IRIW_Relax_po_sys.cpp:305:     cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
	lsl	x0, x0, 7	// _30, _29,
	bl	malloc		//
	mov	x1, x0	// _31, tmp232
// IRIW_Relax_po_sys.cpp:305:     cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
	adrp	x0, cpu_res1	// tmp234,
	add	x0, x0, :lo12:cpu_res1	// tmp233, tmp234,
	str	x1, [x0]	// _31, cpu_res1
// IRIW_Relax_po_sys.cpp:307:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 56]	//, i
// IRIW_Relax_po_sys.cpp:307:     for (auto i = 0; i < t_range; ++i) {
	b	.L98		//
.L99:
// IRIW_Relax_po_sys.cpp:308:         cpu_res1[i].r0 = 2;
	adrp	x0, cpu_res1	// tmp236,
	add	x0, x0, :lo12:cpu_res1	// tmp235, tmp236,
	ldr	x1, [x0]	// cpu_res1.106_32, cpu_res1
// IRIW_Relax_po_sys.cpp:308:         cpu_res1[i].r0 = 2;
	ldrsw	x0, [sp, 56]	// _33, i
// IRIW_Relax_po_sys.cpp:308:         cpu_res1[i].r0 = 2;
	lsl	x0, x0, 7	// _34, _33,
	add	x0, x1, x0	// _35, cpu_res1.106_32, _34
// IRIW_Relax_po_sys.cpp:308:         cpu_res1[i].r0 = 2;
	mov	w1, 2	// tmp237,
	str	w1, [x0]	// tmp237, _35->r0
// IRIW_Relax_po_sys.cpp:307:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 56]	// tmp239, i
	add	w0, w0, 1	// tmp238, tmp239,
	str	w0, [sp, 56]	// tmp238, i
.L98:
// IRIW_Relax_po_sys.cpp:307:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 56]	// tmp240, i
	ldr	w0, [sp, 80]	// tmp241, t_range
	cmp	w1, w0	// tmp240, tmp241
	blt	.L99		//,
// IRIW_Relax_po_sys.cpp:312:     gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
	ldrsw	x0, [sp, 80]	// _36, t_range
// IRIW_Relax_po_sys.cpp:312:     gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
	lsl	x0, x0, 7	// _37, _36,
	bl	malloc		//
	mov	x1, x0	// _38, tmp242
// IRIW_Relax_po_sys.cpp:312:     gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
	adrp	x0, gpu_res1	// tmp244,
	add	x0, x0, :lo12:gpu_res1	// tmp243, tmp244,
	str	x1, [x0]	// _38, gpu_res1
// IRIW_Relax_po_sys.cpp:314:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 60]	//, i
// IRIW_Relax_po_sys.cpp:314:     for (auto i = 0; i < t_range; ++i) {
	b	.L100		//
.L101:
// IRIW_Relax_po_sys.cpp:315:         gpu_res1[i].r0 = 2;
	adrp	x0, gpu_res1	// tmp246,
	add	x0, x0, :lo12:gpu_res1	// tmp245, tmp246,
	ldr	x1, [x0]	// gpu_res1.107_39, gpu_res1
// IRIW_Relax_po_sys.cpp:315:         gpu_res1[i].r0 = 2;
	ldrsw	x0, [sp, 60]	// _40, i
// IRIW_Relax_po_sys.cpp:315:         gpu_res1[i].r0 = 2;
	lsl	x0, x0, 7	// _41, _40,
	add	x0, x1, x0	// _42, gpu_res1.107_39, _41
// IRIW_Relax_po_sys.cpp:315:         gpu_res1[i].r0 = 2;
	mov	w1, 2	// tmp247,
	str	w1, [x0]	// tmp247, _42->r0
// IRIW_Relax_po_sys.cpp:314:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// tmp249, i
	add	w0, w0, 1	// tmp248, tmp249,
	str	w0, [sp, 60]	// tmp248, i
.L100:
// IRIW_Relax_po_sys.cpp:314:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 60]	// tmp250, i
	ldr	w0, [sp, 80]	// tmp251, t_range
	cmp	w1, w0	// tmp250, tmp251
	blt	.L101		//,
// IRIW_Relax_po_sys.cpp:323:    cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 80]	// _43, t_range
// IRIW_Relax_po_sys.cpp:323:    cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _44, _43,
	bl	malloc		//
	mov	x1, x0	// _45, tmp252
// IRIW_Relax_po_sys.cpp:323:    cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand1	// tmp254,
	add	x0, x0, :lo12:cpu_rand1	// tmp253, tmp254,
	str	x1, [x0]	// _45, cpu_rand1
// IRIW_Relax_po_sys.cpp:324:    gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 80]	// _46, t_range
// IRIW_Relax_po_sys.cpp:324:    gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _47, _46,
	bl	malloc		//
	mov	x1, x0	// _48, tmp255
// IRIW_Relax_po_sys.cpp:324:    gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand1	// tmp257,
	add	x0, x0, :lo12:gpu_rand1	// tmp256, tmp257,
	str	x1, [x0]	// _48, gpu_rand1
// IRIW_Relax_po_sys.cpp:325:    cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 80]	// _49, t_range
// IRIW_Relax_po_sys.cpp:325:    cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _50, _49,
	bl	malloc		//
	mov	x1, x0	// _51, tmp258
// IRIW_Relax_po_sys.cpp:325:    cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand2	// tmp260,
	add	x0, x0, :lo12:cpu_rand2	// tmp259, tmp260,
	str	x1, [x0]	// _51, cpu_rand2
// IRIW_Relax_po_sys.cpp:326:    gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 80]	// _52, t_range
// IRIW_Relax_po_sys.cpp:326:    gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _53, _52,
	bl	malloc		//
	mov	x1, x0	// _54, tmp261
// IRIW_Relax_po_sys.cpp:326:    gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand2	// tmp263,
	add	x0, x0, :lo12:gpu_rand2	// tmp262, tmp263,
	str	x1, [x0]	// _54, gpu_rand2
// IRIW_Relax_po_sys.cpp:328: for (int iter = 0; iter < num_iterations; iter++) {
	str	wzr, [sp, 64]	//, iter
// IRIW_Relax_po_sys.cpp:328: for (int iter = 0; iter < num_iterations; iter++) {
	b	.L102		//
.L103:
// IRIW_Relax_po_sys.cpp:330:             auto g_tid = iter;
	ldr	w0, [sp, 64]	// tmp264, iter
	str	w0, [sp, 96]	// tmp264, g_tid
// IRIW_Relax_po_sys.cpp:333:             unsigned rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _55,
// IRIW_Relax_po_sys.cpp:333:             unsigned rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp266,
	movk	w0, 0x6666, lsl 16	// tmp266,,
	smull	x0, w2, w0	// tmp265, _55, tmp266
	lsr	x0, x0, 32	// tmp267, tmp265,
	asr	w1, w0, 6	// tmp268, tmp267,
	asr	w0, w2, 31	// tmp269, _55,
	sub	w1, w1, w0	// _56, tmp268, tmp269
	mov	w0, w1	// tmp270, _56
	lsl	w0, w0, 2	// tmp271, tmp270,
	add	w0, w0, w1	// tmp270, tmp270, _56
	lsl	w0, w0, 5	// tmp272, tmp270,
	sub	w1, w2, w0	// _56, _55, tmp270
// IRIW_Relax_po_sys.cpp:333:             unsigned rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 100]	// _56, rand_val
// IRIW_Relax_po_sys.cpp:335:             cpu_rand1[g_tid] = rand_val;
	adrp	x0, cpu_rand1	// tmp274,
	add	x0, x0, :lo12:cpu_rand1	// tmp273, tmp274,
	ldr	x1, [x0]	// cpu_rand1.108_57, cpu_rand1
// IRIW_Relax_po_sys.cpp:335:             cpu_rand1[g_tid] = rand_val;
	ldrsw	x0, [sp, 96]	// _58, g_tid
// IRIW_Relax_po_sys.cpp:335:             cpu_rand1[g_tid] = rand_val;
	lsl	x0, x0, 2	// _59, _58,
	add	x0, x1, x0	// _60, cpu_rand1.108_57, _59
// IRIW_Relax_po_sys.cpp:335:             cpu_rand1[g_tid] = rand_val;
	ldr	w1, [sp, 100]	// tmp275, rand_val
	str	w1, [x0]	// tmp275, *_60
// IRIW_Relax_po_sys.cpp:338:             rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _61,
// IRIW_Relax_po_sys.cpp:338:             rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp277,
	movk	w0, 0x6666, lsl 16	// tmp277,,
	smull	x0, w2, w0	// tmp276, _61, tmp277
	lsr	x0, x0, 32	// tmp278, tmp276,
	asr	w1, w0, 6	// tmp279, tmp278,
	asr	w0, w2, 31	// tmp280, _61,
	sub	w1, w1, w0	// _62, tmp279, tmp280
	mov	w0, w1	// tmp281, _62
	lsl	w0, w0, 2	// tmp282, tmp281,
	add	w0, w0, w1	// tmp281, tmp281, _62
	lsl	w0, w0, 5	// tmp283, tmp281,
	sub	w1, w2, w0	// _62, _61, tmp281
// IRIW_Relax_po_sys.cpp:338:             rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 100]	// _62, rand_val
// IRIW_Relax_po_sys.cpp:340:             gpu_rand1[g_tid] = rand_val;
	adrp	x0, gpu_rand1	// tmp285,
	add	x0, x0, :lo12:gpu_rand1	// tmp284, tmp285,
	ldr	x1, [x0]	// gpu_rand1.109_63, gpu_rand1
// IRIW_Relax_po_sys.cpp:340:             gpu_rand1[g_tid] = rand_val;
	ldrsw	x0, [sp, 96]	// _64, g_tid
// IRIW_Relax_po_sys.cpp:340:             gpu_rand1[g_tid] = rand_val;
	lsl	x0, x0, 2	// _65, _64,
	add	x0, x1, x0	// _66, gpu_rand1.109_63, _65
// IRIW_Relax_po_sys.cpp:340:             gpu_rand1[g_tid] = rand_val;
	ldr	w1, [sp, 100]	// tmp286, rand_val
	str	w1, [x0]	// tmp286, *_66
// IRIW_Relax_po_sys.cpp:343:             rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _67,
// IRIW_Relax_po_sys.cpp:343:             rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp288,
	movk	w0, 0x6666, lsl 16	// tmp288,,
	smull	x0, w2, w0	// tmp287, _67, tmp288
	lsr	x0, x0, 32	// tmp289, tmp287,
	asr	w1, w0, 6	// tmp290, tmp289,
	asr	w0, w2, 31	// tmp291, _67,
	sub	w1, w1, w0	// _68, tmp290, tmp291
	mov	w0, w1	// tmp292, _68
	lsl	w0, w0, 2	// tmp293, tmp292,
	add	w0, w0, w1	// tmp292, tmp292, _68
	lsl	w0, w0, 5	// tmp294, tmp292,
	sub	w1, w2, w0	// _68, _67, tmp292
// IRIW_Relax_po_sys.cpp:343:             rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 100]	// _68, rand_val
// IRIW_Relax_po_sys.cpp:345:             cpu_rand2[g_tid] = rand_val;
	adrp	x0, cpu_rand2	// tmp296,
	add	x0, x0, :lo12:cpu_rand2	// tmp295, tmp296,
	ldr	x1, [x0]	// cpu_rand2.110_69, cpu_rand2
// IRIW_Relax_po_sys.cpp:345:             cpu_rand2[g_tid] = rand_val;
	ldrsw	x0, [sp, 96]	// _70, g_tid
// IRIW_Relax_po_sys.cpp:345:             cpu_rand2[g_tid] = rand_val;
	lsl	x0, x0, 2	// _71, _70,
	add	x0, x1, x0	// _72, cpu_rand2.110_69, _71
// IRIW_Relax_po_sys.cpp:345:             cpu_rand2[g_tid] = rand_val;
	ldr	w1, [sp, 100]	// tmp297, rand_val
	str	w1, [x0]	// tmp297, *_72
// IRIW_Relax_po_sys.cpp:348:             rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w2, w0	// _73,
// IRIW_Relax_po_sys.cpp:348:             rand_val = std::rand() % RAND_RANGE;
	mov	w0, 26215	// tmp299,
	movk	w0, 0x6666, lsl 16	// tmp299,,
	smull	x0, w2, w0	// tmp298, _73, tmp299
	lsr	x0, x0, 32	// tmp300, tmp298,
	asr	w1, w0, 6	// tmp301, tmp300,
	asr	w0, w2, 31	// tmp302, _73,
	sub	w1, w1, w0	// _74, tmp301, tmp302
	mov	w0, w1	// tmp303, _74
	lsl	w0, w0, 2	// tmp304, tmp303,
	add	w0, w0, w1	// tmp303, tmp303, _74
	lsl	w0, w0, 5	// tmp305, tmp303,
	sub	w1, w2, w0	// _74, _73, tmp303
// IRIW_Relax_po_sys.cpp:348:             rand_val = std::rand() % RAND_RANGE;
	str	w1, [sp, 100]	// _74, rand_val
// IRIW_Relax_po_sys.cpp:350:             gpu_rand2[g_tid] = rand_val;
	adrp	x0, gpu_rand2	// tmp307,
	add	x0, x0, :lo12:gpu_rand2	// tmp306, tmp307,
	ldr	x1, [x0]	// gpu_rand2.111_75, gpu_rand2
// IRIW_Relax_po_sys.cpp:350:             gpu_rand2[g_tid] = rand_val;
	ldrsw	x0, [sp, 96]	// _76, g_tid
// IRIW_Relax_po_sys.cpp:350:             gpu_rand2[g_tid] = rand_val;
	lsl	x0, x0, 2	// _77, _76,
	add	x0, x1, x0	// _78, gpu_rand2.111_75, _77
// IRIW_Relax_po_sys.cpp:350:             gpu_rand2[g_tid] = rand_val;
	ldr	w1, [sp, 100]	// tmp308, rand_val
	str	w1, [x0]	// tmp308, *_78
// IRIW_Relax_po_sys.cpp:328: for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w0, [sp, 64]	// tmp310, iter
	add	w0, w0, 1	// tmp309, tmp310,
	str	w0, [sp, 64]	// tmp309, iter
.L102:
// IRIW_Relax_po_sys.cpp:328: for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w1, [sp, 64]	// tmp311, iter
	ldr	w0, [sp, 76]	// tmp312, num_iterations
	cmp	w1, w0	// tmp311, tmp312
	blt	.L103		//,
// IRIW_Relax_po_sys.cpp:353:     std::cout << "Random thread launch delays generated" << std::endl;
	adrp	x0, .LC14	// tmp313,
	add	x1, x0, :lo12:.LC14	//, tmp313,
	adrp	x0, :got:_ZSt4cout	// tmp314,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp314,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _79,
// IRIW_Relax_po_sys.cpp:353:     std::cout << "Random thread launch delays generated" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp315,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp315,
	mov	x0, x2	//, _79
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:358:     pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
	ldrsw	x0, [sp, 72]	// _80, thread_count
	mov	x1, 8	//,
	bl	calloc		//
	str	x0, [sp, 112]	// tmp316, threads
// IRIW_Relax_po_sys.cpp:359:     pthread_barrier_init(&barrier, NULL, (thread_count));
	ldr	w0, [sp, 72]	// thread_count.112_81, thread_count
	mov	w2, w0	//, thread_count.112_81
	mov	x1, 0	//,
	adrp	x0, barrier	// tmp317,
	add	x0, x0, :lo12:barrier	//, tmp317,
	bl	pthread_barrier_init		//
// IRIW_Relax_po_sys.cpp:360:     assert(threads != NULL);
	ldr	x0, [sp, 112]	// tmp318, threads
	cmp	x0, 0	// tmp318,
	bne	.L104		//,
// IRIW_Relax_po_sys.cpp:360:     assert(threads != NULL);
	adrp	x0, .LC15	// tmp319,
	add	x3, x0, :lo12:.LC15	//, tmp319,
	mov	w2, 360	//,
	adrp	x0, .LC16	// tmp320,
	add	x1, x0, :lo12:.LC16	//, tmp320,
	adrp	x0, .LC17	// tmp321,
	add	x0, x0, :lo12:.LC17	//, tmp321,
	bl	__assert_fail		//
.L104:
// IRIW_Relax_po_sys.cpp:361:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp322,
	str	w0, [sp, 68]	// tmp322, i
// IRIW_Relax_po_sys.cpp:361:     for (i = 1 ; i < thread_count; i++) {
	b	.L105		//
.L107:
// IRIW_Relax_po_sys.cpp:362:         int createResult = pthread_create(&threads[i], 
	ldrsw	x0, [sp, 68]	// _82, i
// IRIW_Relax_po_sys.cpp:362:         int createResult = pthread_create(&threads[i], 
	lsl	x0, x0, 3	// _83, _82,
// IRIW_Relax_po_sys.cpp:362:         int createResult = pthread_create(&threads[i], 
	ldr	x1, [sp, 112]	// tmp323, threads
	add	x4, x1, x0	// _84, tmp323, _83
// IRIW_Relax_po_sys.cpp:365:                                           (void*)i);
	ldrsw	x0, [sp, 68]	// _85, i
// IRIW_Relax_po_sys.cpp:362:         int createResult = pthread_create(&threads[i], 
	mov	x3, x0	//, _86
	adrp	x0, _Z7runIRIWPv	// tmp324,
	add	x2, x0, :lo12:_Z7runIRIWPv	//, tmp324,
	mov	x1, 0	//,
	mov	x0, x4	//, _84
	bl	pthread_create		//
	str	w0, [sp, 92]	//, createResult
// IRIW_Relax_po_sys.cpp:366:         assert(createResult == 0);
	ldr	w0, [sp, 92]	// tmp325, createResult
	cmp	w0, 0	// tmp325,
	beq	.L106		//,
// IRIW_Relax_po_sys.cpp:366:         assert(createResult == 0);
	adrp	x0, .LC15	// tmp326,
	add	x3, x0, :lo12:.LC15	//, tmp326,
	mov	w2, 366	//,
	adrp	x0, .LC16	// tmp327,
	add	x1, x0, :lo12:.LC16	//, tmp327,
	adrp	x0, .LC18	// tmp328,
	add	x0, x0, :lo12:.LC18	//, tmp328,
	bl	__assert_fail		//
.L106:
// IRIW_Relax_po_sys.cpp:361:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 68]	// tmp330, i
	add	w0, w0, 1	// tmp329, tmp330,
	str	w0, [sp, 68]	// tmp329, i
.L105:
// IRIW_Relax_po_sys.cpp:361:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 68]	// tmp331, i
	ldr	w0, [sp, 72]	// tmp332, thread_count
	cmp	w1, w0	// tmp331, tmp332
	blt	.L107		//,
// IRIW_Relax_po_sys.cpp:369:     long long int local = (long long int)runIRIW((void*)0);
	mov	x0, 0	//,
	bl	_Z7runIRIWPv		//
// IRIW_Relax_po_sys.cpp:369:     long long int local = (long long int)runIRIW((void*)0);
	str	x0, [sp, 104]	// _88, local
// IRIW_Relax_po_sys.cpp:370:     printf("local[0] = %lld\n", local);
	ldr	x0, [sp, 104]	// local.113_89, local
	mov	x1, x0	//, local.113_89
	adrp	x0, .LC19	// tmp333,
	add	x0, x0, :lo12:.LC19	//, tmp333,
	bl	printf		//
// IRIW_Relax_po_sys.cpp:377:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp334,
	str	w0, [sp, 68]	// tmp334, i
// IRIW_Relax_po_sys.cpp:377:     for (i = 1 ; i < thread_count; i++) {
	b	.L108		//
.L110:
// IRIW_Relax_po_sys.cpp:378:         int joinResult = pthread_join(threads[i], 
	ldrsw	x0, [sp, 68]	// _90, i
// IRIW_Relax_po_sys.cpp:378:         int joinResult = pthread_join(threads[i], 
	lsl	x0, x0, 3	// _91, _90,
	ldr	x1, [sp, 112]	// tmp335, threads
	add	x0, x1, x0	// _92, tmp335, _91
// IRIW_Relax_po_sys.cpp:378:         int joinResult = pthread_join(threads[i], 
	ldr	x0, [x0]	// _93, *_92
	add	x1, sp, 104	// tmp336,,
	bl	pthread_join		//
	str	w0, [sp, 88]	// _167, joinResult
// IRIW_Relax_po_sys.cpp:380:         assert(joinResult == 0);
	ldr	w0, [sp, 88]	// tmp337, joinResult
	cmp	w0, 0	// tmp337,
	beq	.L109		//,
// IRIW_Relax_po_sys.cpp:380:         assert(joinResult == 0);
	adrp	x0, .LC15	// tmp338,
	add	x3, x0, :lo12:.LC15	//, tmp338,
	mov	w2, 380	//,
	adrp	x0, .LC16	// tmp339,
	add	x1, x0, :lo12:.LC16	//, tmp339,
	adrp	x0, .LC20	// tmp340,
	add	x0, x0, :lo12:.LC20	//, tmp340,
	bl	__assert_fail		//
.L109:
// IRIW_Relax_po_sys.cpp:381:         printf("local[%d] = %lld\n", i, local);
	ldr	x0, [sp, 104]	// local.114_94, local
	mov	x2, x0	//, local.114_94
	ldr	w1, [sp, 68]	//, i
	adrp	x0, .LC21	// tmp341,
	add	x0, x0, :lo12:.LC21	//, tmp341,
	bl	printf		//
// IRIW_Relax_po_sys.cpp:377:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 68]	// tmp343, i
	add	w0, w0, 1	// tmp342, tmp343,
	str	w0, [sp, 68]	// tmp342, i
.L108:
// IRIW_Relax_po_sys.cpp:377:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 68]	// tmp344, i
	ldr	w0, [sp, 72]	// tmp345, thread_count
	cmp	w1, w0	// tmp344, tmp345
	blt	.L110		//,
// IRIW_Relax_po_sys.cpp:384:     std::cout << "Validating..." << std::flush;
	adrp	x0, .LC22	// tmp346,
	add	x1, x0, :lo12:.LC22	//, tmp346,
	adrp	x0, :got:_ZSt4cout	// tmp347,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp347,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _95,
// IRIW_Relax_po_sys.cpp:384:     std::cout << "Validating..." << std::flush;
	adrp	x0, :got:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp348,
	ldr	x1, [x0, #:got_lo12:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp348,
	mov	x0, x2	//, _95
	bl	_ZNSolsEPFRSoS_E		//
// IRIW_Relax_po_sys.cpp:385:     int res = check_output(t_range);
	ldr	w0, [sp, 80]	// t_range.115_96, t_range
	bl	_Z12check_outputj		//
	str	w0, [sp, 84]	// _161, res
// IRIW_Relax_po_sys.cpp:388:         free(threads);
	ldr	x0, [sp, 112]	//, threads
	bl	free		//
// IRIW_Relax_po_sys.cpp:390:     return 0;
	mov	w0, 0	// _164,
// IRIW_Relax_po_sys.cpp:391: }
	mov	w1, w0	// <retval>, _164
	adrp	x0, :got:__stack_chk_guard	// tmp351,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp350, tmp351,
	ldr	x3, [sp, 120]	// tmp353, D.48858
	ldr	x2, [x0]	// tmp354,
	subs	x3, x3, x2	// tmp353, tmp354
	mov	x2, 0	// tmp354
	beq	.L112		//,
	bl	__stack_chk_fail		//
.L112:
	mov	w0, w1	//, <retval>
	ldp	x29, x30, [sp], 128	//,,,
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
	stp	x29, x30, [sp, -32]!	//,,,
	.cfi_def_cfa_offset 32
	.cfi_offset 29, -32
	.cfi_offset 30, -24
	mov	x29, sp	//,
	str	w0, [sp, 28]	// __initialize_p, __initialize_p
	str	w1, [sp, 24]	// __priority, __priority
// IRIW_Relax_po_sys.cpp:391: }
	ldr	w0, [sp, 28]	// tmp92, __initialize_p
	cmp	w0, 1	// tmp92,
	bne	.L115		//,
// IRIW_Relax_po_sys.cpp:391: }
	ldr	w1, [sp, 24]	// tmp93, __priority
	mov	w0, 65535	// tmp94,
	cmp	w1, w0	// tmp93, tmp94
	bne	.L115		//,
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
.L115:
// IRIW_Relax_po_sys.cpp:391: }
	nop	
	ldp	x29, x30, [sp], 32	//,,,
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
	stp	x29, x30, [sp, -16]!	//,,,
	.cfi_def_cfa_offset 16
	.cfi_offset 29, -16
	.cfi_offset 30, -8
	mov	x29, sp	//,
// IRIW_Relax_po_sys.cpp:391: }
	mov	w1, 65535	//,
	mov	w0, 1	//,
	bl	_Z41__static_initialization_and_destruction_0ii		//
	ldp	x29, x30, [sp], 16	//,,,
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
