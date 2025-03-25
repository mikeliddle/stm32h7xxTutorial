#!/bin/bash

# Create the new chapter folder by looking at the latest chapter folder and creating a new folder.
# the new folder will be named with the latest chapter number + 1
# the new folder will be created in the repo root directory
# the new folder will be a copy of "Template" folder initially.
# README.md in that folder will be a link to a file in _posts named "YYYY-MM-DD-chapter-NUM.md"

# Find the latest chapter folder
LATEST_CHAPTER=$(ls -d Chapter* 2>/dev/null | sort -V | tail -n 1)
# Extract the latest chapter number and calculate the new chapter number
if [[ -n "$LATEST_CHAPTER" ]]; then
    LATEST_NUM=$(echo "$LATEST_CHAPTER" | grep -o '[0-9]\+')
    NEW_NUM=$((LATEST_NUM + 1))
else
    NEW_NUM=1
fi

echo "Creating new chapter: $NEW_NUM"

# Define the new chapter folder name
NEW_CHAPTER="Chapter${NEW_NUM}"

# Copy the Template folder to the new chapter folder
cp -r Template "$NEW_CHAPTER"

# Create a symbolic link for README.md
POST_FILE="_posts/$(date +%Y-%m-%d)-chapter${NEW_NUM}.md"
touch "$POST_FILE"  # Create the post file if it doesn't exist
ln -s "../$POST_FILE" "$NEW_CHAPTER/README.md"

# Add the new chapter folder to the exclude section in _config.yml
CONFIG_FILE="_config.yml"
if ! grep -q "exclude:" "$CONFIG_FILE"; then
    echo -e "\nexclude:" >> "$CONFIG_FILE"
fi
if ! grep -q "  - $NEW_CHAPTER" "$CONFIG_FILE"; then
    echo "  - $NEW_CHAPTER" >> "$CONFIG_FILE"
fi

echo "New chapter folder '$NEW_CHAPTER' created successfully."