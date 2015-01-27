let mapleader=","
map ; :

" pathogen plugins
call pathogen#infect()
call pathogen#helptags()

" appearance
set t_Co=256
colorscheme apprentice

set clipboard=unnamed           " system clipboard
set noswapfile                  " swap files are stupid
set mouse=a                     " enable mouse
set nocompatible                " choose no compatibility with legacy vi
syntax enable
syntax on
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set number                      " use line numbers
au BufRead,BufNewFile *.mustache setfiletype html

" Whitespace
set nowrap                      " don't wrap linesG
set expandtab                   " use spaces, not tabs (optional)
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set backspace=indent,eol,start  " backspace through everything in insert mode
set autoindent
set foldmethod=manual

" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
" Press space to clear last search highlight
map <Space> :noh<cr>


" MAXIMIZING AND MINIMIZING
" displaying all windows
" use ctrl-w o to close all others
" and this command to bring them back
map <C-w>O :vertical ball<cr>

" NERDTree setup
nmap <leader>n :NERDTreeFind<CR> 
nmap <leader>m :NERDTreeToggle<CR> 

" Use Ag from Ctrl-p
" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.  Lightning fast and respect .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" replace all instances of highlighted string
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" open file on current line in separate pane
map <leader>F 0v$"fy:vsp <C-r>f<CR><C-w>l
" open file on current line in current pane
map <leader>f 0v$h"fy:e! <C-r>f<CR>
" open new vertical pane listing uncommitted
map <leader>g :call Gdiff()<CR>
map <leader>G :call Gshow()<CR>
map <leader>s :call AutoSize()<CR>

function Gshow()
  exec ":vnew"
  exec "r ! git show --name-only"
endfunction

function Gdiff()
  exec ":vnew"
  exec "r ! git diff --name-only"
endfunction

function AutoSize()
  exec "resize " . line("$")
  call feedkeys("gg")
endfunction

