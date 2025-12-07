#!/usr/bin/env python3
"""
plot_fig11.py - Generate Figure 11: Miss Latency Breakdown

Creates a horizontal stacked bar chart for 4 representative applications.
Shows Load, Store, and RMW miss cycles contribution across different latency categories.
Compares MESI-MESI baseline with MESI-CXL-MESI.

Output: data/fig_11/plot/fig11_miss_latency.pdf
"""

import os
import sys
import matplotlib.pyplot as plt
import numpy as np
from matplotlib.patches import Patch

# ============================================================================
# PATHS - Relative to script location
# ============================================================================
SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
REPO_ROOT = os.path.dirname(SCRIPT_DIR)
DATA_DIR = os.path.join(REPO_ROOT, 'data', 'fig_10', 'gem5.output')
OUTPUT_DIR = os.path.join(REPO_ROOT, 'data', 'fig_11', 'plot')

# ============================================================================
# MATPLOTLIB CONFIGURATION - Publication quality
# ============================================================================
plt.rcParams.update({
    'font.family': 'serif',
    'font.size': 10,
    'figure.figsize': (7, 3.5),
    'figure.dpi': 300,
    'savefig.dpi': 300,
    'axes.labelsize': 11,
    'axes.titlesize': 12,
    'xtick.labelsize': 10,
    'ytick.labelsize': 10,
    'legend.fontsize': 9,
    'text.usetex': False,
    'axes.grid': False,
    'grid.alpha': 0.3,
    'grid.linestyle': '-',
    'figure.constrained_layout.use': False,
})

# ============================================================================
# CONFIGURATION
# ============================================================================

# Protocols to compare (baseline vs CXL)
PROTOCOLS = {
    'mesi': 'MESI_unord',
    'cxl': 'MESI_unord_CXL'
}

# 4 representative applications
APPS = [
    {"suite": "splash", "app": "barnes", "display_name": "Barnes"},
    {"suite": "splash", "app": "lu-ncont", "display_name": "LU-Ncont"},
    {"suite": "phoenix", "app": "histogram", "display_name": "Histogram"},
    {"suite": "parsec", "app": "vips", "display_name": "Vips"},
]

# Operation types to analyze
OP_TYPES = ['LD', 'ST', 'RMW_Read', 'Locked_RMW_Read']

# Latency thresholds (in cycles)
LOCAL_THRESHOLD = 150
REMOTE_THRESHOLD = 850

# Colors for latency categories (shades for LD/ST/RMW)
CATEGORY_BASE_COLORS = {
    'local': ['#ffd52e', '#ffc621', '#ffa70f'],      # Yellow shades
    'memory': ['#4caf50', '#2e7d32', '#1e5631'],     # Green shades
    'remote': ['#a3b7ca', '#7593af', '#476f95'],     # Blue shades
}

# Hatching patterns for operation types
OP_HATCHES = {
    'LD': '',              # No hatch (solid)
    'ST': '///',           # Normal diagonal hatches
    'RMW': 'xxx',          # Cross hatches
}

# Gray shades for legend
OP_GRAY_COLORS = {
    'LD': '#f0f0f0',
    'ST': '#dbdbdb',
    'RMW': '#adadad',
}

# Protocol names for display
PROTOCOL_NAMES = {
    'mesi': 'MESI\nMESI\nMESI',
    'cxl': 'MESI\nCXL\nMESI'
}

# ============================================================================
# HELPER FUNCTIONS
# ============================================================================

def get_stats_file(suite, app, protocol_key):
    """Get the path to stats.txt for a given suite/app/protocol"""
    protocol_dir = PROTOCOLS[protocol_key]
    return os.path.join(DATA_DIR, suite, app, protocol_dir, 'stats.txt')


