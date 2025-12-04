	.arch armv8-a
	.file	"LB_Relax.cpp"
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
	ldr	w1, [sp, 12]	// __m.32_1, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	ldr	w0, [sp, 8]	// __mod.33_2, __mod
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:106:     return memory_order(int(__m) & int(__mod));
	and	w0, w1, w0	// _3, __m.32_1, __mod.33_2
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
	.text
	.align	2
	.global	_Z5runSBPv
	.type	_Z5runSBPv, %function
_Z5runSBPv:
.LFB1808:
	.cfi_startproc
	stp	x29, x30, [sp, -208]!	//,,,
	.cfi_def_cfa_offset 208
	.cfi_offset 29, -208
	.cfi_offset 30, -200
	mov	x29, sp	//,
	str	x0, [sp, 24]	// arg, arg
// LB_Relax.cpp:76:     long long int tid = (long long int)arg;
	ldr	x0, [sp, 24]	// tmp204, arg
	str	x0, [sp, 136]	// tmp204, tid
// LB_Relax.cpp:77:     local += tid;
	ldr	x0, [sp, 136]	// tmp205, tid
	mov	w1, w0	// _1, tmp205
	mrs	x0, tpidr_el0	// tmp207
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp206, tmp207,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp206,
	ldr	w0, [x0]	// local.0_2, local
	add	w0, w1, w0	// _4, _1, local.1_3
	mov	w1, w0	// _5, _4
	mrs	x0, tpidr_el0	// tmp209
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp208, tmp209,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp208,
	str	w1, [x0]	// _5, local
// LB_Relax.cpp:78:     pthread_barrier_wait(&barrier);
	adrp	x0, barrier	// tmp210,
	add	x0, x0, :lo12:barrier	//, tmp210,
	bl	pthread_barrier_wait		//
// LB_Relax.cpp:83: if(tid / DEF_THREADS == 0)
	ldr	x0, [sp, 136]	// tid.2_6, tid
	add	x0, x0, 3	// _7, tid.2_6,
	cmp	x0, 6	// _7,
	bhi	.L4		//,
// LB_Relax.cpp:85: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 136]	// tmp211, tid
	str	w0, [sp, 44]	// tmp212, i
// LB_Relax.cpp:85: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	b	.L5		//
.L13:
// LB_Relax.cpp:87: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	adrp	x0, var	// tmp214,
	add	x0, x0, :lo12:var	// tmp213, tmp214,
	ldr	x1, [x0]	// var.3_8, var
// LB_Relax.cpp:87: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	ldrsw	x0, [sp, 44]	// _9, i
// LB_Relax.cpp:87: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	lsl	x0, x0, 8	// _10, _9,
	add	x0, x1, x0	// _11, var.3_8, _10
// LB_Relax.cpp:87: 		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
	add	x0, x0, 128	// tmp215, _11,
	str	x0, [sp, 160]	// tmp215, tmp_b
// LB_Relax.cpp:88: 	       (gpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	ldr	x0, [sp, 160]	// _12, tmp_b
	str	x0, [sp, 176]	// _12, this
	mov	w0, 5	// tmp216,
	str	w0, [sp, 72]	// tmp216, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 72]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 76]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 176]	// _147, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _149,* _147
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48653, _149
// LB_Relax.cpp:88: 	       (gpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	adrp	x0, gpu_res	// tmp218,
	add	x0, x0, :lo12:gpu_res	// tmp217, tmp218,
	ldr	x1, [x0]	// gpu_res.4_14, gpu_res
// LB_Relax.cpp:88: 	       (gpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	ldrsw	x0, [sp, 44]	// _15, i
// LB_Relax.cpp:88: 	       (gpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	lsl	x0, x0, 7	// _16, _15,
	add	x0, x1, x0	// _17, gpu_res.4_14, _16
// LB_Relax.cpp:88: 	       (gpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	mov	w1, w2	// _18, D.48653
// LB_Relax.cpp:88: 	       (gpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	str	w1, [x0]	// _18, _17->r0
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	str	xzr, [sp, 112]	//, j
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	b	.L7		//
.L8:
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	x0, [sp, 112]	// tmp220, j
	add	x0, x0, 1	// tmp219, tmp220,
	str	x0, [sp, 112]	// tmp219, j
.L7:
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	adrp	x0, cpu_rand	// tmp222,
	add	x0, x0, :lo12:cpu_rand	// tmp221, tmp222,
	ldr	x1, [x0]	// cpu_rand.6_19, cpu_rand
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldrsw	x0, [sp, 44]	// _20, i
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	lsl	x0, x0, 2	// _21, _20,
	add	x0, x1, x0	// _22, cpu_rand.6_19, _21
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	w0, [x0]	// _23, *_22
	uxtw	x0, w0	// _24, _23
// LB_Relax.cpp:89:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	x1, [sp, 112]	// tmp224, j
	cmp	x1, x0	// tmp224, _24
	cset	w0, lt	// tmp225,
	and	w0, w0, 255	// retval.5_133, tmp223
	cmp	w0, 0	// retval.5_133,
	bne	.L8		//,
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	str	xzr, [sp, 120]	//, j
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	b	.L9		//
.L10:
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	x0, [sp, 120]	// tmp227, j
	add	x0, x0, 1	// tmp226, tmp227,
	str	x0, [sp, 120]	// tmp226, j
.L9:
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	adrp	x0, cpu_rand	// tmp229,
	add	x0, x0, :lo12:cpu_rand	// tmp228, tmp229,
	ldr	x1, [x0]	// cpu_rand.8_25, cpu_rand
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldrsw	x0, [sp, 44]	// _26, i
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	lsl	x0, x0, 2	// _27, _26,
	add	x0, x1, x0	// _28, cpu_rand.8_25, _27
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	w0, [x0]	// _29, *_28
	uxtw	x0, w0	// _30, _29
// LB_Relax.cpp:90:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	x1, [sp, 120]	// tmp231, j
	cmp	x1, x0	// tmp231, _30
	cset	w0, lt	// tmp232,
	and	w0, w0, 255	// retval.7_135, tmp230
	cmp	w0, 0	// retval.7_135,
	bne	.L10		//,
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	str	xzr, [sp, 128]	//, j
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	b	.L11		//
.L12:
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	x0, [sp, 128]	// tmp234, j
	add	x0, x0, 1	// tmp233, tmp234,
	str	x0, [sp, 128]	// tmp233, j
.L11:
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	adrp	x0, cpu_rand	// tmp236,
	add	x0, x0, :lo12:cpu_rand	// tmp235, tmp236,
	ldr	x1, [x0]	// cpu_rand.10_31, cpu_rand
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldrsw	x0, [sp, 44]	// _32, i
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	lsl	x0, x0, 2	// _33, _32,
	add	x0, x1, x0	// _34, cpu_rand.10_31, _33
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	w0, [x0]	// _35, *_34
	uxtw	x0, w0	// _36, _35
// LB_Relax.cpp:91:     		for (long long int j = 0; j < ((*(cpu_rand+i))); j++);
	ldr	x1, [sp, 128]	// tmp238, j
	cmp	x1, x0	// tmp238, _36
	cset	w0, lt	// tmp239,
	and	w0, w0, 255	// retval.9_137, tmp237
	cmp	w0, 0	// retval.9_137,
	bne	.L12		//,
// LB_Relax.cpp:92: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp241,
	add	x0, x0, :lo12:var	// tmp240, tmp241,
	ldr	x1, [x0]	// var.11_37, var
// LB_Relax.cpp:92: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 44]	// _38, i
// LB_Relax.cpp:92: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 8	// _39, _38,
	add	x0, x1, x0	// _40, var.11_37, _39
