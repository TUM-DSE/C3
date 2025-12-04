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

// Increased randomness range for more variability
#define RAND_RANGE 800  

// More iterations to capture rare events
#define DEF_RUNS 100000
#define DEF_THREADS 4

// Structure with reduced alignment to encourage reordering
struct s_var
{
    alignas(64) unsigned int a;  // reduced alignment from 128
    alignas(64) unsigned int b;  // reduced alignment from 128
};

struct r_cpu0
{
    alignas(64) unsigned int r0;
};

struct r_gpu0
{
    alignas(64) unsigned int r0;
};


struct r_cpu1
{
    alignas(64) unsigned int r0;
};

struct r_gpu1
{
    alignas(64) unsigned int r0;
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

// Random delay function with more variability
#pragma GCC optimize ("O0")
inline void random_delay(int max_cycles) {
    int delay;
    
    // 20% chance of very small delay
    if (rand() % 10 < 2) {
        delay = rand() % 5;
    } 
    // 10% chance of very large delay
    else if (rand() % 10 < 1) {
        delay = rand() % (max_cycles * 2) + max_cycles;
    }
    // Normal distribution
    else {
        delay = rand() % max_cycles;
    }
    
    volatile int dummy = 0;
    for (volatile int i = 0; i < delay; i++) {
        dummy++;
    }
}

#pragma GCC optimize ("O0")
void* runIRIW(void* arg)
{
    long long int tid = (long long int)arg;
    local += tid;
    pthread_barrier_wait(&barrier);
    
    if(tid / DEF_THREADS == 0)
    {
        // Thread 0: Write a=1
        for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
        {
            // Initialize values for this iteration
            var[i].a = 0;
            var[i].b = 0;
            
            // Ensure initialization is visible to other threads
            std::atomic_thread_fence(std::memory_order_release);

            
            // Small delay after initialization
            random_delay(RAND_RANGE);
            
            // Write a=1 using atomic with relaxed ordering
            auto tmp_a = (std::atomic<int>*) &((var+i)->a);
            tmp_a->store(1, std::memory_order_relaxed);
        }
    }
    else if (tid / DEF_THREADS == 1)
    {
        std::atomic_thread_fence(std::memory_order_acquire);

        // Thread 1: Read a, then read b
        for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
        {
            // Random delay before first read
            random_delay(RAND_RANGE);
            
            // First read a using atomic with relaxed ordering
            auto tmp_a = (std::atomic<int>*) &((var+i)->a);
            (cpu_res0+i)->r0 = tmp_a->load(std::memory_order_relaxed);
            // (cpu_res0+i)->r0 = (var+i)->a;
            
            // Variable delay between reads
            random_delay(RAND_RANGE);
            
            // Then read b using atomic with relaxed ordering
            auto tmp_b = (std::atomic<int>*) &((var+i)->b);
            (gpu_res0+i)->r0 = tmp_b->load(std::memory_order_relaxed);
            // (gpu_res0+i)->r0 = (var+i)->b;
        }
    }
    else if (tid / DEF_THREADS == 2)
    {
        // Thread 2: Write b=1
        for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
        {
            std::atomic_thread_fence(std::memory_order_release);

            // Random delay before write
            random_delay(RAND_RANGE);
            
            // Write b=1 using atomic with relaxed ordering
            auto tmp_b = (std::atomic<int>*) &((var+i)->b);
            tmp_b->store(1, std::memory_order_relaxed);
        }
    }
    else
    {
        std::atomic_thread_fence(std::memory_order_acquire);

        // Thread 3: Read b, then read a
        for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
        {
            // Random delay before first read
            random_delay(RAND_RANGE);
            
            // First read b using atomic with relaxed ordering
            auto tmp_b = (std::atomic<int>*) &((var+i)->b);
            (gpu_res1+i)->r0 = tmp_b->load(std::memory_order_relaxed);
            // (gpu_res1+i)->r0 = (var+i)->b;
            
            // Variable delay between reads
            random_delay(RAND_RANGE);
            
            // Then read a using atomic with relaxed ordering
            auto tmp_a = (std::atomic<int>*) &((var+i)->a);
            (cpu_res1+i)->r0 = tmp_a->load(std::memory_order_relaxed);
            // (cpu_res1+i)->r0 = (var+i)->a;
        }
    }
    
    return (void*)local;
}


int check_output(unsigned t_range)
{
    unsigned res_cpu0_gpu0 = 0;  // Thread 1: a=0, b=0
    unsigned res_cpu1_gpu0 = 0;  // Thread 1: a=1, b=0
    unsigned res_cpu0_gpu1 = 0;  // Thread 1: a=0, b=1
    unsigned res_cpu1_gpu1 = 0;  // Thread 1: a=1, b=1
    unsigned res_cpu2_gpu2 = 0;  // Thread 1: other (initialized)
    
    unsigned rst_cpu0_gpu0 = 0;  // Thread 3: a=0, b=0
    unsigned rst_cpu1_gpu0 = 0;  // Thread 3: a=1, b=0
    unsigned rst_cpu0_gpu1 = 0;  // Thread 3: a=0, b=1
    unsigned rst_cpu1_gpu1 = 0;  // Thread 3: a=1, b=1
    unsigned rst_cpu2_gpu2 = 0;  // Thread 3: other (initialized)
    
    // Count of forbidden outcome
    int forbidden_outcomes = 0;
    
    for (auto i = 0; i < t_range; ++i) {
        // Thread 1 results
        if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 0)) {
            res_cpu0_gpu0++;
        } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0)) {
            res_cpu1_gpu0++;
        } else if ((cpu_res0[i].r0 == 0) && (gpu_res0[i].r0 == 1)) {
            res_cpu0_gpu1++;
        } else if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 1)) {
            res_cpu1_gpu1++;
        } else {
            res_cpu2_gpu2++;
        }
   
        // Thread 3 results
        if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 0)) {
            rst_cpu0_gpu0++;
        } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 0)) {
            rst_cpu1_gpu0++;
        } else if ((cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
            rst_cpu0_gpu1++;
        } else if ((cpu_res1[i].r0 == 1) && (gpu_res1[i].r0 == 1)) {
            rst_cpu1_gpu1++;
        } else {
            rst_cpu2_gpu2++;
        }
        
        // Check for forbidden outcome:
        // Thread 1 sees a=1, b=0 (read a first, didn't see b updated)
        // Thread 3 sees b=1, a=0 (read b first, didn't see a updated)
        if ((cpu_res0[i].r0 == 1) && (gpu_res0[i].r0 == 0) && 
            (cpu_res1[i].r0 == 0) && (gpu_res1[i].r0 == 1)) {
            forbidden_outcomes++;
        }
    }
    
    // Print detailed results
    std::cout << "\nIndependent Reads of Independent Writes (IRIW) Litmus Test Results:" << std::endl;
    std::cout << "------------------------------------------------------------------" << std::endl;
    std::cout << "Thread 1 (Read a, then Read b) Observations:" << std::endl;
    std::cout << "  a=0, b=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
    std::cout << "  a=1, b=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
    std::cout << "  a=0, b=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
    std::cout << "  a=1, b=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
    std::cout << "  Other: " << res_cpu2_gpu2 << std::endl;
    
    std::cout << "\nThread 3 (Read b, then Read a) Observations:" << std::endl;
    std::cout << "  a=0, b=0: " << rst_cpu0_gpu0 << " (" << (100.0 * rst_cpu0_gpu0 / t_range) << "%)" << std::endl;
    std::cout << "  a=1, b=0: " << rst_cpu1_gpu0 << " (" << (100.0 * rst_cpu1_gpu0 / t_range) << "%)" << std::endl;
    std::cout << "  a=0, b=1: " << rst_cpu0_gpu1 << " (" << (100.0 * rst_cpu0_gpu1 / t_range) << "%)" << std::endl;
    std::cout << "  a=1, b=1: " << rst_cpu1_gpu1 << " (" << (100.0 * rst_cpu1_gpu1 / t_range) << "%)" << std::endl;
    std::cout << "  Other: " << rst_cpu2_gpu2 << std::endl;
    
    // Report the forbidden outcome results
    std::cout << "\nForbidden Outcome Analysis:" << std::endl;
    std::cout << "  Iterations: " << t_range << std::endl;
    std::cout << "  Forbidden outcomes: " << forbidden_outcomes << " (" << (100.0 * forbidden_outcomes / t_range) << "%)" << std::endl;
    
    if (forbidden_outcomes > 0) {
        std::cout << "=========================================================================" << std::endl;
        std::cout << "    FORBIDDEN BEHAVIOR OBSERVED IN " << forbidden_outcomes << " CASES!" << std::endl;
        std::cout << "    This indicates non-sequentially consistent memory ordering" << std::endl;
        std::cout << "    Thread 1 saw: a=1, b=0 while Thread 3 saw: b=1, a=0" << std::endl;
        std::cout << "=========================================================================" << std::endl;
        return 2;  // Forbidden outcome observed
    } else {
        std::cout << "=========================================================================" << std::endl;
        std::cout << "    No forbidden behavior observed" << std::endl;
        std::cout << "    Memory operations appear to be sequentially consistent" << std::endl;
        std::cout << "=========================================================================" << std::endl;
        return 0;  // No forbidden outcome observed
    }
}