def extract_metrics(stats_file, op_type):
    """Extract histogram metrics for a specific operation type"""
    try:
        data = {
            'histogram': [],
            'bucket_size': 0,
            'max_bucket': 0,
            'samples': 0
        }
        
        with open(stats_file, 'r') as f:
            lines = f.readlines()
            
            for line in lines:
                # Extract bucket_size
                if f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::bucket_size" in line:
                    data['bucket_size'] = int(line.split()[1])
                
                # Extract max_bucket
                elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::max_bucket" in line:
                    data['max_bucket'] = int(line.split()[1])
                
                # Extract samples
                elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr::samples" in line:
                    data['samples'] = int(line.split()[1])
                
                # Extract histogram
                elif f"system.caches.RequestType.{op_type}.miss_latency_hist_seqr |" in line:
                    values = []
                    parts = line.split('|')
                    for part in parts[1:-1]:
                        if part.strip():
                            count = int(part.split()[0])
                            values.append(count)
                    data['histogram'] = values
        
        return data if data['histogram'] else None
    
    except Exception as e:
        print(f"    Warning: Error reading {stats_file}: {e}")
        return None


def normalize_histogram(histogram, bucket_size, target_bucket_size):
    """Normalize histogram to target bucket size"""
    if not histogram or bucket_size == target_bucket_size:
        return histogram
    
    if bucket_size < target_bucket_size:
        ratio = target_bucket_size // bucket_size
        new_hist = []
        for i in range(0, len(histogram), ratio):
            new_hist.append(sum(histogram[i:i+ratio]))
        return new_hist
    
    ratio = bucket_size // target_bucket_size
    new_hist = []
    for val in histogram:
        for _ in range(ratio):
            new_hist.append(val / ratio)
    return new_hist


def calculate_latency_contribution(histogram, bucket_size):
    """Calculate total latency contribution categorized by access type"""
    result = {'local': 0, 'memory': 0, 'remote': 0, 'total': 0}
    
    for bucket_idx, count in enumerate(histogram):
        bucket_start = bucket_idx * bucket_size
        bucket_mid = bucket_start + bucket_size / 2
        cycles = count * bucket_mid
        
        if bucket_start < LOCAL_THRESHOLD:
            result['local'] += cycles
        elif bucket_start < REMOTE_THRESHOLD:
            result['memory'] += cycles
        else:
            result['remote'] += cycles
        
        result['total'] += cycles
    
    return result


def analyze_application(app_info):
    """Analyze a single application for both protocols"""
    suite = app_info['suite']
    app = app_info['app']
    display_name = app_info['display_name']
    
    print(f"  Analyzing {display_name}...")
    
    mesi_stats = get_stats_file(suite, app, 'mesi')
    cxl_stats = get_stats_file(suite, app, 'cxl')
    
    # Check if files exist
    if not os.path.exists(mesi_stats):
        print(f"    Warning: MESI stats not found: {mesi_stats}")
        return None
    if not os.path.exists(cxl_stats):
        print(f"    Warning: CXL stats not found: {cxl_stats}")
        return None
    
    result = {
        'display_name': display_name,
        'mesi': {},
        'cxl': {}
    }
    
    # Extract data for each operation type
    for op_type in OP_TYPES:
        mesi_data = extract_metrics(mesi_stats, op_type)
        cxl_data = extract_metrics(cxl_stats, op_type)
        
        if not mesi_data or not cxl_data:
            continue
        
        # Normalize to same bucket size
        max_bucket_size = max(mesi_data['bucket_size'], cxl_data['bucket_size'])
        mesi_hist = normalize_histogram(mesi_data['histogram'], mesi_data['bucket_size'], max_bucket_size)
        cxl_hist = normalize_histogram(cxl_data['histogram'], cxl_data['bucket_size'], max_bucket_size)
        
        result['mesi'][op_type] = {
            'histogram': mesi_hist,
            'bucket_size': max_bucket_size
        }
        result['cxl'][op_type] = {
            'histogram': cxl_hist,
            'bucket_size': max_bucket_size
        }
    
    print(f"    OK")
    return result


