#!/bin/sh
set -o xtrace
echo "Generating a new SSH key for GitHub..."

# Generating a new SSH key
ssh-keygen -t ed25519 -C "semenko@alum.mit.edu" -f ~/.ssh/id_ed25519

# Adding your SSH key to the ssh-agent
eval "$(ssh-agent -s)"

echo "Host *\n AddKeysToAgent yes\n UseKeychain yes\n IdentityFile ~/.ssh/id_ed25519" | tee ~/.ssh/config

ssh-add --apple-use-keychain ~/.ssh/id_ed25519

# Adding your SSH key to your GitHub account
echo "running pbcopy 'pbcopy < ~/.ssh/id_ed25519.pub' -- go paste that into GitHub"
pbcopy < ~/.ssh/id_ed25519.pub
