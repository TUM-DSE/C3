#!/usr/bin/env python3
"""
plot_fig10.py - Generate Figure 10 plot from gem5 simulation results

Reads CSV files from data/fig_10/summary/{protocol}/{suite}.csv
Generates normalized execution time comparison plot
"""

import os
import sys
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import matplotlib.ticker as ticker
import seaborn as sns
from matplotlib.gridspec import GridSpec
from matplotlib.patches import Patch

# Get script directory and repo root
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
DATA_DIR = os.path.join(REPO_ROOT, 'data', 'fig_10')
SUMMARY_DIR = os.path.join(DATA_DIR, 'summary')
PLOT_DIR = os.path.join(DATA_DIR, 'plot')

# Global matplotlib configurations for a scientific paper look
mpl.rcParams["text.latex.preamble"] = r"\usepackage{amsmath}"
mpl.rcParams["pdf.fonttype"] = 42
mpl.rcParams["ps.fonttype"] = 42
plt.rcParams['xtick.labelsize'] = 8
plt.rcParams['ytick.labelsize'] = 8
plt.rcParams['font.family'] = 'serif'
plt.rcParams['font.serif'] = ['Times New Roman']

# Seaborn settings for a scientific look
sns.set_style("whitegrid")
sns.set_style("ticks", {"xtick.major.size": 8, "ytick.major.size": 8})
sns.set_context("paper", rc={"font.size": 8, "axes.titlesize": 8, "axes.labelsize": 8})

# Constants
FONTSIZE = 8
labelfontsize = 8
labelpad = 6

# Protocol configuration
# Map internal names to display names
PROTOCOL_MAP = {
    'MESI_unord': 'MESI-MESI',
    'MESI_unord_CXL': 'MESI-CXL-MESI',
    'MESI_CXL_MOESI': 'MESI-CXL-MOESI',
    'MESI_CXL_MESIF': 'MESI-CXL-MESIF'
}

# Protocol order for plotting
PROTOCOL_ORDER = ['MESI-MESI', 'MESI-CXL-MESI', 'MESI-CXL-MOESI', 'MESI-CXL-MESIF']
PROTOCOL_FOLDERS = ['MESI_unord', 'MESI_unord_CXL', 'MESI_CXL_MOESI', 'MESI_CXL_MESIF']

# Define custom colors and hatches for protocols
PROTOCOL_COLORS = ["#4C72B0", "#55A868", "#C44E52", "#8172B3"]
PROTOCOL_HATCHES = ['/////', '', '...', 'xxx']

# Benchmark suites
SUITES = ['parsec', 'splash', 'phoenix']
SUITE_TITLES = {'parsec': 'PARSEC', 'splash': 'Splash-4', 'phoenix': 'Phoenix'}


def read_and_clean_data(filename):
    """Read and clean CSV data"""
    try:
        data = pd.read_csv(filename)
        if 'Application' not in data.columns or 'Simulation Time' not in data.columns:
            print(f"Warning: Missing columns in {filename}")
            return pd.DataFrame({'Application': [], 'Simulation Time': []})
        
        # Clean application names and convert time values
        data['Application'] = data['Application'].str.strip().str.lower()
        data['Simulation Time'] = data['Simulation Time'].astype(str).str.replace(',', '.')
        data['Simulation Time'] = pd.to_numeric(data['Simulation Time'], errors='coerce')
        data = data.dropna()
        return data
    except Exception as e:
        print(f"Error reading {filename}: {e}")
        return pd.DataFrame({'Application': [], 'Simulation Time': []})


