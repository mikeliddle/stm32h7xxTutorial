#!/bin/bash

# Function to invoke Arduino build
invoke_build() {
    
}

# Check if python3 is installed
if ! command -v python3 &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y python3.12
fi

# Check if cpplint is installed
if ! command -v cpplint &> /dev/null; then
    python3 -m pip install cpplint
fi

# Check if pre-commit hook is set up
if [ ! -f .git/hooks/pre-commit ] || ! diff -q scripts/pre-commit .git/hooks/pre-commit &> /dev/null; then
    cp scripts/pre-commit .git/hooks/pre-commit
    chmod +x .git/hooks/pre-commit
fi

# Set WORKSPACE_ROOT environment variable
export WORKSPACE_ROOT=$(pwd)

# Create alias for build
alias build=invoke_build