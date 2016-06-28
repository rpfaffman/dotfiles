#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Set default editor.
export EDITOR=/usr/local/bin/mvim

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias v="mvim -v"
alias ls="ls -laG"
alias s="ag -ri"
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gp="git push"
alias gs="git status"
alias gr="git reset"
alias gco="git checkout"
alias gl="git log"
alias gm="git checkout master"
alias gb="git branch"
alias gbn="git status | head -n 1 | tr -s ' ' | cut -d ' ' -f 3" # Returns branch name.

# Notes
. ~/scripts/notes.sh
alias cn="copy-note" # Takes one number arg. Copies nth-line from notes file to clipboard.
alias rn="run-note" # Takes one number arg. Runs nth-line from notes file to clipboard.
alias rn="open-note" # Takes one number arg. Attempts to open URL or file on the given file number.

alias cdt="cd ~/Source/TV"
alias cdw="cd ~/Source/Web"

alias psql="'/Applications/Postgres.app/Contents/Versions/9.5/bin'/psql -p5432"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/Users/RoyPfaffman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


# ruby and rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# disable cmd-ctrl-d for dictionary
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'