def create_plot(all_apps_data):
    """Create horizontal stacked bar chart"""
    print("\nCreating plot...")
    
    # Filter out None entries
    valid_apps = [app for app in all_apps_data if app is not None]
    n_apps = len(valid_apps)
    
    if n_apps == 0:
        print("  Error: No valid data to plot")
        return False
    
    # Calculate MESI baseline total for each app (for normalization)
    app_baselines = []
    for app_data in valid_apps:
        mesi_total = 0
        for op_type in OP_TYPES:
            if op_type in app_data['mesi']:
                hist = app_data['mesi'][op_type]['histogram']
                bucket_size = app_data['mesi'][op_type]['bucket_size']
                contrib = calculate_latency_contribution(hist, bucket_size)
                mesi_total += contrib['total']
        
        if mesi_total == 0:
            print(f"  Error: MESI baseline is zero for {app_data['display_name']}")
            return False
        
        app_baselines.append(mesi_total)
    
    # Setup figure
    fig = plt.figure(figsize=(7, 3))
    ax = plt.axes([0.12, 0.15, 0.82, 0.75])
    ax.set_facecolor('white')
    
    # Bar setup
    bar_height = 0.35
    y_positions = np.arange(n_apps) * 0.8
    
    # Create bars for each app
    for app_idx, app_data in enumerate(valid_apps):
        mesi_baseline = app_baselines[app_idx]
        
        for protocol_idx, protocol_name in enumerate(['mesi', 'cxl']):
            protocol_data = app_data[protocol_name]
            
            # Calculate contributions for LD, ST, RMW
            contributions = {
                'LD': {'local': 0, 'memory': 0, 'remote': 0},
                'ST': {'local': 0, 'memory': 0, 'remote': 0},
                'RMW': {'local': 0, 'memory': 0, 'remote': 0}
            }
            
            for op_type in OP_TYPES:
                if op_type not in protocol_data:
                    continue
                
                hist = protocol_data[op_type]['histogram']
                bucket_size = protocol_data[op_type]['bucket_size']
                contrib = calculate_latency_contribution(hist, bucket_size)
                
                # Map to LD/ST/RMW
                if op_type == 'LD':
                    op_key = 'LD'
                elif op_type == 'ST':
                    op_key = 'ST'
                else:
                    op_key = 'RMW'
                
                # Normalize to MESI baseline
                for category in ['local', 'memory', 'remote']:
                    contributions[op_key][category] += contrib[category] / mesi_baseline
            
            # Draw stacked bar
            y_pos = y_positions[app_idx] + (0.5 - protocol_idx) * bar_height
            left = 0
            
            for category in ['local', 'memory', 'remote']:
                for op_idx, op_key in enumerate(['LD', 'ST', 'RMW']):
                    value = contributions[op_key][category]
                    
                    if value > 0:
                        color = CATEGORY_BASE_COLORS[category][op_idx]
                        hatch = OP_HATCHES[op_key]
                        ax.barh(y_pos, value, bar_height, left=left,
                               color=color, edgecolor='#333333', linewidth=0.3,
                               hatch=hatch, alpha=0.9)
                        left += value
    
    # Add baseline line at x=1.0
    ax.axvline(x=1.0, color='red', linestyle='--', linewidth=0.8, alpha=0.7, zorder=1)
    
    # X-axis
    ax.set_xlabel('Normalized cumulative miss latency (# cycles)', fontsize=11, labelpad=3)
    ax.set_xlim(0, None)
    ax.tick_params(axis='x', labelsize=10, pad=2, length=3, width=0.5, colors='#333333')
    
    # Y-axis
    ax.set_yticks(y_positions)
    ax.set_yticklabels([app['display_name'] for app in valid_apps], fontsize=8, fontweight='bold')
    ax.tick_params(axis='y', labelsize=8, pad=3, length=0, width=0)
    
    # Protocol labels for first app
    first_app_y = y_positions[-1]
    ax.text(0.98, first_app_y + 0.5 * bar_height, 'MESI-MESI-MESI', 
            ha='right', va='center', fontsize=9, fontstyle='italic',
            transform=ax.get_yaxis_transform())
    ax.text(0.98, first_app_y - 0.5 * bar_height, 'MESI-CXL-MESI', 
            ha='right', va='center', fontsize=9, fontstyle='italic',
            transform=ax.get_yaxis_transform())
    
    # Legend - Miss Latency
    legend_latency = []
    latency_labels = {
        'local': 'Low (0-74 ns)',
        'memory': 'Medium (75-400 ns)',
        'remote': 'High (400+ ns)',
    }
    for category in ['local', 'memory', 'remote']:
        color = CATEGORY_BASE_COLORS[category][0]
        legend_latency.append(Patch(facecolor=color, edgecolor='#333333', linewidth=0.3,
                                    label=latency_labels[category]))
    
    # Legend - Instruction types
    legend_operations = []
    for op_key in ['LD', 'ST', 'RMW']:
        hatch = OP_HATCHES[op_key]
        gray_color = OP_GRAY_COLORS[op_key]
        legend_operations.append(Patch(facecolor=gray_color, edgecolor='#333333', linewidth=0.3,
                                       hatch=hatch, label=op_key))
    
    # Create legends
    legend1 = ax.legend(handles=legend_latency, fontsize=8, frameon=False,
                       loc='upper center', bbox_to_anchor=(0.24, 1.13),
                       ncol=3, columnspacing=1.0, handletextpad=0.1,
                       title='Miss Latency', title_fontsize=8)
    legend1.get_title().set_fontweight('bold')
    legend1._legend_box.sep = 0
    ax.add_artist(legend1)
    
    legend2 = ax.legend(handles=legend_operations, fontsize=8, frameon=False,
                       loc='upper center', bbox_to_anchor=(0.80, 1.13),
                       ncol=3, columnspacing=1.0, handletextpad=0.4,
                       title='Instr.', title_fontsize=8)
    legend2._legend_box.sep = 0
    legend2.get_title().set_fontweight('bold')
    
    # Style
    ax.spines['top'].set_visible(False)
    ax.spines['right'].set_visible(False)
    ax.spines['left'].set_linewidth(0.3)
    ax.spines['left'].set_color('#333333')
    ax.spines['bottom'].set_linewidth(0.3)
    ax.spines['bottom'].set_color('#333333')
    
    ax.xaxis.grid(True, linestyle='-', alpha=0.2, linewidth=0.3, color='#333333')
    ax.set_axisbelow(True)
    
    # Save plot
    os.makedirs(OUTPUT_DIR, exist_ok=True)
    output_file = os.path.join(OUTPUT_DIR, 'fig11_miss_latency.pdf')
    plt.savefig(output_file, dpi=300, bbox_inches='tight', pad_inches=0.02)
    print(f"  Saved: {output_file}")
    plt.close()
    
    return True


# ============================================================================
# MAIN
# ============================================================================

def main():
    print("=" * 60)
    print("Figure 11: Miss Latency Breakdown")
    print("=" * 60)
    print(f"Data directory: {DATA_DIR}")
    print(f"Output directory: {OUTPUT_DIR}")
    print()
    
    # Analyze applications
    print("Analyzing applications...")
    all_apps_data = []
    for app_info in APPS:
        app_data = analyze_application(app_info)
        all_apps_data.append(app_data)
    
    # Create plot
    success = create_plot(all_apps_data)
    
    if success:
        print()
        print("=" * 60)
        print("Figure 11 generated successfully!")
        print("=" * 60)
        return 0
    else:
        print()
        print("ERROR: Failed to generate Figure 11")
        return 1


if __name__ == "__main__":
    sys.exit(main())
