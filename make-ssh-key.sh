#!/bin/sh
set -o xtrace
echo "Generating a new SSH key for GitHub..."

# Generating a new SSH key
ssh-keygen -t ed25519 -C "semenko@alum.mit.edu" -f ~/.ssh/id_ed25519

# Adding your SSH key to the ssh-agent
eval "$(ssh-agent -s)"

if [ "$(uname)" = "Darwin" ]; then
    ssh-add --apple-use-keychain ~/.ssh/id_ed25519
else
    ssh-add ~/.ssh/id_ed25519
fi

gh auth login
