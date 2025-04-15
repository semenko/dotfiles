#!/bin/sh
set -o xtrace

echo "Setting up your Mac..."

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile
brew cleanup

# Set macOS preferences - we will run this last because this will reload the shell
source ./macos-prefs

# Time to make symlinks
DOTFILES=${HOME}/.dotfiles

ln -Fs "${DOTFILES}/.gitconfig" "${HOME}/.gitconfig"
ln -Fs "${DOTFILES}/.zshrc" "${HOME}/.zshrc"
ln -Fs "${DOTFILES}/config-ssh" "${HOME}/.ssh/config"

# HTOP subdir
mkdir -p $HOME/.config/htop
ln -Fs ${DOTFILES}/htoprc $HOME/.config/htop/htoprc

###
# Open our new apps to configure them
open -a "Google Chrome Beta"
open -a "Google Drive"
open -a "Microsoft Word"
open -a "Rectangle"
open -a "Stats"
open -a "Tailscale"
