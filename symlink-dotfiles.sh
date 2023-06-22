#!/bin/bash
set -o xtrace

DOTFILES=${HOME}/.dotfiles

mydotfiles=(".gitconfig" ".zshrc")

for i in "${mydotfiles[@]}"
do
    echo "Symlinking $i"
    ln -Fs "${DOTFILES}/${i}" "${HOME}/${i}"
done


# HTOP subdir
mkdir -p $HOME/.config/htop
ln -Fs ${DOTFILES}/htoprc $HOME/.config/htop/htoprc
