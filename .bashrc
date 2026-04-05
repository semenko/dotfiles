# Dotfiles
export DOTFILES=$HOME/.dotfiles

# Load aliases (compatible with bash)
source $HOME/.dotfiles/aliases.zsh
[ -f "$HOME/.secrets" ] && source $HOME/.secrets

# History
export HISTFILE="$HOME/.bash_history"
export HISTSIZE=32768
export HISTFILESIZE="${HISTSIZE}"
export HISTCONTROL='ignoreboth'

# Locale
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=emacs
export CLICOLOR=1
export COLORTERM=truecolor
export PYTHONIOENCODING='UTF-8'

# Highlight section titles in manual pages.
export LESS_TERMCAP_md=$'\e[1;33m'

# Don't clear the screen after quitting a manual page.
export MANPAGER='less -X'

export PATH=~/.local/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv &>/dev/null; then
    eval "$(pyenv init -)"
fi

eval "$(starship init bash)"

[[ -d "$HOME/.antigravity/antigravity/bin" ]] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
