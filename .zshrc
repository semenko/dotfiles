# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Load aliases
source $HOME/.dotfiles/aliases.zsh
[ -f "$HOME/.secrets" ] && source $HOME/.secrets

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="dd/mm/yyyy"

# LOTS OF HISTORY -semenko
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE='32768'
export HISTFILESIZE="${HISTSIZE}"
setopt EXTENDED_HISTORY
# Omit duplicates and commands that begin with a space from history.
export HISTCONTROL='ignoreboth'

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=emacs

export CLICOLOR=1

export PYTHONIOENCODING='UTF-8'

# Highlight section titles in manual pages.
export LESS_TERMCAP_md="${yellow}"

# Don’t clear the screen after quitting a manual page.
export MANPAGER='less -X'

# Avoid issues with `gpg` as installed via Homebrew.
# https://stackoverflow.com/a/42265848/96656
export GPG_TTY=$(tty)

export PATH=~/.local/bin:$PATH
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
pyenv() {
    unset -f pyenv
    eval "$(command pyenv init -)"
    pyenv "$@"
}

export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

export HOMEBREW_NO_ENV_HINTS=TRUE

eval "$(starship init zsh)"

export CONDA_AUTO_ACTIVATE_BASE=false

# >>> mamba initialize >>>
mamba() {
    unset -f mamba conda
    export MAMBA_EXE='/opt/homebrew/Caskroom/miniforge/base/bin/mamba';
    export MAMBA_ROOT_PREFIX='/opt/homebrew/Caskroom/miniforge/base';
    __mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
    if [ $? -eq 0 ]; then
        eval "$__mamba_setup"
    else
        alias mamba="$MAMBA_EXE"
    fi
    unset __mamba_setup
    mamba "$@"
}
conda() {
    mamba "$@"
}
# <<< mamba initialize <<<

# Added by Antigravity
export PATH="/Users/semenko/.antigravity/antigravity/bin:$PATH"
