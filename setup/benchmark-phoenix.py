import asyncio
from pathlib import Path
import sys
import subprocess
import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument("config", help="Configuration name")
parser.add_argument("gem5_path", help="Path to gem5 executable")
parser.add_argument("--unique-suffix", help="Unique suffix for output directory")
parser.add_argument("--debug", action="store_true", help="Run with GDB")
parser.add_argument("--remote-latency", type=int, default=10, help="Remote latency value")
args = parser.parse_args()
remote_latency = args.remote_latency
config = args.config
gem5 = args.gem5_path
unique_suffix = args.unique_suffix
debug_mode = args.debug

cores=8

async def run(benchmark, redirect=True):
    print(f"Running {benchmark['name']} with {config}")

    env = os.environ.copy()
    env["MR_L1CACHESIZE"] = "8192"  
    env["MR_NUMTHREADS"] = "8"
    env["MR_NUMPROCS"] = "16"
    env["MR_KEYMATCHFACTOR"] = "2"

    base_dir = f"/output/CGO/X86-test/phoenix/{benchmark['name']}/"
    if unique_suffix:
        dir = f"{base_dir}{config}_{unique_suffix}"
    else:
        dir = f"{base_dir}{config}"

    cmd = [
        # "--debug-file=trace-1.out",
    #    "--debug-flags=ProtocolTrace",
        "--debug-file=trace-2.out",
        "--debug-flags=RubySlicc",
        # "--debug-file=trace-3.out",
        # "--debug-flags=DRAM",
        # "--debug-file=trace-4.out",
        # "--debug-flags=RubySequencer",
        #  "--debug-start=1789825000",
        #    "--debug-flags=DRAM",
        #  "--debug-file=trace-mesi.out",
        #  "--debug-flags=ProtocolTrace",
        #  "--debug-file=trace-8.out",
    #    "--debug-flags=ProtocolTrace",
        # "--debug-file=trace.out.gz",

        *(["-r", "-e",] if redirect else []),
        f"--outdir={dir}",
        # f"/setup/directory/generated/setup.py",
        # f"/setup/directory/generated/setup-real.py",
        # f"/setup/directory/generated/setup-real-hetero-mcm.py",
        # f"/setup/directory/generated/setup-real-before-arm.py",
        # f"/setup/directory/generated/setup-real.py",
        # f"/setup/directory/generated/setup-real-withL2private.py",
        f"/setup/directory/generated/setup-real_UMA_three_level.py",
        # f"/setup/directory/generated/setup-real_NUMA_three_level.py",
        # f"/setup/directory/generated/setup-real_UMA.py",
        # f"/setup/directory/generated/setup-real_NUMA.py",
        "--remote-latency", str(remote_latency),
        "-c", str(benchmark['cores']),
        *(["-ro"] if redirect else []),
        *benchmark['cmd'],
        *(["-ri", benchmark["input"]] if "input" in benchmark else [])
    ]

    Path(dir).mkdir(parents=True, exist_ok=True)

    try:
        if debug_mode:
            # Prepare GDB command
            gdb_commands = [
                "set pagination off",
                "handle SIGSEGV stop print",
                "run",
                "bt full"
            ]
            
            gdb_cmd = [
                "gdb",
                "--batch",
                "-ex", "\n".join(gdb_commands),
                "--args",
                gem5,
                *cmd
            ]
            
            process = await asyncio.create_subprocess_exec(
                *gdb_cmd,
                cwd=benchmark["dir"],
                env=env,
                stdout=asyncio.subprocess.PIPE,
                stderr=asyncio.subprocess.PIPE
            )
        else:
            process = await asyncio.create_subprocess_exec(
                gem5,
                *cmd,
                cwd=benchmark["dir"],
                env=env
            )
            
        stdout, stderr = await process.communicate()
        if debug_mode and stdout:
            print("GDB Output:")
            print(stdout.decode())
        if debug_mode and stderr:
            print("GDB Errors:")
            print(stderr.decode())
            
        exit_code = process.returncode
        assert exit_code == 0, "Failed to run gem5"
        print(f"Running {benchmark['name']} with {config} succeeded")
        return dir
    except Exception as e:
        print(f"Running {benchmark['name']} with {config} failed: {e}")
        return None

async def run_all(benchmarks, parallel=True):
    if parallel:
        tasks = [run(benchmark, redirect=True) for benchmark in benchmarks]
        await asyncio.gather(*tasks)
    else:
        for benchmark in benchmarks:
            await run(config, gem5, benchmark, redirect=False)

benchmarks = [

    {
        "name": "kmeans",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/kmeans",
        "cmd": ["kmeans", "-d 500", "-c 6", "-p 100", "-s 100"]
    },
    #      {
    #      "name": "histogram",
    #      "cores": 10,
    #      "dir": "/benchmarks/phoenix/phoenix-2.0/tests/histogram",
    #      "cmd": ["histogram", "image-2.bmp"]
    #  },
    #      {
    #      "name": "linear_regression",
    #      "cores": cores,
    #      "dir": "/benchmarks/phoenix/phoenix-2.0/tests/linear_regression",
    #      "cmd": ["linear_regression", "ex1data1.txt"]
    #  },
    #      {
    #      "name": "matrix_multiply",
    #      "cores": cores,
    #      "dir": "/benchmarks/phoenix/phoenix-2.0/tests/matrix_multiply",
    #      "cmd": ["matrix_multiply", "10", "10"]
    #  },
    #      {
    #      "name": "pca",
    #      "cores": 30,
    #      "dir": "/benchmarks/phoenix/phoenix-2.0/tests/pca",
    #      "cmd": ["pca", "-r 100", "-c 100", "-s 50"]
    #  },
    #      {
    #      "name": "string_match",
    #      "cores": cores,
    #      "dir": "/benchmarks/phoenix/phoenix-2.0/tests/string_match",
    #      "cmd": ["string_match", "test.txt"]
    #  },
    #      {
    #      "name": "word_count",
    #      "cores": cores,
    #      "dir": "/benchmarks/phoenix/phoenix-2.0/tests/word_count",
    #      "cmd": ["word_count", "test.txt"]
    #  },
 ]





