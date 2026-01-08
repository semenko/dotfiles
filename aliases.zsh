# Shortcuts
alias update='sudo softwareupdate -i -a; brew update; brew upgrade; brew cleanup; mamba update --all'

# brew upgrade --cask

alias copyssh="pbcopy < $HOME/.ssh/id_ed25519.pub"

alias reloaddns="dscacheutil -flushcache && sudo killall -HUP mDNSResponder"
alias l="/opt/homebrew/opt/coreutils/libexec/gnubin/ls -AhlFo --color --group-directories-first"
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
alias c="clear"

alias zcat=gzcat

# Git
alias status="git status"
alias gl="git log --oneline --decorate --color"
alias amend="git add . && git commit --amend --no-edit"
alias commit="git commit . -m"
alias diff="git diff"
alias force="git push --force-with-lease"
alias nuke="git clean -df && git reset --hard"
alias pop="git stash pop"
alias pull="git pull"
alias push="git push"
alias resolve="git add . && git commit --no-edit"
alias stash="git stash -u"
alias unstage="git restore --staged ."
alias wip="git commit -m 'wip'"

alias ..="cd .."
