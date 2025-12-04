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

// Increased range for more randomness
#define RAND_RANGE 640  

// More iterations to capture rare events
#define DEF_RUNS 100000   
#define DEF_THREADS 4

// Structure with reduced alignment to encourage reordering
struct s_var
{
    alignas(64) unsigned int a;  // x in pseudocode - reduced alignment from 128
    alignas(64) unsigned int b;  // flag in pseudocode - reduced alignment from 128
};

struct r_cpu0
{
    alignas(64) unsigned int r0;  // reduced alignment from 128
};

struct r_gpu0
{
    alignas(64) unsigned int r0;  // reduced alignment from 128
};

pthread_barrier_t barrier;
volatile struct s_var* var;
volatile struct r_cpu0* cpu_res;
volatile struct r_gpu0* gpu_res;
volatile unsigned* cpu_rand;
volatile unsigned* gpu_rand;

// without volatile, simulator test works even if __thread support is broken
__thread volatile int local = 7;

// Random delay function with more variability
#pragma GCC optimize ("O0")
inline void random_delay(int max_cycles) {
    // More variability - sometimes large delays, sometimes very small
    int delay;
    if (rand() % 10 < 3) {
        // 30% chance of very small delay
        delay = rand() % 10;
    } else if (rand() % 10 < 1) {
        // 10% chance of very large delay
        delay = rand() % (max_cycles * 2) + max_cycles;
    } else {
        // Normal distribution
        delay = rand() % max_cycles;
    }
    
    volatile int dummy = 0;
    for (volatile int i = 0; i < delay; i++) {
        dummy++;
    }
}

#pragma GCC optimize ("O0")
void* runMP(void* arg)
{
    long long int tid = (long long int)arg;
    local += tid;
    pthread_barrier_wait(&barrier);
    
    if(tid / DEF_THREADS == 0)
    {
        // Thread 0 (Writer)
        for (int i = tid; i < DEF_RUNS; i+=DEF_THREADS)
        {
            // Initialize values
            var[i].a = 0;  // x = 0
            var[i].b = 0;  // flag = 0
            
            // Small delay after initialization
            random_delay(50);
            
            // Use atomic operations with relaxed ordering
            auto tmp_a = (std::atomic<int>*) &((var+i)->a);
            tmp_a->store(1, std::memory_order_relaxed);
            
            // Random delay
            random_delay(RAND_RANGE);
            
            // Store to b (flag) using atomic with relaxed ordering
            auto tmp_b = (std::atomic<int>*) &((var+i)->b);
            tmp_b->store(1, std::memory_order_relaxed);
        }
    }
    else 
    {
        // Thread 1 (Reader)
        for (int i = (tid % DEF_THREADS); i < DEF_RUNS; i+=DEF_THREADS)
        {
            // Random initial delay to increase variability in thread timing
            random_delay(RAND_RANGE / 2);
            
            // Load b (flag) using atomic with relaxed ordering
            auto tmp_b = (std::atomic<int>*) &((var+i)->b);
            (gpu_res+i)->r0 = tmp_b->load(std::memory_order_relaxed);
            // (gpu_res+i)->r0 = (var+i)->b;
            
            // Random delay
            random_delay(RAND_RANGE);
            
            // Load a (x) using atomic with relaxed ordering
            auto tmp_a = (std::atomic<int>*) &((var+i)->a);
            (cpu_res+i)->r0 = tmp_a->load(std::memory_order_relaxed);
            // (cpu_res+i)->r0 = (var+i)->a;
        }
    }
    
    return (void*)local;
}