# with open("/setup/generated/benchmark/run/parsec/benchmarks.conf", 'r') as file:
#     for line in file.readlines():
#         name, cmd = line.split("=")
#         if name in skipped_benchmarks:
#             print("Skipped ", name)
#             continue
#         local_cores = cores
#         if name in []:
#             local_cores += 2
#         benchmarks.append({
#             "name": name,
#             "cores": local_cores,
#             "dir": f"/setup/generated/benchmark/run/parsec/{name}/",
#             "cmd": cmd.strip().split(" ")
#         })



#asyncio.run(run_all(enviroments, benchmarks[-1:], parallel=False))
asyncio.run(run_all(benchmarks, parallel=True))

if unique_suffix:
    target_folder = f"{config}_{unique_suffix}"
else:
    target_folder = f"{config}"

# Run stats extraction
try:
    subprocess.run(
        ["python3", "extract_stats-phoenix.py", "--target-folder", target_folder],
        check=True
    )
    print(f"File CSV generated correctly for {target_folder}.")
except subprocess.CalledProcessError as e:
    print(f"Error during CSV generation for {target_folder}: {e}")

# try:
#     subprocess.run(["python3", "extract_stats-phoenix.py"], check=True)
#     print("File CSV generated correctly.")
# except subprocess.CalledProcessError as e:
#     print(f"Error during CSV generation: {e}")

"""
# SEQUENTIAL
{
        "name": "histogram",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/histogram",
        "input": "image.bmp",
        "cmd": ["histogram-seq", "image.bmp"]
    },
        {
        "name": "kmeans",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/kmeans",
        "cmd": ["kmeans-seq", "-d 500", "-c 6", "-p 100", "-s 100"]
    },
        {
        "name": "linear_regression",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/linear_regression",
        "cmd": ["linear_regression-seq", "ex1data1.txt"]
    },
        {
        "name": "matrix_multiply",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/matrix_multiply",
        "cmd": ["matrix_multiply-seq", "500"]
    },
        {
        "name": "pca",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/pca",
        "cmd": ["pca-seq", "-r 125", "-c 125", "-s 50"]
    },
        {
        "name": "string_match",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/string_match",
        "cmd": ["string_match-seq", "test.txt"]
    },
        {
        "name": "word_count",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/word_count",
        "cmd": ["word_count-seq", "test.txt"]
    },

"""

"""
#MapReduce
{
        "name": "histogram",
        "cores": 10,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/histogram",
        "cmd": ["histogram", "image-2.bmp"]
    },
        {
        "name": "kmeans",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/kmeans",
        "cmd": ["kmeans", "-d 500", "-c 6", "-p 100", "-s 100"]
    },
        {
        "name": "linear_regression",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/linear_regression",
        "cmd": ["linear_regression", "ex1data1.txt"]
    },
        {
        "name": "matrix_multiply",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/matrix_multiply",
        "cmd": ["matrix_multiply", "4", "1"]
    },
        {
        "name": "pca",
        "cores": 25,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/pca",
        "cmd": ["pca", "-r 250", "-c 250", "-s 75"]
    },
        {
        "name": "string_match",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/string_match",
        "cmd": ["string_match", "test.txt"]
    },
        {
        "name": "word_count",
        "cores": cores,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/word_count",
        "cmd": ["word_count", "test.txt"]
    },
"""

"""
#P-THREAD
{
        "name": "histogram",
        "cores": 44,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/histogram",
        "cmd": ["histogram-pthread", "image-2.bmp"]
    },
        {
        "name": "kmeans",
        "cores": 16,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/kmeans",
        "cmd": ["kmeans-pthread", "-d 5", "-c 6", "-p 59", "-s 1"]
    },
        {
        "name": "linear_regression",
        "cores": 16,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/linear_regression",
        "cmd": ["linear_regression-pthread", "ex1data1.txt"]
    },
        {
        "name": "matrix_multiply",
        "cores": 16,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/matrix_multiply",
        "cmd": ["matrix_multiply-pthread", "4", "4"]
    },
        {
        "name": "pca",
        "cores": 16,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/pca",
        "cmd": ["pca-pthread", "-r 59", "-c 59", "-s 59"]
    },
        {
        "name": "string_match",
        "cores": 24,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/string_match",
        "cmd": ["string_match-pthread", "test.txt"]
    },
        {
        "name": "word_count",
        "cores": 20,
        "dir": "/benchmarks/phoenix/phoenix-2.0/tests/word_count",
        "cmd": ["word_count-pthread", "test.txt"]
    }
"""