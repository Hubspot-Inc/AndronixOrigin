#!/bin/bash

# Enable strict error handling
set -euo pipefail

# Validate PREFIX environment variable
if [ -z "${PREFIX:-}" ]; then
    echo "Error: PREFIX environment variable is not set"
    exit 1
fi

# Check if the target directory exists
if [ ! -d "$PREFIX/etc/apt" ]; then
    echo "Error: $PREFIX/etc/apt directory does not exist"
    exit 1
fi

echo "deb https://termux.mentality.rip/termux-main stable main" > "$PREFIX/etc/apt/sources.list"
echo "Fixed Termux Repositories ✅"