int check_output(unsigned t_range)
{
    unsigned res_cpu0_gpu0 = 0;  // x=0, flag=0
    unsigned res_cpu1_gpu0 = 0;  // x=1, flag=0 (interesting/forbidden)
    unsigned res_cpu0_gpu1 = 0;  // x=0, flag=1
    unsigned res_cpu1_gpu1 = 0;  // x=1, flag=1
    unsigned res_cpu2_gpu2 = 0;  // other (initialization)
    
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

    std::cout << "Message Passing (MP) Litmus Test Results with RELAXED ORDERING:" << std::endl;
    std::cout << "1: x=0, flag=0: " << res_cpu0_gpu0 << " (" << (100.0 * res_cpu0_gpu0 / t_range) << "%)" << std::endl;
    std::cout << "2: x=1, flag=1: " << res_cpu1_gpu1 << " (" << (100.0 * res_cpu1_gpu1 / t_range) << "%)" << std::endl;
    std::cout << "3: x=1, flag=0: " << res_cpu1_gpu0 << " (" << (100.0 * res_cpu1_gpu0 / t_range) << "%)" << std::endl;
    std::cout << "4: x=0, flag=1: " << res_cpu0_gpu1 << " (" << (100.0 * res_cpu0_gpu1 / t_range) << "%)" << std::endl;
    std::cout << "Uninitialized: " << res_cpu2_gpu2 << std::endl;
    
    if (res_cpu1_gpu0 > 0) {
        std::cout << "=========================================================================" << std::endl;
        std::cout << "    FORBIDDEN BEHAVIOR OBSERVED: x=1, flag=0 in " << res_cpu1_gpu0 << " cases!" << std::endl;
        std::cout << "    This indicates memory ordering violations as expected with relaxed semantics" << std::endl;
        std::cout << "=========================================================================" << std::endl;
        return 2;
    } else {
        std::cout << "=========================================================================" << std::endl;
        std::cout << "    No forbidden behavior observed (x=1, flag=0)" << std::endl;
        std::cout << "    Even with relaxed semantics, no reordering was detected" << std::endl;
        std::cout << "=========================================================================" << std::endl;
        return 0;
    }
}



int main (int argc, char** argv)
{
    if (argc != 2) { 
        printf("usage: %s <thread_count>\n", argv[0]);
        exit(1);
    }
    int thread_count = atoi(argv[1]);

    printf("Starting %d threads for MP litmus test with RELAXED ordering...\n", thread_count);
    printf("This test is DESIGNED to expose the forbidden outcome (x=1, flag=0)\n");

    auto num_iterations = DEF_RUNS; 
    auto t_range = num_iterations;
    
    // Allocate memory normally (no misalignment)
    var = (struct s_var*)malloc(sizeof(struct s_var) * t_range);
    
    // Initialize shared vars
    for (auto i = 0; i < t_range; ++i) {
        var[i].a = 0;
        var[i].b = 0;
    }

    // Allocate output variables
    cpu_res = (struct r_cpu0*)malloc(sizeof(struct r_cpu0) * t_range);
    gpu_res = (struct r_gpu0*)malloc(sizeof(struct r_gpu0) * t_range);
    
    // Initialize results
    for (auto i = 0; i < t_range; ++i) {
        cpu_res[i].r0 = 2;
        gpu_res[i].r0 = 2;
    }

    // Allocate vectors for random numbers
    cpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);
    gpu_rand = (unsigned*)malloc(sizeof(unsigned) * t_range);

    // Generate random delay values with high variability
    for (int iter = 0; iter < num_iterations; iter++) {
        auto g_tid = iter;

        // CPU - more variability in delays
        unsigned rand_val = std::rand() % RAND_RANGE;
        if (std::rand() % 10 < 2) {  // 20% chance of very large delay
            rand_val = rand_val * 3;
        }
        cpu_rand[g_tid] = rand_val;

        // GPU - different distribution
        rand_val = std::rand() % RAND_RANGE;
        if (std::rand() % 10 < 1) {  // 10% chance of very small delay
            rand_val = rand_val / 10;
        }
        gpu_rand[g_tid] = rand_val;
    }

    std::cout << "Random delays generated with high variability (0-" << RAND_RANGE*3 << " cycles)" << std::endl;

    // Launch threads
    int i;
    pthread_t* threads = (pthread_t*)calloc(thread_count, sizeof(pthread_t));
    pthread_barrier_init(&barrier, NULL, (thread_count));
    assert(threads != NULL);
    
    for (i = 1 ; i < thread_count; i++) {
        int createResult = pthread_create(&threads[i], 
                                          NULL,
                                          runMP,
                                          (void*)i);
        assert(createResult == 0);
    }

    long long int local = (long long int)runMP((void*)0);
    printf("local[0] = %lld\n", local);
    
    // Join threads
    for (i = 1 ; i < thread_count; i++) {
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
    free((void*)cpu_res);
    free((void*)gpu_res);
    free((void*)cpu_rand);
    free((void*)gpu_rand);
    
    return 0;
}