// LB_Relax.cpp:92: 	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 168]	// _40, tmp_a
// LB_Relax.cpp:93:     		tmp_a->store(1, std::memory_order_seq_cst);
	ldr	x0, [sp, 168]	// _41, tmp_a
	str	x0, [sp, 184]	// _41, this
	mov	w0, 1	// tmp242,
	str	w0, [sp, 80]	// tmp242, __i
	mov	w0, 5	// tmp243,
	str	w0, [sp, 84]	// tmp243, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 84]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 88]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 184]	// _155, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 80]	// __i.34_156, __i
	stlr	w1, [x0]	// __i.34_156,* _155
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// LB_Relax.cpp:85: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 44]	// tmp245, i
	add	w0, w0, 4	// tmp244, tmp245,
	str	w0, [sp, 44]	// tmp244, i
.L5:
// LB_Relax.cpp:85: 	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 44]	// tmp246, i
	cmp	w0, 2047	// tmp246,
	ble	.L13		//,
	b	.L14		//
.L4:
// LB_Relax.cpp:98: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	x0, [sp, 136]	// tmp247, tid
	negs	x1, x0	// tmp248, tmp247
	and	x0, x0, 3	// tmp249, tmp247,
	and	x1, x1, 3	// tmp250, tmp248,
	csneg	x0, x0, x1, mi	// _42, tmp249, tmp250,
// LB_Relax.cpp:98: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	str	w0, [sp, 48]	// tmp251, i
// LB_Relax.cpp:98: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	b	.L15		//
.L27:
// LB_Relax.cpp:100: 		auto tmp_b = (std::atomic<int>*) &((var+i)->a);
	adrp	x0, var	// tmp253,
	add	x0, x0, :lo12:var	// tmp252, tmp253,
	ldr	x1, [x0]	// var.12_43, var
// LB_Relax.cpp:100: 		auto tmp_b = (std::atomic<int>*) &((var+i)->a);
	ldrsw	x0, [sp, 48]	// _44, i
// LB_Relax.cpp:100: 		auto tmp_b = (std::atomic<int>*) &((var+i)->a);
	lsl	x0, x0, 8	// _45, _44,
	add	x0, x1, x0	// _46, var.12_43, _45
// LB_Relax.cpp:100: 		auto tmp_b = (std::atomic<int>*) &((var+i)->a);
	str	x0, [sp, 144]	// _46, tmp_b
// LB_Relax.cpp:101:     		(cpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	ldr	x0, [sp, 144]	// _47, tmp_b
	str	x0, [sp, 192]	// _47, this
	mov	w0, 5	// tmp254,
	str	w0, [sp, 92]	// tmp254, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:484: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 92]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 96]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldr	x0, [sp, 192]	// _161, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	ldar	w0, [x0]	// _163,* _161
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:488: 	return __atomic_load_n(&_M_i, int(__m));
	mov	w2, w0	// D.48663, _163
// LB_Relax.cpp:101:     		(cpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	adrp	x0, cpu_res	// tmp256,
	add	x0, x0, :lo12:cpu_res	// tmp255, tmp256,
	ldr	x1, [x0]	// cpu_res.13_49, cpu_res
// LB_Relax.cpp:101:     		(cpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	ldrsw	x0, [sp, 48]	// _50, i
// LB_Relax.cpp:101:     		(cpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	lsl	x0, x0, 7	// _51, _50,
	add	x0, x1, x0	// _52, cpu_res.13_49, _51
// LB_Relax.cpp:101:     		(cpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	mov	w1, w2	// _53, D.48663
// LB_Relax.cpp:101:     		(cpu_res+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	str	w1, [x0]	// _53, _52->r0
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	str	wzr, [sp, 52]	//, j
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	b	.L17		//
.L18:
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 52]	// tmp258, j
	add	w0, w0, 1	// tmp257, tmp258,
	str	w0, [sp, 52]	// tmp257, j
.L17:
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	adrp	x0, gpu_rand	// tmp260,
	add	x0, x0, :lo12:gpu_rand	// tmp259, tmp260,
	ldr	x1, [x0]	// gpu_rand.15_54, gpu_rand
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldrsw	x0, [sp, 48]	// _55, i
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	lsl	x0, x0, 2	// _56, _55,
	add	x0, x1, x0	// _57, gpu_rand.15_54, _56
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w1, [x0]	// _58, *_57
// LB_Relax.cpp:102:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 52]	// j.16_59, j
	cmp	w1, w0	// _58, j.16_59
	cset	w0, hi	// tmp262,
	and	w0, w0, 255	// retval.14_113, tmp261
	cmp	w0, 0	// retval.14_113,
	bne	.L18		//,
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	str	wzr, [sp, 56]	//, j
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	b	.L19		//
.L20:
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 56]	// tmp264, j
	add	w0, w0, 1	// tmp263, tmp264,
	str	w0, [sp, 56]	// tmp263, j
.L19:
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	adrp	x0, gpu_rand	// tmp266,
	add	x0, x0, :lo12:gpu_rand	// tmp265, tmp266,
	ldr	x1, [x0]	// gpu_rand.18_60, gpu_rand
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldrsw	x0, [sp, 48]	// _61, i
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	lsl	x0, x0, 2	// _62, _61,
	add	x0, x1, x0	// _63, gpu_rand.18_60, _62
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w1, [x0]	// _64, *_63
// LB_Relax.cpp:103:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 56]	// j.19_65, j
	cmp	w1, w0	// _64, j.19_65
	cset	w0, hi	// tmp268,
	and	w0, w0, 255	// retval.17_115, tmp267
	cmp	w0, 0	// retval.17_115,
	bne	.L20		//,
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	str	wzr, [sp, 60]	//, j
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	b	.L21		//
.L22:
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 60]	// tmp270, j
	add	w0, w0, 1	// tmp269, tmp270,
	str	w0, [sp, 60]	// tmp269, j
.L21:
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	adrp	x0, gpu_rand	// tmp272,
	add	x0, x0, :lo12:gpu_rand	// tmp271, tmp272,
	ldr	x1, [x0]	// gpu_rand.21_66, gpu_rand
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldrsw	x0, [sp, 48]	// _67, i
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	lsl	x0, x0, 2	// _68, _67,
	add	x0, x1, x0	// _69, gpu_rand.21_66, _68
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w1, [x0]	// _70, *_69
// LB_Relax.cpp:104:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 60]	// j.22_71, j
	cmp	w1, w0	// _70, j.22_71
	cset	w0, hi	// tmp274,
	and	w0, w0, 255	// retval.20_117, tmp273
	cmp	w0, 0	// retval.20_117,
	bne	.L22		//,
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	str	wzr, [sp, 64]	//, j
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	b	.L23		//
.L24:
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 64]	// tmp276, j
	add	w0, w0, 1	// tmp275, tmp276,
	str	w0, [sp, 64]	// tmp275, j
.L23:
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	adrp	x0, gpu_rand	// tmp278,
	add	x0, x0, :lo12:gpu_rand	// tmp277, tmp278,
	ldr	x1, [x0]	// gpu_rand.24_72, gpu_rand
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldrsw	x0, [sp, 48]	// _73, i
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	lsl	x0, x0, 2	// _74, _73,
	add	x0, x1, x0	// _75, gpu_rand.24_72, _74
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w1, [x0]	// _76, *_75
// LB_Relax.cpp:105:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 64]	// j.25_77, j
	cmp	w1, w0	// _76, j.25_77
	cset	w0, hi	// tmp280,
	and	w0, w0, 255	// retval.23_119, tmp279
	cmp	w0, 0	// retval.23_119,
	bne	.L24		//,
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	str	wzr, [sp, 68]	//, j
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	b	.L25		//
.L26:
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 68]	// tmp282, j
	add	w0, w0, 1	// tmp281, tmp282,
	str	w0, [sp, 68]	// tmp281, j
