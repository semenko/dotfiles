# Path to your dotfiles.
export DOTFILES=$HOME/.dotfiles

# Load aliases
source $HOME/.dotfiles/aliases.zsh
[ -f "$HOME/.secrets" ] && source $HOME/.secrets

# LOTS OF HISTORY
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE='32768'
export SAVEHIST="${HISTSIZE}"
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LANG=en_US.UTF-8

export EDITOR=emacs

export CLICOLOR=1
export COLORTERM=truecolor

export PYTHONIOENCODING='UTF-8'

# Highlight section titles in manual pages.
export LESS_TERMCAP_md=$'\e[1;33m'

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

if [[ "$(uname)" == "Darwin" ]]; then
    export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
    export HOMEBREW_NO_ENV_HINTS=TRUE

    export CONDA_AUTO_ACTIVATE_BASE=false

    # >>> mamba initialize (lazy) >>>
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
fi

eval "$(starship init zsh)"

[[ -d "$HOME/.antigravity/antigravity/bin" ]] && export PATH="$HOME/.antigravity/antigravity/bin:$PATH"
