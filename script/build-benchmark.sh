#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/build-benchmark-x86.sh"

"$SCRIPT_DIR/build-benchmark-arm.sh"

echo "Both builds completed successfully"