.L25:
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	adrp	x0, gpu_rand	// tmp284,
	add	x0, x0, :lo12:gpu_rand	// tmp283, tmp284,
	ldr	x1, [x0]	// gpu_rand.27_78, gpu_rand
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldrsw	x0, [sp, 48]	// _79, i
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	lsl	x0, x0, 2	// _80, _79,
	add	x0, x1, x0	// _81, gpu_rand.27_78, _80
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w1, [x0]	// _82, *_81
// LB_Relax.cpp:106:     		for (int j = 0; j < (*(gpu_rand+i)); j++);
	ldr	w0, [sp, 68]	// j.28_83, j
	cmp	w1, w0	// _82, j.28_83
	cset	w0, hi	// tmp286,
	and	w0, w0, 255	// retval.26_121, tmp285
	cmp	w0, 0	// retval.26_121,
	bne	.L26		//,
// LB_Relax.cpp:107:     		auto tmp_a = (std::atomic<int>*) &((var+i)->b); 
	adrp	x0, var	// tmp288,
	add	x0, x0, :lo12:var	// tmp287, tmp288,
	ldr	x1, [x0]	// var.29_84, var
// LB_Relax.cpp:107:     		auto tmp_a = (std::atomic<int>*) &((var+i)->b); 
	ldrsw	x0, [sp, 48]	// _85, i
// LB_Relax.cpp:107:     		auto tmp_a = (std::atomic<int>*) &((var+i)->b); 
	lsl	x0, x0, 8	// _86, _85,
	add	x0, x1, x0	// _87, var.29_84, _86
// LB_Relax.cpp:107:     		auto tmp_a = (std::atomic<int>*) &((var+i)->b); 
	add	x0, x0, 128	// tmp289, _87,
	str	x0, [sp, 152]	// tmp289, tmp_a
// LB_Relax.cpp:108:     		tmp_a->store(1, std::memory_order_seq_cst);
	ldr	x0, [sp, 152]	// _88, tmp_a
	str	x0, [sp, 200]	// _88, this
	mov	w0, 1	// tmp290,
	str	w0, [sp, 100]	// tmp290, __i
	mov	w0, 5	// tmp291,
	str	w0, [sp, 104]	// tmp291, __m
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:459: 	  = __m & __memory_order_mask;
	mov	w1, 65535	//,
	ldr	w0, [sp, 104]	//, __m
	bl	_ZStanSt12memory_orderSt23__memory_order_modifier		//
	str	w0, [sp, 108]	//, __b
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	x0, [sp, 200]	// _169, this
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:464: 	__atomic_store_n(&_M_i, __i, int(__m));
	ldr	w1, [sp, 100]	// __i.34_170, __i
	stlr	w1, [x0]	// __i.34_170,* _169
// /usr/aarch64-linux-gnu/include/c++/11/bits/atomic_base.h:465:       }
	nop	
// LB_Relax.cpp:98: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 48]	// tmp293, i
	add	w0, w0, 4	// tmp292, tmp293,
	str	w0, [sp, 48]	// tmp292, i
.L15:
// LB_Relax.cpp:98: 	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	ldr	w0, [sp, 48]	// tmp294, i
	cmp	w0, 2047	// tmp294,
	ble	.L27		//,
.L14:
// LB_Relax.cpp:116:     return (void*)local;
	mrs	x0, tpidr_el0	// tmp296
	add	x0, x0, #:tprel_hi12:local, lsl #12	// tmp295, tmp296,
	add	x0, x0, #:tprel_lo12_nc:local	// tmp295,
	ldr	w0, [x0]	// local.30_89, local
	sxtw	x0, w0	// _90, local.30_89
// LB_Relax.cpp:117: }
	ldp	x29, x30, [sp], 208	//,,,
	.cfi_restore 30
	.cfi_restore 29
	.cfi_def_cfa_offset 0
	ret	
	.cfi_endproc
.LFE1808:
	.size	_Z5runSBPv, .-_Z5runSBPv
	.section	.rodata
	.align	3
.LC0:
	.string	"Success!"
	.align	3
.LC1:
	.string	"Count (a:0 and b:0): "
	.align	3
.LC2:
	.string	"Count (a:1 and b:0): "
	.align	3
.LC3:
	.string	"Count (a:0 and b:1): "
	.align	3
.LC4:
	.string	"Count (a:1 and b:1): "
	.align	3
.LC5:
	.string	"Count (r0:2 and r1:2): "
	.align	3
.LC6:
	.string	"Num Valid test: "
	.align	3
.LC7:
	.string	"Num Invalid test: "
	.align	3
.LC8:
	.string	"========================================================================="
	.align	3
.LC9:
	.string	"\t\t CPU-Only LB-sys Disallowed  \t "
	.align	3
.LC10:
	.string	"Fail!"
	.align	3
.LC11:
	.string	"\t\t CPU-Only LB-sys Allowed  \t "
	.text
	.align	2
	.global	_Z12check_outputj
	.type	_Z12check_outputj, %function
_Z12check_outputj:
.LFB1809:
	.cfi_startproc
	stp	x29, x30, [sp, -64]!	//,,,
	.cfi_def_cfa_offset 64
	.cfi_offset 29, -64
	.cfi_offset 30, -56
	mov	x29, sp	//,
	str	w0, [sp, 28]	// t_range, t_range
// LB_Relax.cpp:122:     unsigned res_cpu0_gpu0 = 0;
	str	wzr, [sp, 40]	//, res_cpu0_gpu0
// LB_Relax.cpp:123:     unsigned res_cpu1_gpu0 = 0;
	str	wzr, [sp, 44]	//, res_cpu1_gpu0
// LB_Relax.cpp:124:     unsigned res_cpu0_gpu1 = 0;
	str	wzr, [sp, 48]	//, res_cpu0_gpu1
// LB_Relax.cpp:125:     unsigned res_cpu1_gpu1 = 0;
	str	wzr, [sp, 52]	//, res_cpu1_gpu1
// LB_Relax.cpp:126:     unsigned res_cpu2_gpu2 = 0;
	str	wzr, [sp, 56]	//, res_cpu2_gpu2
// LB_Relax.cpp:127:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 60]	//, i
// LB_Relax.cpp:127:     for (auto i = 0; i < t_range; ++i) {
	b	.L30		//
.L44:
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp178,
	add	x0, x0, :lo12:cpu_res	// tmp177, tmp178,
	ldr	x1, [x0]	// cpu_res.38_1, cpu_res
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _2, i
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 7	// _3, _2,
	add	x0, x1, x0	// _4, cpu_res.38_1, _3
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _5, _4->r0
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _5,
	bne	.L31		//,
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp180,
	add	x0, x0, :lo12:gpu_res	// tmp179, tmp180,
	ldr	x1, [x0]	// gpu_res.39_6, gpu_res
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _7, i
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 7	// _8, _7,
	add	x0, x1, x0	// _9, gpu_res.39_6, _8
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _10, _9->r0
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _10,
	bne	.L31		//,
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.37_91,
	b	.L32		//
.L31:
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.37_91,
.L32:
// LB_Relax.cpp:128:         if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.37_91,
	beq	.L33		//,
// LB_Relax.cpp:129:             res_cpu0_gpu0++;
	ldr	w0, [sp, 40]	// tmp182, res_cpu0_gpu0
	add	w0, w0, 1	// tmp181, tmp182,
	str	w0, [sp, 40]	// tmp181, res_cpu0_gpu0
	b	.L34		//
