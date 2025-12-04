/*
    m5threads, a pthread library for the M5 simulator
    Copyright (C) 2009, Stanford University

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Lesser General Public
    License as published by the Free Software Foundation; either
    version 2.1 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this library; if not, write to the Free Software
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307  USA
    
    
    
Litmus Test Developed by 

Sukarn Agarwal (Email: sagarwa2@ed.ac.uk)
Nicolai Oswald (Email: nicolai.oswald@ed.ac.uk)    
    
    
*/


#include <assert.h>
#include <pthread.h>
#include <stdio.h>
#include <stdlib.h>
#include <atomic>
#include <sys/time.h>
#include <iostream>

// Moderate range for better performance
#define RAND_RANGE 160

// Reduced iterations for faster runtime
#define DEF_RUNS 100000
#define DEF_THREADS 4

struct s_var
{
    alignas(128) unsigned int a;
    alignas(128) unsigned int b;
};

struct r_cpu0
{
    alignas(128) unsigned int r0;
};

struct r_gpu0
{
    alignas(128) unsigned int r0;
};


struct r_cpu1
{
    alignas(128) unsigned int r0;
};

struct r_gpu1
{
    alignas(128) unsigned int r0;
};






pthread_barrier_t barrier;
volatile struct s_var* var;
volatile struct r_cpu0* cpu_res0;
volatile struct r_gpu0* gpu_res0;
volatile struct r_cpu1* cpu_res1;
volatile struct r_gpu1* gpu_res1;
volatile unsigned* cpu_rand1;
volatile unsigned* gpu_rand1;
volatile unsigned* cpu_rand2;
volatile unsigned* gpu_rand2;


// without volatile, simulator test works even if __thread support is broken
__thread volatile int local = 7;

#pragma GCC optimize ("O0")
void* runIRIW(void* arg)
{
    long long int tid = (long long int)arg;
    local += tid;
    pthread_barrier_wait(&barrier);
   #pragma GCC push_options

    
if(tid / DEF_THREADS == 0)
{
	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	{
		//SET A
		
    		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
    		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
    		for (long long int j = 0; j < ((*(cpu_rand1+i))); j++);
	       auto tmp_a = (std::atomic<int>*) &((var+i)->a);
    		tmp_a->store(1, std::memory_order_seq_cst);
	}
}
else if (tid / DEF_THREADS == 1)
{
	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	{
		// Load AB
		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
    		(cpu_res0+i)->r0 = tmp_a->load(std::memory_order_seq_cst);
    		for (int j = 0; j < (*(gpu_rand1+i)); j++);
    		for (int j = 0; j < (*(gpu_rand1+i)); j++);
    		for (int j = 0; j < (*(gpu_rand1+i)); j++);
    		for (int j = 0; j < (*(gpu_rand1+i)); j++);
    		for (int j = 0; j < (*(gpu_rand1+i)); j++);
    		auto tmp_b = (std::atomic<int>*) &((var+i)->b); 
    		(gpu_res0+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
	}

}
else if (tid / DEF_THREADS == 2)
{
	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	{
		//SET B
		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
    		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
    		for (long long int j = 0; j < ((*(cpu_rand2+i))); j++);
    		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
    		tmp_b->store(1, std::memory_order_seq_cst);
	}
}
else
{
	for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
	{
		//LOAD BA
		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
		(gpu_res1+i)->r0 = tmp_b->load(std::memory_order_seq_cst);
		for (int j = 0; j < (*(gpu_rand2+i)); j++);
    		for (int j = 0; j < (*(gpu_rand2+i)); j++);
    		for (int j = 0; j < (*(gpu_rand2+i)); j++);
    		for (int j = 0; j < (*(gpu_rand2+i)); j++);
    		for (int j = 0; j < (*(gpu_rand2+i)); j++);
    		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
    		(cpu_res1+i)->r0 = tmp_a->load(std::memory_order_seq_cst);
	}	
}
#pragma GCC pop_options 
    
 
    //assert(local == count +id);
    return (void*)local;
}


int check_output(unsigned t_range)
{
    unsigned res_cpu0_gpu0 = 0;
    unsigned res_cpu1_gpu0 = 0;
    unsigned res_cpu0_gpu1 = 0;
    unsigned res_cpu1_gpu1 = 0;
    unsigned res_cpu2_gpu2 = 0;
    
    unsigned rst_cpu0_gpu0 = 0;
    unsigned rst_cpu1_gpu0 = 0;
    unsigned rst_cpu0_gpu1 = 0;
    unsigned rst_cpu1_gpu1 = 0;
    unsigned rst_cpu2_gpu2 = 0;
    int pass = 0;
    int failure = 0;
    
    for (auto i = 0; i < t_range; ++i) {
        if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
            res_cpu0_gpu0++;
        } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
            res_cpu1_gpu0++;
        } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
            res_cpu0_gpu1++;
        } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
            res_cpu1_gpu1++;
        }
        else{
            res_cpu2_gpu2++;
        }
   
        if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
            rst_cpu0_gpu0++;
        } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
            rst_cpu1_gpu0++;
        } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
            rst_cpu0_gpu1++;
        } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
            rst_cpu1_gpu1++;
        }
        else{
            rst_cpu2_gpu2++;
        }
        
        if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
    		failure++;
   	 }
        else
        {
        	pass++;
        }   
    }
    
     	std::cout << "Pass Test: " << pass << std::endl;
	std::cout << "Failure Test: " << failure << std::endl;
        if (failure != 0)
	{
		std::cout << "=========================================================================" << std::endl;
        	std::cout << "	\t CPU-Only IRIW-sys Allowed  \t " << std::endl;						
        	std::cout << "=========================================================================" << std::endl;  
	}
	else
	{
		std::cout << "=========================================================================" << std::endl;
        	std::cout << "	\t CPU-Only IRIW-sys Disallowed  \t " << std::endl;						
        	std::cout << "=========================================================================" << std::endl;  
	}

    if ((!res_cpu1_gpu0) && (!rst_cpu0_gpu1)) {
        std::cout << "Success!" << std::endl;
        std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
        std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
        std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
        std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
        std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl; 
        std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
        std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
        std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
        std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
        std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
        //cout << "Num Valid test: " << successes << endl;
        //cout << "Num Invalid test: " << failures << endl;
        return 0;
    } else {
        std::cout << "Fail!" << std::endl;
        std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
        std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
        std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
        std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
        std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
        std::cout << "Count (a:0 and b:0): " << rst_cpu0_gpu0 << std::endl;
        std::cout << "Count (a:1 and b:0): " << rst_cpu1_gpu0 << std::endl;
        std::cout << "Count (a:0 and b:1): " << rst_cpu0_gpu1 << std::endl;
        std::cout << "Count (a:1 and b:1): " << rst_cpu1_gpu1 << std::endl;
        std::cout << "Count (r0:2 and r1:2): " << rst_cpu2_gpu2 << std::endl;
        //cout << "Num Valid test: " << successes << endl;
        //cout << "Num Invalid test: " << failures << endl;
        return 2;
    }

}



