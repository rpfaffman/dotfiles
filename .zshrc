# Set default editor.
export EDITOR=/usr/local/bin/mvim

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
alias v="mvim -v"
alias emacs="/usr/local/Cellar/emacs/24.5/bin/emacs -nw"
alias e="emacs"
alias ls="ls -laG"
alias s="ag -ri"
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gca="git commit --amend --no-edit"
alias gcp="git cherry-pick"
alias gd="git diff"
alias gp="git push"
function gpfo { git push -f origin $(gbn) }
alias gpum="git pull upstream master"
alias grm="git checkout master; git pull upstream master; git checkout -; git rebase master"
alias gs="git status"
alias gr="git reset"
alias grhh="git reset --hard head"
alias gco="git checkout"
alias gl="git log"
alias gm="git checkout master"
alias gb="git branch"
alias gbn="git status | head -n 1 | tr -s ' ' | cut -d ' ' -f 3" # Returns branch name.
alias gmf="git status | grep modified | tr -s ' ' | cut -d ' ' -f 2" # Returns list of modified files
alias j="jira"
alias jo="jira open"
alias jst="jira -s 'to do'"
alias jsi="jira -s 'in progress'"
alias jsti="jira -s 'to do','in progress' -o status"
function jt { jira transition $(gbn) $1 } # shortcut for transitioning current branch's ticket
alias jtt="jt 'to do'"
alias jti="jt 'in progress'"
function ka { for x in $(ps aux | s $1 | tr -s ' ' | cut -d ' ' -f 2); do kill -9 $x; done }
alias t="tmux"
alias tls="tmux list-sessions"

# notes
. ~/scripts/notes.sh
alias n="cat -n notes" # Opens notes file for editing.
alias cn="copy-note" # Takes one number arg. Copies nth-line from notes file to clipboard.
alias r="run-note" # Takes one number arg. Runs nth-line from notes file.
alias on="open-note" # Takes one number arg. Attempts to open URL or file on the given line number.

# vim bash utility scripts
. ~/scripts/vim-util.sh
alias vs="vim-search"
alias vsr="vim-search-replace"
function vw { vim -O $(gmf) } # vim working files

# application aliases
alias psql="'/Applications/Postgres.app/Contents/Versions/9.5/bin'/psql -p5432"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/Users/RoyPfaffman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# ruby and rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# disable cmd-ctrl-d for dictionary
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'

# directory aliases
alias cdt="cd ~/Source/TV"
alias cdw="cd ~/Source/Web"
alias cdat="cd ~/Source/AppleTV"
alias cdd="cd ~/Source/dmx"
alias cddc="cd ~/Source/dmx-companion"