.L33:
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, cpu_res	// tmp184,
	add	x0, x0, :lo12:cpu_res	// tmp183, tmp184,
	ldr	x1, [x0]	// cpu_res.42_11, cpu_res
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _12, i
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 7	// _13, _12,
	add	x0, x1, x0	// _14, cpu_res.42_11, _13
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _15, _14->r0
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 1	// _15,
	bne	.L35		//,
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	adrp	x0, gpu_res	// tmp186,
	add	x0, x0, :lo12:gpu_res	// tmp185, tmp186,
	ldr	x1, [x0]	// gpu_res.43_16, gpu_res
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldrsw	x0, [sp, 60]	// _17, i
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	lsl	x0, x0, 7	// _18, _17,
	add	x0, x1, x0	// _19, gpu_res.43_16, _18
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	ldr	w0, [x0]	// _20, _19->r0
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// _20,
	bne	.L35		//,
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 1	// iftmp.41_92,
	b	.L36		//
.L35:
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	mov	w0, 0	// iftmp.41_92,
.L36:
// LB_Relax.cpp:130:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
	cmp	w0, 0	// iftmp.41_92,
	beq	.L37		//,
// LB_Relax.cpp:131:             res_cpu1_gpu0++;
	ldr	w0, [sp, 44]	// tmp188, res_cpu1_gpu0
	add	w0, w0, 1	// tmp187, tmp188,
	str	w0, [sp, 44]	// tmp187, res_cpu1_gpu0
	b	.L34		//
.L37:
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp190,
	add	x0, x0, :lo12:cpu_res	// tmp189, tmp190,
	ldr	x1, [x0]	// cpu_res.46_21, cpu_res
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _22, i
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 7	// _23, _22,
	add	x0, x1, x0	// _24, cpu_res.46_21, _23
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _25, _24->r0
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// _25,
	bne	.L38		//,
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp192,
	add	x0, x0, :lo12:gpu_res	// tmp191, tmp192,
	ldr	x1, [x0]	// gpu_res.47_26, gpu_res
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _27, i
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 7	// _28, _27,
	add	x0, x1, x0	// _29, gpu_res.47_26, _28
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _30, _29->r0
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _30,
	bne	.L38		//,
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.45_93,
	b	.L39		//
.L38:
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.45_93,
.L39:
// LB_Relax.cpp:132:         } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.45_93,
	beq	.L40		//,
// LB_Relax.cpp:133:             res_cpu0_gpu1++;
	ldr	w0, [sp, 48]	// tmp194, res_cpu0_gpu1
	add	w0, w0, 1	// tmp193, tmp194,
	str	w0, [sp, 48]	// tmp193, res_cpu0_gpu1
	b	.L34		//
.L40:
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, cpu_res	// tmp196,
	add	x0, x0, :lo12:cpu_res	// tmp195, tmp196,
	ldr	x1, [x0]	// cpu_res.50_31, cpu_res
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _32, i
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 7	// _33, _32,
	add	x0, x1, x0	// _34, cpu_res.50_31, _33
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _35, _34->r0
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _35,
	bne	.L41		//,
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	adrp	x0, gpu_res	// tmp198,
	add	x0, x0, :lo12:gpu_res	// tmp197, tmp198,
	ldr	x1, [x0]	// gpu_res.51_36, gpu_res
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldrsw	x0, [sp, 60]	// _37, i
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	lsl	x0, x0, 7	// _38, _37,
	add	x0, x1, x0	// _39, gpu_res.51_36, _38
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	ldr	w0, [x0]	// _40, _39->r0
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 1	// _40,
	bne	.L41		//,
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 1	// iftmp.49_94,
	b	.L42		//
.L41:
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	mov	w0, 0	// iftmp.49_94,
.L42:
// LB_Relax.cpp:134:         } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
	cmp	w0, 0	// iftmp.49_94,
	beq	.L43		//,
// LB_Relax.cpp:135:             res_cpu1_gpu1++;
	ldr	w0, [sp, 52]	// tmp200, res_cpu1_gpu1
	add	w0, w0, 1	// tmp199, tmp200,
	str	w0, [sp, 52]	// tmp199, res_cpu1_gpu1
	b	.L34		//
.L43:
// LB_Relax.cpp:138:             res_cpu2_gpu2++;
	ldr	w0, [sp, 56]	// tmp202, res_cpu2_gpu2
	add	w0, w0, 1	// tmp201, tmp202,
	str	w0, [sp, 56]	// tmp201, res_cpu2_gpu2
.L34:
// LB_Relax.cpp:127:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// tmp204, i
	add	w0, w0, 1	// tmp203, tmp204,
	str	w0, [sp, 60]	// tmp203, i
.L30:
// LB_Relax.cpp:127:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 60]	// i.52_41, i
// LB_Relax.cpp:127:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 28]	// tmp205, t_range
	cmp	w1, w0	// tmp205, i.52_41
	bhi	.L44		//,
// LB_Relax.cpp:142:    if (!res_cpu1_gpu1) {
	ldr	w0, [sp, 52]	// tmp206, res_cpu1_gpu1
	cmp	w0, 0	// tmp206,
	bne	.L45		//,
// LB_Relax.cpp:143:         std::cout << "Success!" << std::endl;
	adrp	x0, .LC0	// tmp207,
	add	x1, x0, :lo12:.LC0	//, tmp207,
	adrp	x0, :got:_ZSt4cout	// tmp208,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp208,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _42,
// LB_Relax.cpp:143:         std::cout << "Success!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp209,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp209,
	mov	x0, x2	//, _42
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:144:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, .LC1	// tmp210,
	add	x1, x0, :lo12:.LC1	//, tmp210,
	adrp	x0, :got:_ZSt4cout	// tmp211,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp211,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:144:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	ldr	w1, [sp, 40]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _44,
// LB_Relax.cpp:144:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp212,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp212,
	mov	x0, x2	//, _44
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:145:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, .LC2	// tmp213,
	add	x1, x0, :lo12:.LC2	//, tmp213,
	adrp	x0, :got:_ZSt4cout	// tmp214,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp214,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:145:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _46,
// LB_Relax.cpp:145:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp215,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp215,
	mov	x0, x2	//, _46
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:146:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, .LC3	// tmp216,
	add	x1, x0, :lo12:.LC3	//, tmp216,
	adrp	x0, :got:_ZSt4cout	// tmp217,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp217,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:146:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _48,
// LB_Relax.cpp:146:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp218,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp218,
	mov	x0, x2	//, _48
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:147:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, .LC4	// tmp219,
	add	x1, x0, :lo12:.LC4	//, tmp219,
	adrp	x0, :got:_ZSt4cout	// tmp220,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp220,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:147:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _50,
// LB_Relax.cpp:147:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp221,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp221,
	mov	x0, x2	//, _50
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:148:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	adrp	x0, .LC5	// tmp222,
	add	x1, x0, :lo12:.LC5	//, tmp222,
	adrp	x0, :got:_ZSt4cout	// tmp223,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp223,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:148:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 56]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _52,
// LB_Relax.cpp:148:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp224,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp224,
	mov	x0, x2	//, _52
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:149:         std::cout << "Num Valid test: " << (t_range - res_cpu1_gpu1) << std::endl;
	adrp	x0, .LC6	// tmp225,
	add	x1, x0, :lo12:.LC6	//, tmp225,
	adrp	x0, :got:_ZSt4cout	// tmp226,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp226,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _53,
// LB_Relax.cpp:149:         std::cout << "Num Valid test: " << (t_range - res_cpu1_gpu1) << std::endl;
	ldr	w1, [sp, 28]	// tmp227, t_range
	ldr	w0, [sp, 52]	// tmp228, res_cpu1_gpu1
	sub	w0, w1, w0	// _54, tmp227, tmp228
	mov	w1, w0	//, _54
	mov	x0, x2	//, _53
	bl	_ZNSolsEj		//
	mov	x2, x0	// _55,
// LB_Relax.cpp:149:         std::cout << "Num Valid test: " << (t_range - res_cpu1_gpu1) << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp229,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp229,
	mov	x0, x2	//, _55
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:150:         std::cout << "Num Invalid test: " << res_cpu1_gpu1 << std::endl;
	adrp	x0, .LC7	// tmp230,
	add	x1, x0, :lo12:.LC7	//, tmp230,
	adrp	x0, :got:_ZSt4cout	// tmp231,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp231,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:150:         std::cout << "Num Invalid test: " << res_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _57,
