#!/bin/bash

# Check existing Git username
current_username=$(git config --global user.name)
current_email=$(git config --global user.email)

# Set username if not already set
if [ -z "$current_username" ]; then
    read -p "Enter your Git username: " git_username
    git config --global user.name "$git_username"
    echo "Git username set to: $git_username"
else
    echo "Git username already set to: $current_username"
fi

# Set email if not already set
if [ -z "$current_email" ]; then
    read -p "Enter your Git email: " git_email
    git config --global user.email "$git_email"
    echo "Git email set to: $git_email"
else
    echo "Git email already set to: $current_email"
fi

echo "Setting default branch to main..."
git config --global init.defaultBranch main
echo "Ok."
