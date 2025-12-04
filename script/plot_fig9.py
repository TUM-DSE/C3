#!/usr/bin/env python3
"""
plot_fig9.py - Generate Figure 9 plot from gem5 ARM simulation results

Figure 9 compares memory consistency models (MCM) on ARM:
  - 2 Sections: MESI-CXL-MESI, MESI-CXL-MOESI
  - 3 Bars per benchmark: Arm_Arm (baseline), Tso_Tso, Arm_Tso

Reads CSV files from data/fig_9/summary/results/
Generates normalized execution time comparison plot
"""

import os
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib.ticker as ticker

# Get script directory and repo root
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
DATA_DIR = os.path.join(REPO_ROOT, 'data', 'fig_9')
RESULTS_DIR = os.path.join(DATA_DIR, 'summary', 'results')
PLOT_DIR = os.path.join(DATA_DIR, 'plot')


def process_and_clean_data(benchmark_suites, suffixes, protocols, input_dir, output_dir):
    """
    Processes and cleans the raw benchmark data files.
    For each input file, it creates a 'clear' CSV file with the desired format,
    renaming 'protocol' to 'memory_model' and setting its value to the file suffix.
    """
    print("--- Starting data cleaning and transformation ---")
    for protocol in protocols:
        for suite in benchmark_suites:
            for suffix in suffixes:
                # Construct the input filename based on the specified pattern
                input_filename = f"{suite}_results.csv_{suffix}_{protocol}.csv"
                # Construct the output filename for the cleaned data
                output_filename = f"{suite}_results_{suffix}_{protocol}_clear.csv"

                # Build full paths
                input_path = os.path.join(input_dir, input_filename)
                output_path = os.path.join(output_dir, output_filename)

                try:
                    # Read the input CSV file
                    df = pd.read_csv(input_path)
                    # Add new columns
                    df['memory_model'] = suffix
                    df['protocol'] = protocol

                    # Add a 'normtime' column, initially a copy of 'Simulation Time'.
                    df['normtime'] = df['Simulation Time']

                    # Select and reorder the desired columns for the output file
                    df_clear = df[['Application', 'memory_model', 'protocol', 'Simulation Time', 'normtime']]

                    # Save the cleaned DataFrame to a new CSV file
                    os.makedirs(output_dir, exist_ok=True)
                    df_clear.to_csv(output_path, index=False)
                    print(f"Processed '{input_path}' -> '{output_path}'")

                except FileNotFoundError:
                    print(f"Warning: Input file '{input_path}' not found. Skipping.")
                except KeyError as e:
                    print(f"Error processing '{input_filename}': Missing expected column {e}. Skipping.")
                except Exception as e:
                    print(f"An unexpected error occurred while processing '{input_filename}': {e}. Skipping.")
    print("--- Data cleaning and transformation complete ---")


def normalize_and_prepare_plot_data(benchmark_suites, suffixes, protocols, input_dir):
    """
    Loads all 'clear' CSV files, performs global normalization,
    and prepares the data for plotting by calculating mean normalized runtimes.
    """
    print("--- Starting global data normalization and aggregation ---")
    all_data_frames = []
    for protocol in protocols:
        for suite in benchmark_suites:
            for suffix in suffixes:
                clear_filename = f"{suite}_results_{suffix}_{protocol}_clear.csv"
                clear_path = os.path.join(input_dir, clear_filename)
                try:
                    df = pd.read_csv(clear_path)
                    # Add a 'benchmark_suite' column for grouping in plots
                    df['benchmark_suite'] = suite.lower()
                    all_data_frames.append(df)
                except FileNotFoundError:
                    print(f"Warning: Cleaned file '{clear_path}' not found. Skipping.")
                except Exception as e:
                    print(f"An unexpected error occurred while loading '{clear_filename}': {e}. Skipping.")

    if not all_data_frames:
        print("No data loaded for normalization. Exiting.")
        return pd.DataFrame()

    master_df = pd.concat(all_data_frames)

    # Perform normalization for each protocol separately
    for protocol in protocols:
        protocol_data = master_df[master_df['protocol'] == protocol]
        
        for app_name in protocol_data['Application'].unique():
            app_data = protocol_data[protocol_data['Application'] == app_name]
            arm_arm_baseline_row = app_data[app_data['memory_model'] == 'Arm_Arm']

            if not arm_arm_baseline_row.empty:
                baseline_time = arm_arm_baseline_row['Simulation Time'].iloc[0]
                baseline_time = float(str(baseline_time).replace(',', '.'))
                if baseline_time != 0.0:
                    sim_time_float = master_df.loc[
                        (master_df['Application'] == app_name) & 
                        (master_df['protocol'] == protocol), 
                        'Simulation Time'
                    ].astype(str).str.replace(',', '.').astype(float)
                    
                    master_df.loc[
                        (master_df['Application'] == app_name) & 
                        (master_df['protocol'] == protocol), 
                        'normtime'
                    ] = sim_time_float / baseline_time
                else:
                    master_df.loc[
                        (master_df['Application'] == app_name) & 
                        (master_df['protocol'] == protocol), 
                        'normtime'
                    ] = 0.0
                    print(f"Warning: Arm_Arm baseline for app '{app_name}' in protocol '{protocol}' is 0.")
            else:
                master_df.loc[
                    (master_df['Application'] == app_name) & 
                    (master_df['protocol'] == protocol), 
                    'normtime'
                ] = np.nan
                print(f"Warning: Arm_Arm data missing for app '{app_name}' in protocol '{protocol}'.")

    # Calculate the mean 'normtime' for each combination
    plot_data = master_df.groupby(['benchmark_suite', 'memory_model', 'protocol'])['normtime'].mean().reset_index()

    # Ensure the order of memory models for consistent plotting
    memory_model_order = ['Arm_Arm', 'Tso_Tso', 'Arm_Tso']
    plot_data['memory_model'] = pd.Categorical(plot_data['memory_model'],
                                               categories=memory_model_order, ordered=True)
    plot_data = plot_data.sort_values(['protocol', 'benchmark_suite', 'memory_model'])
    print("--- Global data normalization and aggregation complete ---")
    return plot_data