def process_benchmark(suite_name):
    """Process benchmark data for all protocols"""
    protocol_data = {}
    
    for folder, display_name in zip(PROTOCOL_FOLDERS, PROTOCOL_ORDER):
        file_path = os.path.join(SUMMARY_DIR, folder, f'{suite_name}.csv')
        print(f"Reading: {file_path}")
        
        if not os.path.exists(file_path):
            print(f"  Warning: File not found")
            continue
            
        data = read_and_clean_data(file_path)
        if data.empty:
            print(f"  Warning: No data found")
            continue
            
        protocol_data[display_name] = data.rename(
            columns={'Simulation Time': f'Sim_Time_{display_name}'}
        )
    
    if not protocol_data:
        return None
    
    # Merge all protocol data
    baseline = 'MESI-MESI'
    if baseline not in protocol_data:
        print(f"Warning: Baseline protocol {baseline} not found for {suite_name}")
        return None
    
    merged_data = protocol_data[baseline].copy()
    for protocol in PROTOCOL_ORDER[1:]:
        if protocol in protocol_data:
            merged_data = merged_data.merge(
                protocol_data[protocol], on='Application', how='inner'
            )
    
    # Normalize with respect to MESI-MESI (baseline)
    merged_data['Norm_Sim_Time_MESI-MESI'] = 1.0
    for protocol in PROTOCOL_ORDER[1:]:
        col = f'Sim_Time_{protocol}'
        norm_col = f'Norm_Sim_Time_{protocol}'
        if col in merged_data.columns:
            merged_data[norm_col] = (
                merged_data[col] / merged_data[f'Sim_Time_{baseline}']
            )
    
    return merged_data


def calculate_protocol_stats(data, benchmark_name):
    """Calculate and print statistics per benchmark"""
    print(f"\n===== {benchmark_name} Statistics =====")
    
    protocols_to_analyze = {
        'MESI-CXL-MESI': 'Norm_Sim_Time_MESI-CXL-MESI',
        'MESI-CXL-MOESI': 'Norm_Sim_Time_MESI-CXL-MOESI',
        'MESI-CXL-MESIF': 'Norm_Sim_Time_MESI-CXL-MESIF'
    }
    
    stats = {}
    
    for protocol_name, column_name in protocols_to_analyze.items():
        if column_name not in data.columns:
            continue
            
        values = data[column_name]
        pct_values = (values - 1.0) * 100
        
        min_pct = pct_values.min()
        max_pct = pct_values.max()
        avg_pct = pct_values.mean()
        
        stats[protocol_name] = {
            'avg': avg_pct,
            'min': min_pct,
            'max': max_pct,
            'avg_norm': values.mean()
        }
        
        print(f"{protocol_name} vs MESI-MESI (Baseline):")
        print(f"  Range: {min_pct:+.1f}% to {max_pct:+.1f}%")
        print(f"  Average: {avg_pct:+.1f}%")
    
    return stats


def prepare_plot_data(df_source):
    """Prepare data for plotting"""
    data_dict = {'apps': [], 'protocol': [], 'time': []}
    
    for _, row in df_source.iterrows():
        app = row['Application']
        for protocol in PROTOCOL_ORDER:
            norm_col = f'Norm_Sim_Time_{protocol}'
            if norm_col in row:
                data_dict['apps'].append(app)
                data_dict['protocol'].append(protocol)
                data_dict['time'].append(row[norm_col])
    
    return pd.DataFrame(data=data_dict)


