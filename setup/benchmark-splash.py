import asyncio
from pathlib import Path
import subprocess
import sys
import os
import argparse

# Set up argument parsing with clear argument definitions
parser = argparse.ArgumentParser(description='Run SPLASH benchmarks with configurable parameters')
parser.add_argument("config", help="Configuration name")
parser.add_argument("gem5_path", help="Path to gem5 executable")
parser.add_argument("--unique-suffix", help="Unique suffix for output directory")
parser.add_argument("--remote-latency", type=int, default=10, help="Remote latency value")
args = parser.parse_args()
remote_latency = args.remote_latency
config = args.config
gem5 = args.gem5_path
unique_suffix = args.unique_suffix

main_dir = "Splash-4"
cores = 8

async def run(benchmark, redirect=True):
    print(f"Running {benchmark['name']} with {config}")
    
    # Create the unique output directory path
    base_dir = f"/output/HPCA-OLD/X86/splash/{benchmark['name']}/"
    if unique_suffix:
        output_dir = f"{base_dir}{config}_{unique_suffix}"
    else:
        output_dir = f"{base_dir}{config}"
    
    Path(output_dir).mkdir(parents=True, exist_ok=True)
    
    # Handle benchmarks with input files differently
    if 'input' in benchmark:
        if len(benchmark['cmd']) == 2:
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real-withL2private.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_UMA.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_NUMA.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            #  cmd_shell = f"{gem5} --debug-flags=RubySlicc --debug-file=trace-1.out --debug-start=11083606000 -r -e --outdir={output_dir} /setup/directory/generated/setup-real_UMA_three_level.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            #  cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_UMA_three_level.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            #  cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_NUMA_three_level.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
             cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real-hetero-mcm.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            #  cmd_shell = f"{gem5} --debug-flags=ProtocolTrace --debug-flags=RubySlicc --debug-file=trace-1.out -r -e --outdir={output_dir} /setup/directory/generated/setup-real-hetero-mcm.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            #  cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup.py -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} --debug-flags=ProtocolTrace --debug-file=ruby_trace-1.out -r -e --outdir={output_dir} /setup/directory/generated/setup-real.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} --debug-flags=ProtocolTrace --debug-file=ruby_trace.out.gz -r -e --outdir={output_dir} /setup/directory/generated/setup-real.py -c {benchmark['cores']} -ro {benchmark['cmd'][0]} {benchmark['cmd'][1]} < {benchmark['input']}"
        else: 
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real-withL2private.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_UMA.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_NUMA.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_UMA_three_level.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real_NUMA_three_level.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} --debug-flags=RubySlicc --debug-file=trace-2.out --debug-start=9083606000 -r -e --outdir={output_dir} /setup/directory/generated/setup-real_UMA_three_level.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup-real-hetero-mcm.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} --debug-flags=ProtocolTrace --debug-flags=RubySlicc --debug-file=trace-1.out -r -e --outdir={output_dir} /setup/directory/generated/setup-real-hetero-mcm.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} -r -e --outdir={output_dir} /setup/directory/generated/setup.py -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            #  cmd_shell = f"{gem5} --debug-flags=ProtocolTrace --debug-file=ruby_trace-1.out -r -e --outdir={output_dir} /setup/directory/generated/setup-real.py --remote-latency {str(remote_latency)} -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"
            # cmd_shell = f"{gem5} --debug-flags=ProtocolTrace --debug-file=ruby_trace.out.gz -r -e --outdir={output_dir} /setup/directory/generated/setup-real.py -c {benchmark['cores']} -ro {benchmark['cmd'][0]} < {benchmark['input']}"

        
        print(f"Command Line with Input: {cmd_shell}")
        try:
            process = await asyncio.create_subprocess_shell(
                cmd_shell, cwd=benchmark["dir"]
            )
        except Exception as e:
            print(f"Running {benchmark['name']} with {config} failed: {e}")
            return None
    else:
        cmd_exec = [
            gem5,
    #   "--debug-flags=ProtocolTrace",
    #    "--debug-flags=RubySlicc",
    #    "--debug-file=trace-1.out",
    #    "--debug-start=11083606000",
#       "--debug-flags=ProtocolTrace",
#        "--debug-file=trace.gz",
            "-r", "-e",
            f"--outdir={output_dir}",
            # f"/setup/directory/generated/setup-real_UMA.py",
            # f"/setup/directory/generated/setup-real.py",
            # f"/setup/directory/generated/setup-real-withL2private.py",
            # f"/setup/directory/generated/setup-real_NUMA.py",
            # f"/setup/directory/generated/setup-real_UMA_three_level.py",
            # f"/setup/directory/generated/setup-real_NUMA_three_level.py",
            # f"/setup/directory/generated/setup.py",
            f"/setup/directory/generated/setup-real-hetero-mcm.py",
            "--remote-latency", str(remote_latency),
            "-c", str(benchmark['cores']),
            "-ro", *benchmark['cmd']
        ]
        
        print(f"Command Line: {' '.join(cmd_exec)}")
        try:
            process = await asyncio.create_subprocess_exec(
                *cmd_exec,
                cwd=benchmark["dir"]
            )
        except Exception as e:
            print(f"Running {benchmark['name']} with {config} failed: {e}")
            return None

    exit_code = await process.wait()
    if exit_code != 0:
        print(f"Running {benchmark['name']} with {config} failed with exit_code {exit_code}")
        return None 
    print(f"Running {benchmark['name']} with {config} succeeded")   
    return output_dir


async def run_all(benchmarks, parallel=True):
    if parallel:
        tasks = [run(benchmark, redirect=True) for benchmark in benchmarks]
        await asyncio.gather(*tasks)
    else:
        for benchmark in benchmarks:
            await run(benchmark, redirect=False)