def create_two_section_bar_plot(plot_data, protocols, output_dir):
    """
    Generates a two-section bar plot for Figure 9.
    
    Args:
        plot_data: DataFrame containing mean normalized runtimes.
        protocols: List of protocol names for the two sections.
        output_dir: Directory to save the plot.
    """
    print("--- Generating Figure 9 plot ---")
    if plot_data.empty:
        print("No data to plot. Exiting plotting function.")
        return

    # Set the global font to serif
    plt.rcParams['font.family'] = 'serif'

    # Create figure
    fig, ax = plt.subplots(figsize=(7, 2))

    # Prepare data for plotting
    # First section: MESI_CXL_MESI data
    protocol1_data = plot_data[plot_data['protocol'] == protocols[0]]
    protocol1_means = protocol1_data.groupby(['benchmark_suite', 'memory_model'])['normtime'].mean().reset_index()
    
    # Second section: MESI_CXL_MOESI data
    protocol2_data = plot_data[plot_data['protocol'] == protocols[1]]
    if not protocol2_data.empty:
        protocol2_means = protocol2_data.groupby(['benchmark_suite', 'memory_model'])['normtime'].mean().reset_index()
    else:
        protocol2_means = pd.DataFrame()

    # Get suite names and MCM names
    suite_names = sorted(protocol1_means['benchmark_suite'].unique())
    mcm_names = ['Arm_Arm', 'Tso_Tso', 'Arm_Tso']
    
    # Create combined DataFrame
    combined_data = {}
    
    # App counts per suite (update these based on actual data)
    app_counts = {'parsec': 8, 'phoenix': 7, 'splash': 15}
    
    # Add first section data (benchmark suites means for first protocol)
    for suite in suite_names:
        suite_data = protocol1_means[protocol1_means['benchmark_suite'] == suite]
        suite_values = []
        for mcm in mcm_names:
            mcm_data = suite_data[suite_data['memory_model'] == mcm]
            if not mcm_data.empty:
                suite_values.append(mcm_data['normtime'].iloc[0])
            else:
                suite_values.append(0)
        
        app_count = app_counts.get(suite.lower(), '')
        label = f"{suite.upper()}_mean ({app_count}) " if app_count else f"{suite.upper()}_mean "
        combined_data[label] = suite_values

    # Add second section data (benchmark suites means for second protocol)
    if not protocol2_means.empty:
        for suite in suite_names:
            suite_data = protocol2_means[protocol2_means['benchmark_suite'] == suite]
            suite_values = []
            for mcm in mcm_names:
                mcm_data = suite_data[suite_data['memory_model'] == mcm]
                if not mcm_data.empty:
                    suite_values.append(mcm_data['normtime'].iloc[0])
                else:
                    suite_values.append(0)
            
            app_count = app_counts.get(suite.lower(), '')
            label = f"{suite.upper()}_mean ({app_count})" if app_count else f"{suite.upper()}_mean"
            combined_data[label] = suite_values

    # Create DataFrame
    combined_df = pd.DataFrame(combined_data, index=mcm_names).T
    
    # Colors for the three MCM configurations
    colors = ['#F8B195', '#355C7D', '#C06C84']

    # Create the bar plot
    combined_df.plot(
        kind="bar",
        ax=ax,
        linewidth=0.5,
        ylim=(0, 1.7),
        edgecolor="#595959",
        width=0.6,
        color=colors
    )

    # Apply tick styling
    ax.tick_params(
        labelcolor='black',
        which='major',
        direction='out',
        length=3,
        labelsize=11,
        right=False, top=False, bottom=False
    )

    # Format x-tick labels
    formatted_labels = [label.replace('_', '\n  ') for label in combined_df.index]
    ax.set_xticklabels(formatted_labels, rotation=0)

    # Adjust layout
    plt.subplots_adjust(bottom=0.25)

    # Apply hatches
    hatches = ("", "", r"\\")
    bars = ax.patches
    num_groups = len(ax.get_xticks())
    hatches_expanded = [h for h in hatches for n in range(num_groups)]
    
    for bar, hatch in zip(bars, hatches_expanded):
        if hatch:
            bar.set_hatch(hatch)

    # Style spines
    for pos in ['top', 'bottom', 'right', 'left']:
        ax.spines[pos].set_edgecolor("black")

    # Grid styling
    ax.grid(visible=True, axis='y', linestyle='--', alpha=0.4, color='lightgray')
    ax.yaxis.set_major_locator(ticker.MultipleLocator(0.5))
    ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1))
    ax.grid(which='minor', visible=True, axis='y', linestyle='-.', alpha=0.4, color='lightgray')
    ax.set_axisbelow(True)

    # Labels
    ax.set_ylabel("Normalized runtime\n(w.r.t. Arm_Arm)", fontsize=11)
    ax.set_xlabel("", fontsize=0)

    # Section labels
    num_section1 = len(suite_names)
    num_section2 = len(suite_names)
    section1_center = (num_section1 - 1) / 2
    section2_center = num_section1 + (num_section2 - 1) / 2

    ax.text(section1_center, 1.815, "MESI-CXL-MESI", fontsize=11, ha='center', va='center', fontweight='bold')
    ax.text(section2_center, 1.815, "MESI-CXL-MOESI", fontsize=11, ha='center', va='center', fontweight='bold')

    # Add vertical line between sections
    ax.axvline(num_section1 - 0.5, linewidth=0.9, color='grey', dashes=[3, 3])

    # Background color
    ax.set_facecolor("white")

    # Legend
    handles, previous_labels = ax.get_legend_handles_labels()
    l = ax.legend(
        title=None,
        loc=(0.25, .84),
        frameon=True,
        ncol=3,
        labelspacing=0,
        columnspacing=1,
        borderpad=0,
        handlelength=0.7,
        fontsize=10,
        edgecolor='white',
        fancybox=False,
        framealpha=1,
        handles=handles,
        labels=["Arm_Arm", "Tso_Tso", "Arm_Tso"]
    )
    l.get_frame().set_facecolor('#ffffff')

    plt.tight_layout()
    
    # Create output directory
    os.makedirs(output_dir, exist_ok=True)
    
    # Save plot
    plot_filename = os.path.join(output_dir, "figure_9.pdf")
    plt.savefig(plot_filename, dpi="figure", pad_inches=0.05, bbox_inches="tight")
    print(f"Figure 9 saved as '{plot_filename}'")
    
    # Also save as PNG for quick preview
    plot_png = os.path.join(output_dir, "figure_9.png")
    plt.savefig(plot_png, dpi=150, pad_inches=0.05, bbox_inches="tight")
    print(f"Figure 9 preview saved as '{plot_png}'")
    
    print("--- Figure 9 plot generation complete ---")


def main():
    """Main execution"""
    benchmark_suites = ["parsec", "Splash", "Phoenix"]
    suffixes = ["Tso_Tso", "Arm_Tso", "Arm_Arm"]
    protocols = ["MESI_CXL_MESI", "MESI_CXL_MOESI"]

    # Check if results directory exists
    if not os.path.exists(RESULTS_DIR):
        print(f"ERROR: Results directory not found: {RESULTS_DIR}")
        print("Run experiments first with './script/run-fig9.sh'")
        sys.exit(1)

    # Part 1: Process and clean data
    process_and_clean_data(benchmark_suites, suffixes, protocols, 
                           input_dir=RESULTS_DIR, output_dir=RESULTS_DIR)

    # Part 2: Load all cleared data, perform normalization, and aggregate for plotting
    plot_data = normalize_and_prepare_plot_data(benchmark_suites, suffixes, protocols, 
                                                 input_dir=RESULTS_DIR)

    # Part 3: Generate the two-section styled bar plot
    create_two_section_bar_plot(plot_data, protocols, output_dir=PLOT_DIR)

    print("\nFigure 9 generation completed.")


if __name__ == "__main__":
    main()
