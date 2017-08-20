# opens all files with given string in vim, split vertically
function vim-search {
  if [ -z "$*" ]; then
    echo "Please provide a search string"
    return
  fi
  vim -O $(ag -ril $1) +/$1
}

# opens all files with given string in vim and does a global confirm replace
function vim-search-replace {
  if [ -z "$*" ]; then
    echo "Please provide a search string"
    return
  fi
  vim $(ag -ril $1) +"bufdo %s/$1/$2/gc | update"
}
