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
mpl.rcParams["pdf.fonttype"] = 42
mpl.rcParams["ps.fonttype"] = 42
plt.rcParams['xtick.labelsize'] = 7
plt.rcParams['ytick.labelsize'] = 7
plt.rcParams['font.family'] = 'serif'
plt.rcParams['font.serif'] = ['Times New Roman', 'DejaVu Serif']

# Seaborn settings for a scientific look
sns.set_style("whitegrid")
sns.set_style("ticks", {"xtick.major.size": 8, "ytick.major.size": 8})
sns.set_context("paper", rc={"font.size": 8, "axes.titlesize": 8, "axes.labelsize": 8})

# Constants
FONTSIZE = 8
LABELFONTSIZE = 8
LABELPAD = 6

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
        print(f"  Range: {pct_values.min():+.1f}% to {pct_values.max():+.1f}%")
        print(f"  Average: {pct_values.mean():+.1f}%")
    
    # Prepare data for plotting
    df_parsec = prepare_plot_data(data_parsec) if data_parsec is not None else pd.DataFrame()
    df_splash = prepare_plot_data(data_splash) if data_splash is not None else pd.DataFrame()
    df_phoenix = prepare_plot_data(data_phoenix) if data_phoenix is not None else pd.DataFrame()
    
    df_parsec['benchmark'] = 'PARSEC'
    df_splash['benchmark'] = 'Splash-4'
    df_phoenix['benchmark'] = 'Phoenix'
    
    # Create mean data
    data_dict_mean = {'apps': [], 'protocol': [], 'time': []}
    for protocol in PROTOCOL_ORDER:
        data_dict_mean['apps'].append('mean')
        data_dict_mean['protocol'].append(protocol)
        if protocol == 'MESI-MESI':
            data_dict_mean['time'].append(1.0)
        elif protocol in overall_stats:
            data_dict_mean['time'].append(overall_stats[protocol]['avg_norm'])
        else:
            data_dict_mean['time'].append(1.0)
    
    df_mean = pd.DataFrame(data=data_dict_mean)
    df_mean['benchmark'] = 'Mean'
    
    # Create figure with 4 subplots
    fig = plt.figure(figsize=(15, 2.3))
    gs = GridSpec(1, 4, figure=fig, width_ratios=[1, 1, 1, 0.15], wspace=0.04)
    
    ax1 = plt.subplot(gs[0])  # PARSEC
    ax2 = plt.subplot(gs[1])  # SPLASH
    ax3 = plt.subplot(gs[2])  # PHOENIX
    ax4 = plt.subplot(gs[3])  # MEAN
    
    axes = [ax1, ax2, ax3, ax4]
    dataframes = [df_parsec, df_splash, df_phoenix, df_mean]
    titles = ["PARSEC", "Splash-4", "Phoenix", "Mean"]
    
    custom_palette = sns.color_palette(PROTOCOL_COLORS)
    
    for i, (ax, df, title) in enumerate(zip(axes, dataframes, titles)):
        if df.empty:
            ax.set_visible(False)
            continue
            
        if i < 3:
            # Regular benchmark plots
            bars = sns.barplot(
                data=df, x='apps', y='time', hue='protocol',
                hue_order=PROTOCOL_ORDER, palette=custom_palette,
                ax=ax, edgecolor='black', linewidth=0.5
            )
            
            # Add hatches
            num_apps = len(df['apps'].unique())
            for j, bar in enumerate(bars.patches):
                hatch_idx = j // num_apps
                if hatch_idx < len(PROTOCOL_HATCHES):
                    bar.set_hatch(PROTOCOL_HATCHES[hatch_idx])
            
            ax.set_xticklabels(
                ax.get_xticklabels(), rotation=45, ha='right', fontsize=6
            )
        else:
            # Mean plot
            bars = sns.barplot(
                data=df, x='apps', y='time', hue='protocol',
                hue_order=PROTOCOL_ORDER, palette=custom_palette,
                ax=ax, edgecolor='black', linewidth=0.5
            )
            
            for j, bar in enumerate(bars.patches):
                if j < len(PROTOCOL_HATCHES):
                    bar.set_hatch(PROTOCOL_HATCHES[j])
            
            ax.set_xticks([])
        
        # Common formatting
        ax.set_title("")
        ax.set_ylim(0.8, 1.3)
        
        # Remove legends except for the second plot
        if i != 1:
            if ax.get_legend():
                ax.get_legend().remove()
        else:
            # Create legend
            legend_elements = [
                Patch(
                    facecolor=PROTOCOL_COLORS[j], edgecolor='black',
                    hatch=PROTOCOL_HATCHES[j], label=protocol
                )
                for j, protocol in enumerate(PROTOCOL_ORDER)
            ]
            ax.legend(
                handles=legend_elements, loc='upper center',
                bbox_to_anchor=(0.5, 1.45), ncol=4, fontsize=7,
                frameon=True, edgecolor='black', fancybox=False
            )
        
        ax.grid(axis='y', linestyle='--', alpha=0.7, zorder=0)
        ax.set_axisbelow(True)
        
        # Y-label only on first plot
        if i == 0:
            ax.set_ylabel(
                'Normalized\nExecution Time', fontsize=LABELFONTSIZE,
                labelpad=LABELPAD
            )
        else:
            ax.set_ylabel('')
            ax.set_yticklabels([])
        
        ax.yaxis.set_major_locator(ticker.MultipleLocator(0.2))
        ax.yaxis.set_minor_locator(ticker.MultipleLocator(0.1))
        
        # Benchmark name as x-label
        ax.set_xlabel(title, fontsize=LABELFONTSIZE, labelpad=0, weight='bold')
        if i == 3:
            ax.xaxis.set_label_coords(0.5, -0.02)
        else:
            ax.xaxis.set_label_coords(0.5, -0.35)
    
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
    
    print(f"\nPlots saved to: {PLOT_DIR}")
    plt.close()


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
