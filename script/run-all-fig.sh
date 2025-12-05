#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/run-fig9.sh"

"$SCRIPT_DIR/run-fig10.sh"

"$SCRIPT_DIR/run-fig11.sh"

echo "All figures generated successfully"