// LB_Relax.cpp:150:         std::cout << "Num Invalid test: " << res_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp232,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp232,
	mov	x0, x2	//, _57
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:151:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp233,
	add	x1, x0, :lo12:.LC8	//, tmp233,
	adrp	x0, :got:_ZSt4cout	// tmp234,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp234,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _58,
// LB_Relax.cpp:151:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp235,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp235,
	mov	x0, x2	//, _58
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:152:         std::cout << "	\t CPU-Only LB-sys Disallowed  \t " << std::endl;						
	adrp	x0, .LC9	// tmp236,
	add	x1, x0, :lo12:.LC9	//, tmp236,
	adrp	x0, :got:_ZSt4cout	// tmp237,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp237,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _59,
// LB_Relax.cpp:152:         std::cout << "	\t CPU-Only LB-sys Disallowed  \t " << std::endl;						
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp238,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp238,
	mov	x0, x2	//, _59
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:153:         std::cout << "=========================================================================" << std::endl;  
	adrp	x0, .LC8	// tmp239,
	add	x1, x0, :lo12:.LC8	//, tmp239,
	adrp	x0, :got:_ZSt4cout	// tmp240,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp240,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _60,
// LB_Relax.cpp:153:         std::cout << "=========================================================================" << std::endl;  
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp241,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp241,
	mov	x0, x2	//, _60
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:154:         return 0;
	mov	w0, 0	// _95,
	b	.L46		//
.L45:
// LB_Relax.cpp:156:         std::cout << "Fail!" << std::endl;
	adrp	x0, .LC10	// tmp242,
	add	x1, x0, :lo12:.LC10	//, tmp242,
	adrp	x0, :got:_ZSt4cout	// tmp243,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp243,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _61,
// LB_Relax.cpp:156:         std::cout << "Fail!" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp244,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp244,
	mov	x0, x2	//, _61
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:157:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, .LC1	// tmp245,
	add	x1, x0, :lo12:.LC1	//, tmp245,
	adrp	x0, :got:_ZSt4cout	// tmp246,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp246,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:157:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	ldr	w1, [sp, 40]	//, res_cpu0_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _63,
// LB_Relax.cpp:157:         std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp247,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp247,
	mov	x0, x2	//, _63
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:158:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, .LC2	// tmp248,
	add	x1, x0, :lo12:.LC2	//, tmp248,
	adrp	x0, :got:_ZSt4cout	// tmp249,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp249,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:158:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	ldr	w1, [sp, 44]	//, res_cpu1_gpu0
	bl	_ZNSolsEj		//
	mov	x2, x0	// _65,
// LB_Relax.cpp:158:         std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp250,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp250,
	mov	x0, x2	//, _65
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:159:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, .LC3	// tmp251,
	add	x1, x0, :lo12:.LC3	//, tmp251,
	adrp	x0, :got:_ZSt4cout	// tmp252,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp252,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:159:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	ldr	w1, [sp, 48]	//, res_cpu0_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _67,
// LB_Relax.cpp:159:         std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp253,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp253,
	mov	x0, x2	//, _67
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:160:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, .LC4	// tmp254,
	add	x1, x0, :lo12:.LC4	//, tmp254,
	adrp	x0, :got:_ZSt4cout	// tmp255,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp255,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:160:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _69,
// LB_Relax.cpp:160:         std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp256,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp256,
	mov	x0, x2	//, _69
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:161:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	adrp	x0, .LC5	// tmp257,
	add	x1, x0, :lo12:.LC5	//, tmp257,
	adrp	x0, :got:_ZSt4cout	// tmp258,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp258,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:161:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	ldr	w1, [sp, 56]	//, res_cpu2_gpu2
	bl	_ZNSolsEj		//
	mov	x2, x0	// _71,
// LB_Relax.cpp:161:         std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp259,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp259,
	mov	x0, x2	//, _71
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:162:         std::cout << "Num Valid test: " << (t_range - res_cpu1_gpu1) << std::endl;
	adrp	x0, .LC6	// tmp260,
	add	x1, x0, :lo12:.LC6	//, tmp260,
	adrp	x0, :got:_ZSt4cout	// tmp261,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp261,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _72,
// LB_Relax.cpp:162:         std::cout << "Num Valid test: " << (t_range - res_cpu1_gpu1) << std::endl;
	ldr	w1, [sp, 28]	// tmp262, t_range
	ldr	w0, [sp, 52]	// tmp263, res_cpu1_gpu1
	sub	w0, w1, w0	// _73, tmp262, tmp263
	mov	w1, w0	//, _73
	mov	x0, x2	//, _72
	bl	_ZNSolsEj		//
	mov	x2, x0	// _74,
// LB_Relax.cpp:162:         std::cout << "Num Valid test: " << (t_range - res_cpu1_gpu1) << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp264,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp264,
	mov	x0, x2	//, _74
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:163:         std::cout << "Num Invalid test: " << res_cpu1_gpu1 << std::endl;
	adrp	x0, .LC7	// tmp265,
	add	x1, x0, :lo12:.LC7	//, tmp265,
	adrp	x0, :got:_ZSt4cout	// tmp266,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp266,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
// LB_Relax.cpp:163:         std::cout << "Num Invalid test: " << res_cpu1_gpu1 << std::endl;
	ldr	w1, [sp, 52]	//, res_cpu1_gpu1
	bl	_ZNSolsEj		//
	mov	x2, x0	// _76,
// LB_Relax.cpp:163:         std::cout << "Num Invalid test: " << res_cpu1_gpu1 << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp267,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp267,
	mov	x0, x2	//, _76
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:164:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, .LC8	// tmp268,
	add	x1, x0, :lo12:.LC8	//, tmp268,
	adrp	x0, :got:_ZSt4cout	// tmp269,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp269,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _77,
// LB_Relax.cpp:164:         std::cout << "=========================================================================" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp270,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp270,
	mov	x0, x2	//, _77
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:165:         std::cout << "	\t CPU-Only LB-sys Allowed  \t " << std::endl;						
	adrp	x0, .LC11	// tmp271,
	add	x1, x0, :lo12:.LC11	//, tmp271,
	adrp	x0, :got:_ZSt4cout	// tmp272,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp272,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _78,
// LB_Relax.cpp:165:         std::cout << "	\t CPU-Only LB-sys Allowed  \t " << std::endl;						
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp273,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp273,
	mov	x0, x2	//, _78
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:166:         std::cout << "=========================================================================" << std::endl;  
	adrp	x0, .LC8	// tmp274,
	add	x1, x0, :lo12:.LC8	//, tmp274,
	adrp	x0, :got:_ZSt4cout	// tmp275,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp275,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _79,
// LB_Relax.cpp:166:         std::cout << "=========================================================================" << std::endl;  
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp276,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp276,
	mov	x0, x2	//, _79
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:167:         return 2;
	mov	w0, 2	// _95,
.L46:
// LB_Relax.cpp:169: }
	ldp	x29, x30, [sp], 64	//,,,
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
	.string	"LB_Relax.cpp"
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
	stp	x29, x30, [sp, -112]!	//,,,
	.cfi_def_cfa_offset 112
	.cfi_offset 29, -112
	.cfi_offset 30, -104
	mov	x29, sp	//,
	str	w0, [sp, 28]	// argc, argc
	str	x1, [sp, 16]	// argv, argv
// LB_Relax.cpp:174: {
	adrp	x0, :got:__stack_chk_guard	// tmp161,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp160, tmp161,
	ldr	x1, [x0]	// tmp270,
	str	x1, [sp, 104]	// tmp270, D.48682
	mov	x1, 0	// tmp270