def create_figure10_plot(data_parsec, data_splash, data_phoenix):
    """Create Figure 10 plot"""
    print("\n===== Creating Figure 10 Plot =====")
    
    # Calculate statistics
    if data_parsec is not None:
        parsec_stats = calculate_protocol_stats(data_parsec, "PARSEC")
    if data_splash is not None:
        splash_stats = calculate_protocol_stats(data_splash, "SPLASH")
    if data_phoenix is not None:
        phoenix_stats = calculate_protocol_stats(data_phoenix, "PHOENIX")
    
    # Calculate overall statistics
    all_data = pd.concat(
        [d for d in [data_parsec, data_splash, data_phoenix] if d is not None],
        ignore_index=True
    )
    
    print(f"\n===== OVERALL Statistics =====")
    overall_stats = {}
    
    for protocol in ['MESI-CXL-MESI', 'MESI-CXL-MOESI', 'MESI-CXL-MESIF']:
        col = f'Norm_Sim_Time_{protocol}'
        if col not in all_data.columns:
            continue
        values = all_data[col]
        pct_values = (values - 1.0) * 100
        
        overall_stats[protocol] = {
            'avg': pct_values.mean(),
            'min': pct_values.min(),
            'max': pct_values.max(),
            'avg_norm': values.mean()
        }
        
        print(f"\n{protocol} vs MESI-MESI (Baseline):")
        print(f"  Performance degradation range: {pct_values.min():+.1f}% to {pct_values.max():+.1f}%")
        print(f"  Average performance degradation: {pct_values.mean():+.1f}%")
        print(f"  (All parallel applications normalized to MESI-MESI baseline)")
    
    # Store average values for plotting
    avg_mesi_cxl_mesi_overall = overall_stats.get('MESI-CXL-MESI', {}).get('avg_norm', 1.0)
    avg_moesi_overall = overall_stats.get('MESI-CXL-MOESI', {}).get('avg_norm', 1.0)
    avg_mesif_overall = overall_stats.get('MESI-CXL-MESIF', {}).get('avg_norm', 1.0)
    
    # Prepare data for plotting
    df_parsec = prepare_plot_data(data_parsec) if data_parsec is not None else pd.DataFrame()
    df_splash = prepare_plot_data(data_splash) if data_splash is not None else pd.DataFrame()
    df_phoenix = prepare_plot_data(data_phoenix) if data_phoenix is not None else pd.DataFrame()
    
    df_parsec['benchmark'] = 'PARSEC'
    df_splash['benchmark'] = 'Splash-4'
    df_phoenix['benchmark'] = 'Phoenix'
    
    # Create a DataFrame for the mean data
    data_dict_mean = {'apps': [], 'protocol': [], 'time': []}
    for protocol in PROTOCOL_ORDER:
        data_dict_mean['apps'].append('mean')
        data_dict_mean['protocol'].append(protocol)
        if protocol == 'MESI-MESI':
            data_dict_mean['time'].append(1.0)  # Baseline is always 1.0
        elif protocol == 'MESI-CXL-MESI':
            data_dict_mean['time'].append(avg_mesi_cxl_mesi_overall)
        elif protocol == 'MESI-CXL-MESIF':
            data_dict_mean['time'].append(avg_mesif_overall)
        elif protocol == 'MESI-CXL-MOESI':
            data_dict_mean['time'].append(avg_moesi_overall)
    df_mean = pd.DataFrame(data=data_dict_mean)
    df_mean['benchmark'] = 'Mean'
    
    # Define custom colors and hatches for comparing protocols
    colors = PROTOCOL_COLORS
    custom_palette = sns.color_palette(colors)
    hatches = PROTOCOL_HATCHES
    
    # Create 4 subplots in a row
    fig = plt.figure(figsize=(15, 4))
    gs = GridSpec(1, 4, figure=fig, width_ratios=[1, 1, 1, 0.15], wspace=0.04)
    
    # Subplots for PARSEC, SPLASH, PHOENIX and the MEAN plot
    ax1 = plt.subplot(gs[0])  # PARSEC
    ax2 = plt.subplot(gs[1])  # SPLASH
    ax3 = plt.subplot(gs[2])  # PHOENIX
    ax4 = plt.subplot(gs[3])  # MEAN
    
    # List of axes, DataFrames and titles for all 4 subplots
    axes = [ax1, ax2, ax3, ax4]
    dataframes = [df_parsec, df_splash, df_phoenix, df_mean]
    titles = ["PARSEC", "Splash-4", "Phoenix", "Mean"]
    
    # Create barplots for all subplots with the same design
    for i, (ax, df, title) in enumerate(zip(axes, dataframes, titles)):
        if df.empty:
            ax.set_visible(False)
            continue
            
        if i < 3:  # First 3 plots (PARSEC, SPLASH, PHOENIX)
            bars = sns.barplot(
                x="apps", 
                y="time", 
                hue="protocol", 
                data=df, 
                ax=ax,
                palette=custom_palette,
                hue_order=PROTOCOL_ORDER,
                errorbar=None,
                width=0.8,
                edgecolor='black',
                linewidth=0.5
            )
        else:  # Mean plot
            # Create a custom bar plot for mean to have more control over bar placement
            mean_values = [df[df['protocol'] == protocol]['time'].values[0] for protocol in PROTOCOL_ORDER]
            
            # Create bars with custom positions and fixed width
            bar_width = 0.1  
            positions = [0.30, 0.4, 0.5, 0.6]  # Concentrated positions in center
            
            # Create the bars manually
            for j, (pos, val, color, hatch) in enumerate(zip(positions, mean_values, custom_palette, hatches)):
                bar = ax.bar(pos, val, width=bar_width, color=color, edgecolor='black', linewidth=0.5, hatch=hatch)
            
            # Adjust x-axis limits to center the group of bars
            ax.set_xlim(0.1, 0.75)
            
            # Hide the x-tick labels and marks
            ax.set_xticks([])
            ax.tick_params(axis='x', which='both', bottom=False)
        
        # Common formatting for all plots
        if i < 3:  # First 3 plots only - apply hatches
            for j, container in enumerate(bars.containers):
                for bar in container:
                    bar.set_hatch(hatches[j])
                    bar.set_edgecolor('black')
        
        ax.set_title("")
        ax.set_ylim(0.7, 1.5)
        
        # Only set the x-axis label for the first 3 plots
        if i < 3:
            ax.tick_params(axis='x', labelsize=8)
            plt.setp(ax.xaxis.get_majorticklabels(), rotation=30, ha="right", rotation_mode="anchor")
        else:
            # Hide tick marks on the x-axis for the mean plot
            ax.tick_params(axis='x', which='both', bottom=False)
        
        # Remove legends except for the one on the second plot
        if i != 1:
            if hasattr(ax, 'get_legend') and ax.get_legend() is not None:
                ax.get_legend().remove()
        else:
            ax.get_legend().remove()
            legend_handles = []
            for j, protocol in enumerate(PROTOCOL_ORDER):
                if protocol == 'MESI-MESI':
                    patch = Patch(
                        facecolor=colors[j],
                        edgecolor='black',
                        hatch=hatches[j],
                        label='MESI-MESI-MESI'
                    )
                else:
                    patch = Patch(
                        facecolor=colors[j],
                        edgecolor='black',
                        hatch=hatches[j],
                        label=protocol
                    )
                legend_handles.append(patch)
            ax.legend(
                handles=legend_handles,
                title=None,
                fontsize=8,
                frameon=False,
                loc='upper center',
                bbox_to_anchor=(0.5, 1.25),
                ncol=4
            )
        
        ax.grid(axis='y', linestyle='--', alpha=0.7, zorder=0)
        ax.set_axisbelow(True)
        
        # Only the first plot gets a y-label
        if i == 0:
            ax.set_ylabel("Normalized\nExecution Time", fontsize=8)
            ax.yaxis.set_label_coords(-0.08, 0.5)
            ax.tick_params(axis='y', labelsize=8)
        else:
            ax.set_ylabel("")
            ax.tick_params(axis='y', which='both', labelleft=False)
        
        ax.yaxis.set_major_locator(ticker.MultipleLocator(0.2))
        ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1))
        
        # Set benchmark name as x-axis label for all plots
        ax.set_xlabel(title, fontsize=labelfontsize, labelpad=0, weight='bold')
        if i == 3:  # Mean plot
            ax.xaxis.set_label_coords(0.5, 0.97)
        else:
            ax.xaxis.set_label_coords(0.5, 0.97)
    
    plt.tight_layout()
    plt.subplots_adjust(top=0.8, bottom=0.45)
    
    # Create output directory
    os.makedirs(PLOT_DIR, exist_ok=True)
    
    # Save plots
    plt.savefig(
        os.path.join(PLOT_DIR, 'fig10_coherence_protocols.pdf'),
        format='pdf', dpi=300, bbox_inches='tight'
    )
    plt.savefig(
        os.path.join(PLOT_DIR, 'fig10_coherence_protocols.png'),
        dpi=600, bbox_inches='tight'
    )
    plt.savefig(
        os.path.join(PLOT_DIR, 'fig10_coherence_protocols.eps'),
        format='eps', dpi=300, bbox_inches='tight'
    )
    
    print(f"\nPlots saved to: {PLOT_DIR}")
    plt.show()


def main():
    print("=" * 60)
    print("Figure 10: Coherence Protocol Performance Comparison")
    print("=" * 60)
    
    # Check if summary directory exists
    if not os.path.exists(SUMMARY_DIR):
        print(f"ERROR: Summary directory not found: {SUMMARY_DIR}")
        print("Run extract-stats.sh first to generate CSV files.")
        sys.exit(1)
    
    # Process each benchmark suite
    data_parsec = process_benchmark('parsec')
    data_splash = process_benchmark('splash')
    data_phoenix = process_benchmark('phoenix')
    
    # Check if we have any data
    if all(d is None for d in [data_parsec, data_splash, data_phoenix]):
        print("ERROR: No data found for any benchmark suite")
        sys.exit(1)
    
    # Create the plot
    create_figure10_plot(data_parsec, data_splash, data_phoenix)
    
    print("\n" + "=" * 60)
    print("Figure 10 generation complete!")
    print("=" * 60)


if __name__ == "__main__":
    main()