benchmarks = [

          { 
        "name": "barnes",
        "cores": 12,
        "dir": f"/benchmarks/{main_dir}/Splash-4/barnes/",
        "input": "inputs/n16384-p8", 
        "cmd": ["BARNES"]
    },
    { 
        "name": "radix",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/radix/",
        "cmd": ["RADIX", "-p8", "-n200000"]
    },
    { 
        "name": "ocean-ncont",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/ocean-non_contiguous_partitions/",
        "cmd": ["OCEAN-NOCONT", "-p8", "-n130"]
    },
    { 
        "name": "volrend",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/volrend/",
        "cmd": ["VOLREND", "8", "inputs/head-scaleddown4", "2"]
    },
    { 
        "name": "volrend-npl",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/volrend-no_print_lock/",
        "cmd": ["VOLREND-NPL", "8", "inputs/head-scaleddown4", "2"]
    },
        { 
        "name": "water-nsquared",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/water-nsquared/",
        "input": "inputs/n512-p8", 
        "cmd": ["WATER-NSQUARED"]
    },
        { 
        "name": "lu-ncont",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/lu-non_contiguous_blocks/",
        "cmd": ["LU-NOCONT", "-p8", "-n256"]
    },
    { 
        "name": "lu-cont",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/lu-contiguous_blocks/",
        "cmd": ["LU-CONT", "-p8", "-n256"]
     },
    { 
        "name": "water-spatial",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/water-spatial/",
        "input": "inputs/n512-p8", 
        "cmd": ["WATER-SPATIAL"]
    }, 
       {
        "name": "raytrace",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/raytrace/",
        "cmd": ["RAYTRACE", "-p8", "-m34", "inputs/teapot.env"]
    },
    { 
        "name": "fft",
        "cores": 12,
        "dir": "/benchmarks/Splash-4/Splash-4/fft/",
        "cmd": ["FFT", "-p8", "-m16"]
    },

    {   
        "name": "cholesky",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/cholesky/",
        "input": "inputs/tk14.O",
        "cmd": ["CHOLESKY", "-p8"]
    },
        {
        "name": "fmm",
        "cores": 12,
        "dir": "/benchmarks/Splash-4/Splash-4/fmm/",
        "input": "fmm.8.2048", 
        "cmd": ["FMM"]
    },
        {
        "name": "radiosity",
        "cores": 14,
        "dir": "/benchmarks/Splash-4/Splash-4/radiosity/",
        "cmd": ["RADIOSITY", "-p", "8", "-ae", "100", "-bf", "0.1", "-en", "0.05","-room","-batch"]
    },
    # NO INCLUDED IN HPCA
    # { 
    #     "name": "ocean-cont",
    #     "cores": cores,
    #     "dir": "/benchmarks/Splash-4/Splash-4/ocean-contiguous_partitions/",
    #     "cmd": ["OCEAN-CONT", "-p8", "-n130"]
    # },

]
# Esegui tutti i benchmark
asyncio.run(run_all(benchmarks, parallel=True))
try:
    subprocess.run(["python3", "extract_stats-splash.py"], check=True)
    print("File CSV generated correctly.")
except subprocess.CalledProcessError as e:
    print(f"Error during CSV generation: {e}")

"""
#,
    {
        "name": "radix",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/radix/",
        "cmd": ["RADIX", "-p8", "-n200000"]
    },
          {
        "name": "barnes",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/barnes/",
        "input": "inputs/n16384-p8", 
        "cmd": ["BARNES"]
    },
    {
        "name": "ocean-ncont",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/ocean-non_contiguous_partitions/",
        "cmd": ["OCEAN-NOCONT", "-p8", "-n130"]
    },
    {
        "name": "ocean-cont",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/ocean-contiguous_partitions/",
        "cmd": ["OCEAN-CONT", "-p8", "-n130"]
    },
    {
        "name": "volrend",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/volrend/",
        "cmd": ["VOLREND", "8", "inputs/head-scaleddown4", "2"]
    },
    {
        "name": "volrend-npl",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/volrend-no_print_lock/",
        "cmd": ["VOLREND-NPL", "8", "inputs/head-scaleddown4", "2"]
    },
        {
        "name": "water-nsquared",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/water-nsquared/",
        "input": "inputs/n512-p8", 
        "cmd": ["WATER-NSQUARED"]
    },
        {
        "name": "lu-ncont",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/lu-non_contiguous_blocks/",
        "cmd": ["LU-NOCONT", "-p8", "-n256"]
    },
    {
        "name": "lu-cont",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/lu-contiguous_blocks/",
        "cmd": ["LU-CONT", "-p8", "-n256"]
    },
    {
        "name": "water-spatial",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/water-spatial/",
        "input": "inputs/n512-p8", 
        "cmd": ["WATER-SPATIAL"]
    },

       {
        "name": "raytrace",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/raytrace/",
        "cmd": ["RAYTRACE", "-p8", "-m34", "inputs/teapot.env"]
    },
    {
        "name": "fft",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/fft/",
        "cmd": ["FFT", "-p8", "-m16"]
    },


    {
        "name": "cholesky",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/cholesky/",
        "input": "inputs/tk14.O",
        "cmd": ["CHOLESKY", "-p8"]
    },
            {
        "name": "fmm",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/fmm/",
        "input": "fmm.8.2048", 
        "cmd": ["FMM"]
    },
            {
        "name": "radiosity",
        "cores": cores,
        "dir": "/benchmarks/Splash-4/Splash-4/radiosity/",
        "cmd": ["RADIOSITY", "-p", "8", "-ae", "500", "-bf", "0.1", "-en", "0.05","-room","-batch"]
    },
    

"""







