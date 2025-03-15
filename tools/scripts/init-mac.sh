#!/bin/zsh

# Function to invoke Arduino build
invoke_build() {
    
}

# make sure dependencies are present

# Check if Homebrew is installed, if not, install it
if ! command -v brew &> /dev/null
then
    echo "Homebrew is not installed. Installing now..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# if vscode is not installed, install it
if ! command -v code &> /dev/null
then
    echo "VSCode is not installed. Please install it from here: https://code.visualstudio.com/docs/setup/mac"
else
    echo "VSCode is already installed."
fi

if ! command -v python3 &> /dev/null
then
    echo "Python3 is not installed. Installing now..."
    brew install python3
else
    echo "Python3 is already installed."
fi

if ! command -v cpplint &> /dev/null
then
    echo "cpplint is not installed. Installing now..."
    brew install cpplint
else
    echo "cpplint is already installed."
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

# Open VSCode
code .