// LB_Relax.cpp:175:     if (argc != 2) { 
	ldr	w0, [sp, 28]	// tmp162, argc
	cmp	w0, 2	// tmp162,
	beq	.L48		//,
// LB_Relax.cpp:176:         printf("usage: %s <thread_count>\n", argv[0]);
	ldr	x0, [sp, 16]	// tmp163, argv
	ldr	x0, [x0]	// _1, *argv_79(D)
	mov	x1, x0	//, _1
	adrp	x0, .LC12	// tmp164,
	add	x0, x0, :lo12:.LC12	//, tmp164,
	bl	printf		//
// LB_Relax.cpp:177:         exit(1);
	mov	w0, 1	//,
	bl	exit		//
.L48:
// LB_Relax.cpp:179:     int thread_count = atoi(argv[1]);
	ldr	x0, [sp, 16]	// tmp165, argv
	add	x0, x0, 8	// _2, tmp165,
// LB_Relax.cpp:179:     int thread_count = atoi(argv[1]);
	ldr	x0, [x0]	// _3, *_2
	bl	atoi		//
	str	w0, [sp, 56]	//, thread_count
// LB_Relax.cpp:181:     printf("Starting %d threads...\n", thread_count);
	ldr	w1, [sp, 56]	//, thread_count
	adrp	x0, .LC13	// tmp166,
	add	x0, x0, :lo12:.LC13	//, tmp166,
	bl	printf		//
// LB_Relax.cpp:183: auto num_iterations = DEF_RUNS; 
	mov	w0, 2048	// tmp167,
	str	w0, [sp, 60]	// tmp167, num_iterations
// LB_Relax.cpp:185: auto t_range = num_iterations;
	ldr	w0, [sp, 60]	// tmp168, num_iterations
	str	w0, [sp, 64]	// tmp168, t_range
// LB_Relax.cpp:187:    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	ldrsw	x0, [sp, 64]	// _4, t_range
// LB_Relax.cpp:187:    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	lsl	x0, x0, 8	// _5, _4,
	bl	malloc		//
	mov	x1, x0	// _6, tmp169
// LB_Relax.cpp:187:    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
	adrp	x0, var	// tmp171,
	add	x0, x0, :lo12:var	// tmp170, tmp171,
	str	x1, [x0]	// _6, var
// LB_Relax.cpp:189:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 36]	//, i
// LB_Relax.cpp:189:     for (auto i = 0; i < t_range; ++i) {
	b	.L49		//
.L50:
// LB_Relax.cpp:190:         var[i].a = 0;
	adrp	x0, var	// tmp173,
	add	x0, x0, :lo12:var	// tmp172, tmp173,
	ldr	x1, [x0]	// var.53_7, var
// LB_Relax.cpp:190:         var[i].a = 0;
	ldrsw	x0, [sp, 36]	// _8, i
// LB_Relax.cpp:190:         var[i].a = 0;
	lsl	x0, x0, 8	// _9, _8,
	add	x0, x1, x0	// _10, var.53_7, _9
// LB_Relax.cpp:190:         var[i].a = 0;
	str	wzr, [x0]	//, _10->a
// LB_Relax.cpp:191:         var[i].b = 0;
	adrp	x0, var	// tmp175,
	add	x0, x0, :lo12:var	// tmp174, tmp175,
	ldr	x1, [x0]	// var.54_11, var
// LB_Relax.cpp:191:         var[i].b = 0;
	ldrsw	x0, [sp, 36]	// _12, i
// LB_Relax.cpp:191:         var[i].b = 0;
	lsl	x0, x0, 8	// _13, _12,
	add	x0, x1, x0	// _14, var.54_11, _13
// LB_Relax.cpp:191:         var[i].b = 0;
	str	wzr, [x0, 128]	//, _14->b
// LB_Relax.cpp:189:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 36]	// tmp177, i
	add	w0, w0, 1	// tmp176, tmp177,
	str	w0, [sp, 36]	// tmp176, i
.L49:
// LB_Relax.cpp:189:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 36]	// tmp178, i
	ldr	w0, [sp, 64]	// tmp179, t_range
	cmp	w1, w0	// tmp178, tmp179
	blt	.L50		//,
// LB_Relax.cpp:195:    cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	ldrsw	x0, [sp, 64]	// _15, t_range
// LB_Relax.cpp:195:    cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	lsl	x0, x0, 7	// _16, _15,
	bl	malloc		//
	mov	x1, x0	// _17, tmp180
// LB_Relax.cpp:195:    cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
	adrp	x0, cpu_res	// tmp182,
	add	x0, x0, :lo12:cpu_res	// tmp181, tmp182,
	str	x1, [x0]	// _17, cpu_res
// LB_Relax.cpp:197:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 40]	//, i
// LB_Relax.cpp:197:     for (auto i = 0; i < t_range; ++i) {
	b	.L51		//
.L52:
// LB_Relax.cpp:198:         cpu_res[i].r0 = 2;
	adrp	x0, cpu_res	// tmp184,
	add	x0, x0, :lo12:cpu_res	// tmp183, tmp184,
	ldr	x1, [x0]	// cpu_res.55_18, cpu_res
// LB_Relax.cpp:198:         cpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 40]	// _19, i
// LB_Relax.cpp:198:         cpu_res[i].r0 = 2;
	lsl	x0, x0, 7	// _20, _19,
	add	x0, x1, x0	// _21, cpu_res.55_18, _20
// LB_Relax.cpp:198:         cpu_res[i].r0 = 2;
	mov	w1, 2	// tmp185,
	str	w1, [x0]	// tmp185, _21->r0
// LB_Relax.cpp:197:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 40]	// tmp187, i
	add	w0, w0, 1	// tmp186, tmp187,
	str	w0, [sp, 40]	// tmp186, i
.L51:
// LB_Relax.cpp:197:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 40]	// tmp188, i
	ldr	w0, [sp, 64]	// tmp189, t_range
	cmp	w1, w0	// tmp188, tmp189
	blt	.L52		//,
// LB_Relax.cpp:202:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	ldrsw	x0, [sp, 64]	// _22, t_range
// LB_Relax.cpp:202:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	lsl	x0, x0, 7	// _23, _22,
	bl	malloc		//
	mov	x1, x0	// _24, tmp190
// LB_Relax.cpp:202:     gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
	adrp	x0, gpu_res	// tmp192,
	add	x0, x0, :lo12:gpu_res	// tmp191, tmp192,
	str	x1, [x0]	// _24, gpu_res
// LB_Relax.cpp:204:     for (auto i = 0; i < t_range; ++i) {
	str	wzr, [sp, 44]	//, i
// LB_Relax.cpp:204:     for (auto i = 0; i < t_range; ++i) {
	b	.L53		//
.L54:
// LB_Relax.cpp:205:         gpu_res[i].r0 = 2;
	adrp	x0, gpu_res	// tmp194,
	add	x0, x0, :lo12:gpu_res	// tmp193, tmp194,
	ldr	x1, [x0]	// gpu_res.56_25, gpu_res
// LB_Relax.cpp:205:         gpu_res[i].r0 = 2;
	ldrsw	x0, [sp, 44]	// _26, i
// LB_Relax.cpp:205:         gpu_res[i].r0 = 2;
	lsl	x0, x0, 7	// _27, _26,
	add	x0, x1, x0	// _28, gpu_res.56_25, _27
// LB_Relax.cpp:205:         gpu_res[i].r0 = 2;
	mov	w1, 2	// tmp195,
	str	w1, [x0]	// tmp195, _28->r0
// LB_Relax.cpp:204:     for (auto i = 0; i < t_range; ++i) {
	ldr	w0, [sp, 44]	// tmp197, i
	add	w0, w0, 1	// tmp196, tmp197,
	str	w0, [sp, 44]	// tmp196, i
