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

# Functional
alias cn="copy-notes" # Takes one number arg. Copies nth-line from notes file to clipboard.
alias rn="run-notes" # Takes one number arg. Runs nth-line from notes file to clipboard.
alias gbn="git status | head -n 1 | tr -s ' ' | cut -d ' ' -f 3" # Returns branch name.

alias cdt="cd ~/Source/TV"
alias cdw="cd ~/Source/Web"

alias psql="'/Applications/Postgres.app/Contents/Versions/9.5/bin'/psql -p5432"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NVM_DIR="/Users/RoyPfaffman/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm


function get-note {
  # if no line number is provided, set default to 1.
  if [ -z "$1" ]; then 1=1; fi

  # if 'notes' exist in current directory, use it.
  # otherwise, grab 'notes' in the home directory.
  if [ -r notes ]; then
      note_path="notes"
  elif [ -r $home/notes ]; then
      note_path=$home/notes
  fi

  # copy the line number, pipe it into pbcopy, and echo a response.
  string="$(cat $note_path | head -n $1 | tail -n 1)"
  echo $string
}

# Accepts a number as arg, specifying line number to copy in
# local notes file. If local notes file doesn't exist, looks
# at ~/notes.
function copy-notes {
  # copy the line number, pipe it into pbcopy, and echo a response.
  copied=$(get-note $1)
  echo $copied | pbcopy
  echo "copied: $copied"
}

function run-notes {
  # run the line number
  command_string=$(get-note $1)
  eval $command_string
}

# ruby and rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# disable cmd-ctrl-d for dictionary
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 70 '<dict><key>enabled</key><false/></dict>'
