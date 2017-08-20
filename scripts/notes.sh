# Opens notes file in current directory in vim if it exists.
# If it doesn't, opens ~/notes.
function notes {
  if [ -r notes ]; then
      note_path="notes"
  elif [ -r $home/notes ]; then
      note_path=$home/notes
  fi

  mvim -v $note_path
}

# Accepts a number as arg, specifying line number to copy in
# local notes file. If local notes file doesn't exist, looks
# at ~/notes.
function get-note {
  # if no line number is provided, set default to 1.
  if [ -z "$1" ]; then 1=1; fi

  # if 'notes' exist in current directory, use it.
  # otherwise, grab 'notes' in the home directory.
  if [ -r notes ]; then
    note_path="notes"
  elif [ -r $HOME/notes ]; then
    note_path=$HOME/notes
  fi

  # copy the line number, pipe it into pbcopy, and echo a response.
  string="$(cat $note_path | head -n $1 | tail -n 1)"
  echo $string
}

function copy-note {
  # copy the line number, pipe it into pbcopy, and echo a response.
  copied=$(get-note $1)
  echo $copied | pbcopy
  echo "copied: $copied"
}

function run-note {
  eval $(get-note $1)$2
}

function open-note {
  open $(get-note $1)
}