.L53:
// LB_Relax.cpp:204:     for (auto i = 0; i < t_range; ++i) {
	ldr	w1, [sp, 44]	// tmp198, i
	ldr	w0, [sp, 64]	// tmp199, t_range
	cmp	w1, w0	// tmp198, tmp199
	blt	.L54		//,
// LB_Relax.cpp:210:    cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 64]	// _29, t_range
// LB_Relax.cpp:210:    cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _30, _29,
	bl	malloc		//
	mov	x1, x0	// _31, tmp200
// LB_Relax.cpp:210:    cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, cpu_rand	// tmp202,
	add	x0, x0, :lo12:cpu_rand	// tmp201, tmp202,
	str	x1, [x0]	// _31, cpu_rand
// LB_Relax.cpp:212:    gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	ldrsw	x0, [sp, 64]	// _32, t_range
// LB_Relax.cpp:212:    gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	lsl	x0, x0, 2	// _33, _32,
	bl	malloc		//
	mov	x1, x0	// _34, tmp203
// LB_Relax.cpp:212:    gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
	adrp	x0, gpu_rand	// tmp205,
	add	x0, x0, :lo12:gpu_rand	// tmp204, tmp205,
	str	x1, [x0]	// _34, gpu_rand
// LB_Relax.cpp:215: for (int iter = 0; iter < num_iterations; iter++) {
	str	wzr, [sp, 48]	//, iter
// LB_Relax.cpp:215: for (int iter = 0; iter < num_iterations; iter++) {
	b	.L55		//
.L56:
// LB_Relax.cpp:217:             auto g_tid = iter;
	ldr	w0, [sp, 48]	// tmp206, iter
	str	w0, [sp, 80]	// tmp206, g_tid
// LB_Relax.cpp:220:             unsigned rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w1, w0	// _35,
// LB_Relax.cpp:220:             unsigned rand_val = std::rand() % RAND_RANGE;
	mov	w0, 33205	// tmp208,
	movk	w0, 0x1b4e, lsl 16	// tmp208,,
	smull	x0, w1, w0	// tmp207, _35, tmp208
	lsr	x0, x0, 32	// tmp209, tmp207,
	asr	w2, w0, 5	// tmp210, tmp209,
	asr	w0, w1, 31	// tmp211, _35,
	sub	w0, w2, w0	// _36, tmp210, tmp211
	mov	w2, 300	// tmp213,
	mul	w0, w0, w2	// tmp212, _36, tmp213
	sub	w0, w1, w0	// _36, _35, tmp212
// LB_Relax.cpp:220:             unsigned rand_val = std::rand() % RAND_RANGE;
	str	w0, [sp, 84]	// _36, rand_val
// LB_Relax.cpp:222:             cpu_rand[g_tid] = rand_val;
	adrp	x0, cpu_rand	// tmp215,
	add	x0, x0, :lo12:cpu_rand	// tmp214, tmp215,
	ldr	x1, [x0]	// cpu_rand.57_37, cpu_rand
// LB_Relax.cpp:222:             cpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 80]	// _38, g_tid
// LB_Relax.cpp:222:             cpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _39, _38,
	add	x0, x1, x0	// _40, cpu_rand.57_37, _39
// LB_Relax.cpp:222:             cpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 84]	// tmp216, rand_val
	str	w1, [x0]	// tmp216, *_40
// LB_Relax.cpp:225:             rand_val = std::rand() % RAND_RANGE;
	bl	rand		//
	mov	w1, w0	// _41,
// LB_Relax.cpp:225:             rand_val = std::rand() % RAND_RANGE;
	mov	w0, 33205	// tmp218,
	movk	w0, 0x1b4e, lsl 16	// tmp218,,
	smull	x0, w1, w0	// tmp217, _41, tmp218
	lsr	x0, x0, 32	// tmp219, tmp217,
	asr	w2, w0, 5	// tmp220, tmp219,
	asr	w0, w1, 31	// tmp221, _41,
	sub	w0, w2, w0	// _42, tmp220, tmp221
	mov	w2, 300	// tmp223,
	mul	w0, w0, w2	// tmp222, _42, tmp223
	sub	w0, w1, w0	// _42, _41, tmp222
// LB_Relax.cpp:225:             rand_val = std::rand() % RAND_RANGE;
	str	w0, [sp, 84]	// _42, rand_val
// LB_Relax.cpp:227:             gpu_rand[g_tid] = rand_val;
	adrp	x0, gpu_rand	// tmp225,
	add	x0, x0, :lo12:gpu_rand	// tmp224, tmp225,
	ldr	x1, [x0]	// gpu_rand.58_43, gpu_rand
// LB_Relax.cpp:227:             gpu_rand[g_tid] = rand_val;
	ldrsw	x0, [sp, 80]	// _44, g_tid
// LB_Relax.cpp:227:             gpu_rand[g_tid] = rand_val;
	lsl	x0, x0, 2	// _45, _44,
	add	x0, x1, x0	// _46, gpu_rand.58_43, _45
// LB_Relax.cpp:227:             gpu_rand[g_tid] = rand_val;
	ldr	w1, [sp, 84]	// tmp226, rand_val
	str	w1, [x0]	// tmp226, *_46
// LB_Relax.cpp:215: for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w0, [sp, 48]	// tmp228, iter
	add	w0, w0, 1	// tmp227, tmp228,
	str	w0, [sp, 48]	// tmp227, iter
.L55:
// LB_Relax.cpp:215: for (int iter = 0; iter < num_iterations; iter++) {
	ldr	w1, [sp, 48]	// tmp229, iter
	ldr	w0, [sp, 60]	// tmp230, num_iterations
	cmp	w1, w0	// tmp229, tmp230
	blt	.L56		//,
// LB_Relax.cpp:230:     std::cout << "Random thread launch delays generated" << std::endl;
	adrp	x0, .LC14	// tmp231,
	add	x1, x0, :lo12:.LC14	//, tmp231,
	adrp	x0, :got:_ZSt4cout	// tmp232,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp232,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _47,
