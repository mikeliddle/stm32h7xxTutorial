#!/bin/bash

# Function to invoke STM32 build
invoke_build() {
    build
}

invoke_newChapter() {
    ./tools/scripts/newChapter.sh
}

# Check if python3 is installed
if ! command -v python3 &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y python3
fi

if ! command -v pip &> /dev/null; then
    sudo apt-get install -y python3-pip
fi

# Check if cpplint is installed
if ! command -v cpplint &> /dev/null; then
    sudo apt-get install cpplint
fi

# Check if pre-commit hook is set up
if [ ! -f .git/hooks/pre-commit ] || ! diff -q tools/hooks/pre-commit .git/hooks/pre-commit &> /dev/null; then
    cp tools/hooks/pre-commit .git/hooks/pre-commit
    chmod +x .git/hooks/pre-commit
fi

# Set WORKSPACE_ROOT environment variable
export WORKSPACE_ROOT=$(pwd)

# Create alias for build
alias build=invoke_build
alias nc=invoke_newChapter
alias newChapter=invoke_newChapter