int main (int argc, char** argv)
{
    if (argc != 2) { 
        printf("usage: %s <thread_count>\n", argv[0]);
        exit(1);
    }
    int thread_count = atoi(argv[1]);

    printf("Starting %d threads for IRIW litmus test...\n", thread_count);
    printf("This test is DESIGNED to expose the forbidden outcome where different threads\n");
    printf("observe operations in different orders (non-sequentially consistent behavior)\n");

    auto num_iterations = DEF_RUNS; 
    auto t_range = num_iterations;
    
    // Allocate shared variables
    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
    
    // Initialize shared vars
    for (auto i = 0; i < t_range; ++i) {
        var[i].a = 0;
        var[i].b = 0;
    }

    // Allocate and initialize result variables
    cpu_res0 = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
    gpu_res0 = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
    cpu_res1 = (struct r_cpu1*)malloc(sizeof(struct r_cpu1) * t_range);
    gpu_res1 = (struct r_gpu1*)malloc(sizeof(struct r_gpu1) * t_range);
    
    for (auto i = 0; i < t_range; ++i) {
        cpu_res0[i].r0 = 2;
        gpu_res0[i].r0 = 2;
        cpu_res1[i].r0 = 2;
        gpu_res1[i].r0 = 2;
    }

    // Allocate random delay arrays
    cpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
    gpu_rand1 = (unsigned*)malloc(sizeof(unsigned) * t_range);
    cpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);
    gpu_rand2 = (unsigned*)malloc(sizeof(unsigned) * t_range);

    // Generate random delays with high variability
    for (int iter = 0; iter < num_iterations; iter++) {
        // CPU Thread 1
        unsigned rand_val = std::rand() % RAND_RANGE;
        if (std::rand() % 10 < 2) {  // 20% chance of small delay
            rand_val = rand_val / 10;
        }
        cpu_rand1[iter] = rand_val;

        // GPU Thread 1
        rand_val = std::rand() % RAND_RANGE;
        if (std::rand() % 10 < 1) {  // 10% chance of large delay
            rand_val = rand_val * 2;
        }
        gpu_rand1[iter] = rand_val;
        
        // CPU Thread 2
        rand_val = std::rand() % RAND_RANGE;
        if (std::rand() % 10 < 3) {  // 30% chance of small delay
            rand_val = rand_val / 8;
        }
        cpu_rand2[iter] = rand_val;

        // GPU Thread 2
        rand_val = std::rand() % RAND_RANGE;
        if (std::rand() % 10 < 2) {  // 20% chance of large delay
            rand_val = rand_val * 3;
        }
        gpu_rand2[iter] = rand_val;
    }

    std::cout << "Random delays generated with high variability" << std::endl;

    // Launch threads
    pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
    pthread_barrier_init(&barrier, NULL, (thread_count));
    assert(threads != NULL);
    
    for (int i = 1; i < thread_count; i++) {
        int createResult = pthread_create(&threads[i], 
                                          NULL,
                                          runIRIW,
                                          (void*)i);
        assert(createResult == 0);
    }

    long long int local = (long long int)runIRIW((void*)0);
    printf("local[0] = %lld\n", local);
      
    // Join threads
    for (int i = 1; i < thread_count; i++) {
        int joinResult = pthread_join(threads[i], 
                                      (void**)&local);
        assert(joinResult == 0);
        printf("local[%d] = %lld\n", i, local);
    }
    
    // Check results
    std::cout << "Validating..." << std::endl;
    int res = check_output(t_range);
    
    // Free memory
    free(threads);
    free((void*)var);
    free((void*)cpu_res0);
    free((void*)gpu_res0);
    free((void*)cpu_res1);
    free((void*)gpu_res1);
    free((void*)cpu_rand1);
    free((void*)gpu_rand1);
    free((void*)cpu_rand2);
    free((void*)gpu_rand2);
    
    return 0;
}