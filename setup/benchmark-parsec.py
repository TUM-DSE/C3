import asyncio
import sys
import subprocess
import os
import argparse
from pathlib import Path


# Set up argument parsing
parser = argparse.ArgumentParser(description='Run PARSEC benchmarks with configurable parameters')
parser.add_argument("protocol", help="Protocol name (e.g., MSI_unord, MESI_unord, MOESI_CMP_directory_edit)")
parser.add_argument("gem5_path", help="Path to gem5 executable")
parser.add_argument("--unique-suffix", help="Unique suffix for output directory")
parser.add_argument("--remote-latency", type=int, default=10, help="Remote latency value")
args = parser.parse_args()
remote_latency = args.remote_latency

protocol = args.protocol
gem5 = args.gem5_path
unique_suffix = args.unique_suffix

async def run(benchmark, redirect=True):
    print(f"Running {benchmark['name']} with {protocol}")
    
    # base_dir = f"/output/CGO/X86/parsec/{benchmark['name']}/"
    base_dir = f"/output/HPCA-OLD/X86/parsec/{benchmark['name']}/"
    if unique_suffix:
        output_dir = f"{base_dir}{protocol}_{unique_suffix}"
    else:
        output_dir = f"{base_dir}{protocol}"
    
    Path(output_dir).mkdir(parents=True, exist_ok=True)

    
    cmd = [
        # "--debug-file=trace-1.out",
    #    "--debug-flags=ProtocolTrace",
        # "--debug-file=trace-2.out",
        # "--debug-flags=RubySlicc",
        # "--debug-file=trace-3.out",
        # "--debug-flags=DRAM",
        # "--debug-file=trace-4.out",
        # "--debug-flags=RubySequencer",
        # "--debug-start=80193512500",
#       "--debug-flags=ProtocolTrace",
#        "--debug-file=trace.out.gz",
        "-r", "-e",
        f"--outdir={output_dir}",
        f"/setup/directory/generated/setup-real-hetero-mcm.py",
        # f"/setup/directory/generated/setup-real_UMA_three_level.py",
        # f"/setup/directory/generated/setup-real_NUMA_three_level.py",
        # f"/setup/directory/generated/setup-real_NUMA.py",
        # f"/setup/directory/generated/setup-real_UMA.py",
        # f"/setup/directory/generated/setup-real.py",
        # f"/setup/directory/generated/setup-real-withL2private.py",
        # f"/setup/directory/generated/setup-real_UMA.py",
        "--remote-latency", str(remote_latency),
        "-c", str(benchmark['cores']),
        "-ro",
        *benchmark['cmd']]
    
    print("Command Line: ", gem5, *cmd)
    try:
        process = await asyncio.create_subprocess_exec(
            gem5,
            *cmd,
            cwd=benchmark['dir'],
        )
        exit_code = await process.wait()
        assert exit_code == 0, "Failed to run gem5"
        print(f"Running {benchmark['name']} with {protocol} succeeded")
        return output_dir
    except Exception as e:
        print(f"Running {benchmark['name']} with {protocol} failed: {e}")
        return None


async def run_all(benchmarks, parallel=True):
    if parallel:
        tasks = [run(benchmark, redirect=True) for benchmark in benchmarks]
        await asyncio.gather(*tasks)
    else:
        for benchmark in benchmarks:
            await run(benchmark, redirect=False)

cores = 24
benchmarks = []
# with open(f"/setup/directory/generated/benchmarks.conf", 'r') as file:
with open(f"/setup/directory/generated/benchmarks-hpca.conf", 'r') as file:
    for line in file.readlines():
        name, cmd = line.split("=")
        if name == "blackscholes":
            benchmarks.append({
                "name": name,
                "cores": 4,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        elif name == "x264":
            benchmarks.append({
                "name": name,
                "cores": 2,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        elif name == "bodytrack":
            benchmarks.append({
                "name": name,
                "cores": 40,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        elif name == "fluidanimate":
            benchmarks.append({
                "name": name,
                "cores": 30,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        elif name == "freqmine":
            benchmarks.append({
                "name": name,
                "cores": 30,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        elif name == "facesim":
            benchmarks.append({
                "name": name,
                "cores": 2,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        elif name == "dedup":
            benchmarks.append({
                "name": name,
                "cores": 16,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        elif name == "streamcluster":
            benchmarks.append({
                "name": name,
                "cores": 16,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })
        else:
            benchmarks.append({
                "name": name,
                "cores": cores,
                "dir": f"/output/parsec/{name}/",
                "cmd": cmd.strip().split(" ")
            })  

asyncio.run(run_all(benchmarks))

try:
    subprocess.run(["python3", "extract_stats-parsec.py", "--unique-suffix", unique_suffix if unique_suffix else ""], check=True)
    print("File CSV generated correctly.")
except subprocess.CalledProcessError as e:
    print(f"Error during CSV generation: {e}")