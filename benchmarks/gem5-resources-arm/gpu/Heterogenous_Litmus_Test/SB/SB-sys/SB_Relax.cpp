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
#include "hip/hip_runtime.h"
#include "hip/hcc_detail/hip_atomic.h"


#define RAND_RANGE 20

#define DEF_RUNS 2048    // Specifies the default number of runs
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


pthread_barrier_t barrier;
 struct s_var* var;
volatile struct r_cpu0* cpu_res;
volatile struct r_gpu0* gpu_res;
volatile unsigned* cpu_rand;
volatile unsigned* gpu_rand;


// without volatile, simulator test works even if __thread support is broken
__thread volatile int local = 7;

void* runSB(void* arg)
{
    long long int tid = (long long int)arg;
    local += tid;
   pthread_barrier_wait(&barrier);
#pragma GCC push_options
#pragma GCC optimize ("O0")
	for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
	{
		auto tmp_a = (std::atomic<int>*) &((var+i)->a);
    		tmp_a->store(1, std::memory_order_relaxed);
    		auto tmp_b = (std::atomic<int>*) &((var+i)->b);
    		(gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);	
	}
#pragma GCC pop_options 
    return (void*)local;
}

template <typename T>
__device__ void 
storeb_loada(T* delay,  struct s_var* var, volatile struct r_cpu0* res1)
{
#pragma GCC push_options
#pragma GCC optimize ("O0")
   for (int j = 0; j < (*delay); j++);		
   for (int j = 0; j < (*delay); j++);
    var->b  = 1; 
   for (int j = 0; j < (*delay); j++);
    res1->r0 = var->a;
#pragma GCC pop_options 
}


template <typename T>
__global__ void
SB1(T* gpu_rand,  struct s_var* var, volatile struct r_cpu0* cpu_res, unsigned N)
{
     
    int i = (hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x);
#pragma GCC push_options
#pragma GCC optimize ("O0") 
    	if(i < N) {
    		storeb_loada(&gpu_rand[i], (var + (i)), &cpu_res[i]);		
    	}
#pragma GCC pop_options        	
}


void* LaunchGPU(void * arg)
{
	long long int tid = (long long int)arg;
        local += tid;
	unsigned blocks = DEF_RUNS;
        unsigned threadsPerBlock = 1;
         hipLaunchKernelGGL(SB1, dim3(blocks), dim3(threadsPerBlock), 0, 0,
            gpu_rand,
            var,
            cpu_res, DEF_RUNS);
            #pragma GCC push_options 	
            return (void*)local;        
}





int check_output(unsigned t_range)
{
    unsigned res_cpu0_gpu0 = 0;
    unsigned res_cpu1_gpu0 = 0;
    unsigned res_cpu0_gpu1 = 0;
    unsigned res_cpu1_gpu1 = 0;
    unsigned res_cpu2_gpu2 = 0;
    for (auto i = 0; i < t_range; ++i) {
        if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 0)) {
            res_cpu0_gpu0++;
        } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 0)) {
            res_cpu1_gpu0++;
        } else if ((cpu_res[i].r0 == 0) && (gpu_res[i].r0 == 1)) {
            res_cpu0_gpu1++;
        } else if ((cpu_res[i].r0 == 1) && (gpu_res[i].r0 == 1)) {
            res_cpu1_gpu1++;
        }
        else{
            res_cpu2_gpu2++;
        }
    }

    if (!res_cpu0_gpu0) {
        std::cout << "Success!" << std::endl;
        std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
        std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
        std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
        std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
        std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
        std::cout << "Num Valid test: " << (t_range - res_cpu0_gpu0) << std::endl;
        std::cout << "Num Invalid test: " << res_cpu0_gpu0 << std::endl;
        std::cout << "=========================================================================" << std::endl;
        std::cout << "	\t Compound SB-sys Disallowed  \t " << std::endl;						
        std::cout << "=========================================================================" << std::endl; 
        return 0;
    } else {
        std::cout << "Fail!" << std::endl;
        std::cout << "Count (a:0 and b:0): " << res_cpu0_gpu0 << std::endl;
        std::cout << "Count (a:1 and b:0): " << res_cpu1_gpu0 << std::endl;
        std::cout << "Count (a:0 and b:1): " << res_cpu0_gpu1 << std::endl;
        std::cout << "Count (a:1 and b:1): " << res_cpu1_gpu1 << std::endl;
        std::cout << "Count (r0:2 and r1:2): " << res_cpu2_gpu2 << std::endl;
        std::cout << "Num Valid test: " << (t_range - res_cpu0_gpu0) << std::endl;
        std::cout << "Num Invalid test: " << res_cpu0_gpu0 << std::endl;
        std::cout << "=========================================================================" << std::endl;
        std::cout << "	\t Compound SB-sys Allowed  \t " << std::endl;						
        std::cout << "=========================================================================" << std::endl; 
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
   cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
    // Initialize cpu result
    for (auto i = 0; i < t_range; ++i) {
        cpu_res[i].r0 = 2;
    }

    // Allocate output variables for gpu
    gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
    // Initialize gpu result
    for (auto i = 0; i < t_range; ++i) {
        gpu_res[i].r0 = 2;
    }

    // Number of CPU threads == GPU threads
    // Allocate vectors for random numbers
   cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);

   gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);


