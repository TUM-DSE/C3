#!/bin/bash
set -eo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

"$SCRIPT_DIR/create-conf-x86.sh"

"$SCRIPT_DIR/create-conf-arm.sh"

"$SCRIPT_DIR/create-conf-litmus.sh"

echo "Configurations completed successfully"