// LB_Relax.cpp:230:     std::cout << "Random thread launch delays generated" << std::endl;
	adrp	x0, :got:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp233,
	ldr	x1, [x0, #:got_lo12:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp233,
	mov	x0, x2	//, _47
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:235:     pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
	ldrsw	x0, [sp, 56]	// _48, thread_count
	mov	x1, 8	//,
	bl	calloc		//
	str	x0, [sp, 96]	// tmp234, threads
// LB_Relax.cpp:236:     pthread_barrier_init(&barrier, NULL, (thread_count));
	ldr	w0, [sp, 56]	// thread_count.59_49, thread_count
	mov	w2, w0	//, thread_count.59_49
	mov	x1, 0	//,
	adrp	x0, barrier	// tmp235,
	add	x0, x0, :lo12:barrier	//, tmp235,
	bl	pthread_barrier_init		//
// LB_Relax.cpp:237:     assert(threads != NULL);
	ldr	x0, [sp, 96]	// tmp236, threads
	cmp	x0, 0	// tmp236,
	bne	.L57		//,
// LB_Relax.cpp:237:     assert(threads != NULL);
	adrp	x0, .LC15	// tmp237,
	add	x3, x0, :lo12:.LC15	//, tmp237,
	mov	w2, 237	//,
	adrp	x0, .LC16	// tmp238,
	add	x1, x0, :lo12:.LC16	//, tmp238,
	adrp	x0, .LC17	// tmp239,
	add	x0, x0, :lo12:.LC17	//, tmp239,
	bl	__assert_fail		//
.L57:
// LB_Relax.cpp:238:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp240,
	str	w0, [sp, 52]	// tmp240, i
// LB_Relax.cpp:238:     for (i = 1 ; i < thread_count; i++) {
	b	.L58		//
.L60:
// LB_Relax.cpp:239:         int createResult = pthread_create(&threads[i], 
	ldrsw	x0, [sp, 52]	// _50, i
// LB_Relax.cpp:239:         int createResult = pthread_create(&threads[i], 
	lsl	x0, x0, 3	// _51, _50,
// LB_Relax.cpp:239:         int createResult = pthread_create(&threads[i], 
	ldr	x1, [sp, 96]	// tmp241, threads
	add	x4, x1, x0	// _52, tmp241, _51
// LB_Relax.cpp:242:                                           (void*)i);
	ldrsw	x0, [sp, 52]	// _53, i
// LB_Relax.cpp:239:         int createResult = pthread_create(&threads[i], 
	mov	x3, x0	//, _54
	adrp	x0, _Z5runSBPv	// tmp242,
	add	x2, x0, :lo12:_Z5runSBPv	//, tmp242,
	mov	x1, 0	//,
	mov	x0, x4	//, _52
	bl	pthread_create		//
	str	w0, [sp, 76]	//, createResult
// LB_Relax.cpp:243:         assert(createResult == 0);
	ldr	w0, [sp, 76]	// tmp243, createResult
	cmp	w0, 0	// tmp243,
	beq	.L59		//,
// LB_Relax.cpp:243:         assert(createResult == 0);
	adrp	x0, .LC15	// tmp244,
	add	x3, x0, :lo12:.LC15	//, tmp244,
	mov	w2, 243	//,
	adrp	x0, .LC16	// tmp245,
	add	x1, x0, :lo12:.LC16	//, tmp245,
	adrp	x0, .LC18	// tmp246,
	add	x0, x0, :lo12:.LC18	//, tmp246,
	bl	__assert_fail		//
.L59:
// LB_Relax.cpp:238:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 52]	// tmp248, i
	add	w0, w0, 1	// tmp247, tmp248,
	str	w0, [sp, 52]	// tmp247, i
.L58:
// LB_Relax.cpp:238:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 52]	// tmp249, i
	ldr	w0, [sp, 56]	// tmp250, thread_count
	cmp	w1, w0	// tmp249, tmp250
	blt	.L60		//,
// LB_Relax.cpp:247:     long long int local = (long long int)runSB((void*)0);
	mov	x0, 0	//,
	bl	_Z5runSBPv		//
// LB_Relax.cpp:247:     long long int local = (long long int)runSB((void*)0);
	str	x0, [sp, 88]	// _56, local
// LB_Relax.cpp:248:     printf("local[0] = %lld\n", local);
	ldr	x0, [sp, 88]	// local.60_57, local
	mov	x1, x0	//, local.60_57
	adrp	x0, .LC19	// tmp251,
	add	x0, x0, :lo12:.LC19	//, tmp251,
	bl	printf		//
// LB_Relax.cpp:255:     for (i = 1 ; i < thread_count; i++) {
	mov	w0, 1	// tmp252,
	str	w0, [sp, 52]	// tmp252, i
// LB_Relax.cpp:255:     for (i = 1 ; i < thread_count; i++) {
	b	.L61		//
.L63:
// LB_Relax.cpp:256:         int joinResult = pthread_join(threads[i], 
	ldrsw	x0, [sp, 52]	// _58, i
// LB_Relax.cpp:256:         int joinResult = pthread_join(threads[i], 
	lsl	x0, x0, 3	// _59, _58,
	ldr	x1, [sp, 96]	// tmp253, threads
	add	x0, x1, x0	// _60, tmp253, _59
// LB_Relax.cpp:256:         int joinResult = pthread_join(threads[i], 
	ldr	x0, [x0]	// _61, *_60
	add	x1, sp, 88	// tmp254,,
	bl	pthread_join		//
	str	w0, [sp, 72]	// _121, joinResult
// LB_Relax.cpp:258:         assert(joinResult == 0);
	ldr	w0, [sp, 72]	// tmp255, joinResult
	cmp	w0, 0	// tmp255,
	beq	.L62		//,
// LB_Relax.cpp:258:         assert(joinResult == 0);
	adrp	x0, .LC15	// tmp256,
	add	x3, x0, :lo12:.LC15	//, tmp256,
	mov	w2, 258	//,
	adrp	x0, .LC16	// tmp257,
	add	x1, x0, :lo12:.LC16	//, tmp257,
	adrp	x0, .LC20	// tmp258,
	add	x0, x0, :lo12:.LC20	//, tmp258,
	bl	__assert_fail		//
.L62:
// LB_Relax.cpp:259:         printf("local[%d] = %lld\n", i, local);
	ldr	x0, [sp, 88]	// local.61_62, local
	mov	x2, x0	//, local.61_62
	ldr	w1, [sp, 52]	//, i
	adrp	x0, .LC21	// tmp259,
	add	x0, x0, :lo12:.LC21	//, tmp259,
	bl	printf		//
// LB_Relax.cpp:255:     for (i = 1 ; i < thread_count; i++) {
	ldr	w0, [sp, 52]	// tmp261, i
	add	w0, w0, 1	// tmp260, tmp261,
	str	w0, [sp, 52]	// tmp260, i
.L61:
// LB_Relax.cpp:255:     for (i = 1 ; i < thread_count; i++) {
	ldr	w1, [sp, 52]	// tmp262, i
	ldr	w0, [sp, 56]	// tmp263, thread_count
	cmp	w1, w0	// tmp262, tmp263
	blt	.L63		//,
// LB_Relax.cpp:262:     std::cout << "Validating..." << std::flush;
	adrp	x0, .LC22	// tmp264,
	add	x1, x0, :lo12:.LC22	//, tmp264,
	adrp	x0, :got:_ZSt4cout	// tmp265,
	ldr	x0, [x0, #:got_lo12:_ZSt4cout]	//, tmp265,
	bl	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc		//
	mov	x2, x0	// _63,
// LB_Relax.cpp:262:     std::cout << "Validating..." << std::flush;
	adrp	x0, :got:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_	// tmp266,
	ldr	x1, [x0, #:got_lo12:_ZSt5flushIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_]	//, tmp266,
	mov	x0, x2	//, _63
	bl	_ZNSolsEPFRSoS_E		//
// LB_Relax.cpp:263:     int res = check_output(t_range);
	ldr	w0, [sp, 64]	// t_range.62_64, t_range
	bl	_Z12check_outputj		//
	str	w0, [sp, 68]	// _115, res
// LB_Relax.cpp:265:         free(threads);
	ldr	x0, [sp, 96]	//, threads
	bl	free		//
// LB_Relax.cpp:266:     return 0;
	mov	w0, 0	// _118,
// LB_Relax.cpp:267: }
	mov	w1, w0	// <retval>, _118
	adrp	x0, :got:__stack_chk_guard	// tmp269,
	ldr	x0, [x0, #:got_lo12:__stack_chk_guard]	// tmp268, tmp269,
	ldr	x3, [sp, 104]	// tmp271, D.48682
	ldr	x2, [x0]	// tmp272,
	subs	x3, x3, x2	// tmp271, tmp272
	mov	x2, 0	// tmp272
	beq	.L65		//,
	bl	__stack_chk_fail		//
.L65:
	mov	w0, w1	//, <retval>
	ldp	x29, x30, [sp], 112	//,,,
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
// LB_Relax.cpp:267: }
	ldr	w0, [sp, 28]	// tmp92, __initialize_p
	cmp	w0, 1	// tmp92,
	bne	.L68		//,
// LB_Relax.cpp:267: }
	ldr	w1, [sp, 24]	// tmp93, __priority
	mov	w0, 65535	// tmp94,
	cmp	w1, w0	// tmp93, tmp94
	bne	.L68		//,
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
.L68:
// LB_Relax.cpp:267: }
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
// LB_Relax.cpp:267: }
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