for (int iter = 0; iter < num_iterations; iter++) {
           // Generate random time offset value
            auto g_tid = iter;

            // CPU
            unsigned rand_val = std::rand() % RAND_RANGE;
            //std::cout << "CPU_T:" << i << " Rand: " << rand_val << std::endl;
            cpu_rand[g_tid] = rand_val;

            //GPU
            rand_val = std::rand() % RAND_RANGE;
            //std::cout << "GPU_T:" << i << " Rand: " << rand_val << std::endl;
            gpu_rand[g_tid] = rand_val;
    }

    std::cout << "Random thread launch delays generated" << std::endl;


    int i;
    pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
    
    
    //=============================================================
    //		Intialize the barrier
    //============================================================
        pthread_barrier_init(&barrier, NULL, (thread_count)); // +1 for the GPU kernel launch
        
    //=============================================================    
    assert(threads != NULL);




/////////////////////////////////////////////////////////////////////////////////////

/////////////////////////////////////////////////////////////////////////////////////
///			GPU Section 						    ///
////////////////////////////////////////////////////////////////////////////////////
    long long int gpu_local = (long long int) LaunchGPU((void*)100);
    printf("local[0] = %lld\n", gpu_local);
    std::cout << "GPU Threads Launched" << std::endl;
 /////////////////////////////////////////////////////////////////////////////////////   


/////////////////////////////////////////////////////////////////////////////////////
///			CPU Section 						    ///
////////////////////////////////////////////////////////////////////////////////////
    for (i = 0 ; i < thread_count; i++) {
        int createResult = pthread_create(&threads[i], 
                                          NULL,
                                          runSB,
                                          (void*)i);
        assert(createResult == 0);
    }


   std::cout << "CPU Threads Launched" << std::endl;
                       
	std::cout << "All threads executing" << std::endl;
        #pragma GCC push_options
#pragma GCC optimize ("O0")	   
        for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                 for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                 for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
                for (long unsigned j = 0; j < 500000; j++);
		#pragma GCC pop_options
		

    

////////////////////////////////////////////////////////////////////////
///		Join GPU Threads				       ///
///////////////////////////////////////////////////////////////////////

    hipDeviceSynchronize();
///////////////////////////////////////////////////////////////////////    
////////////////////////////////////////////////////////////////////////
///		Join CPU Threads				       ///
///////////////////////////////////////////////////////////////////////	
	
    for (i = 0 ; i < thread_count; i++) {
        int joinResult = pthread_join(threads[i], 
                                      (void**)&local);
        assert(joinResult == 0);
        printf("local[%d] = %lld\n", i, local);
    }
////////////////////////////////////////////////////////////////////////        
    
    std::cout << "Validating..." << std::flush;
    int res = check_output(t_range);
        free(threads);
    return 0;
}