int main (int argc, char** argv)
{
    if (argc != 2) { 
        printf("usage: %s <thread_count>\n", argv[0]);
        exit(1);
    }
    int thread_count = atoi(argv[1]);

    printf("Starting %d threads...\n", thread_count);

auto num_iterations = DEF_RUNS; 

auto t_range = num_iterations;
    // Allocate shared variables
   var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
    // Initialize shared vars
    for (auto i = 0; i < t_range; ++i) {
        var[i].a = 0;
        var[i].b = 0;
    }

    // Allocate output variables for cpu
   cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
    // Initialize cpu result
    for (auto i = 0; i < t_range; ++i) {
        cpu_res0[i].r0 = 2;
    }

    // Allocate output variables for gpu
    gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
    // Initialize gpu result
    for (auto i = 0; i < t_range; ++i) {
        gpu_res0[i].r0 = 2;
    }

    cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
    // Initialize cpu result
    for (auto i = 0; i < t_range; ++i) {
        cpu_res1[i].r0 = 2;
    }

    // Allocate output variables for gpu
    gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
    // Initialize gpu result
    for (auto i = 0; i < t_range; ++i) {
        gpu_res1[i].r0 = 2;
    }



    // Number of CPU threads == GPU threads
    // Allocate vectors for random numbers
    // Genreating random delays
   cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
   gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
   cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
   gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);

for (int iter = 0; iter < num_iterations; iter++) {
           // Generate random time offset value
            auto g_tid = iter;

            // CPU
            unsigned rand_val = std::rand() % RAND_RANGE;
            //std::cout << "CPU_T:" << i << " Rand: " << rand_val << std::endl;
            cpu_rand1[g_tid] = rand_val;

            //GPU
            rand_val = std::rand() % RAND_RANGE;
            //std::cout << "GPU_T:" << i << " Rand: " << rand_val << std::endl;
            gpu_rand1[g_tid] = rand_val;
            
            
            rand_val = std::rand() % RAND_RANGE;
            //std::cout << "CPU_T:" << i << " Rand: " << rand_val << std::endl;
            cpu_rand2[g_tid] = rand_val;

            //GPU
            rand_val = std::rand() % RAND_RANGE;
            //std::cout << "GPU_T:" << i << " Rand: " << rand_val << std::endl;
            gpu_rand2[g_tid] = rand_val;
    }

    std::cout << "Random thread launch delays generated" << std::endl;
/////////////////////////////////////////////////////////////////////////////////////
///			CPU Thread Launch Section 				    ///
////////////////////////////////////////////////////////////////////////////////////
    int i;
    pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
    pthread_barrier_init(&barrier, NULL, (thread_count));
    assert(threads != NULL);
    for (i = 1 ; i < thread_count; i++) {
        int createResult = pthread_create(&threads[i], 
                                          NULL,
                                          runIRIW,
                                          (void*)i);
        assert(createResult == 0);
    }

    long long int local = (long long int)runIRIW((void*)0);
    printf("local[0] = %lld\n", local);
      
///////////////////////////////////////////////////////////////////////    
////////////////////////////////////////////////////////////////////////
///		Join CPU Threads				       ///
///////////////////////////////////////////////////////////////////////

    for (i = 1 ; i < thread_count; i++) {
        int joinResult = pthread_join(threads[i], 
                                      (void**)&local);
        assert(joinResult == 0);
        printf("local[%d] = %lld\n", i, local);
    }
///////////////////////////////////////////////////////////////////////    
    std::cout << "Validating..." << std::flush;
    int res = check_output(t_range);
    
        //pthread_barrier_destroy(&barrier);
        free(threads);
    
    return 0;
}