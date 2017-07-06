let mapleader=","
map ; :

" pathogen plugins
call pathogen#infect()
call pathogen#helptags()

" set up FZF (fuzzy finder)
set rtp+=~/.fzf
map <C-T> :FZF<CR>

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

" Display line/col numbers in lower right
set ruler


" MAXIMIZING AND MINIMIZING
" displaying all windows
" use ctrl-w o to close all others
" and this command to bring them back
map <C-w>O :vertical ball<cr>

" NERDTree setup
nmap <leader>n :NERDTreeFind<CR> 
nmap <leader>m :NERDTreeToggle<CR> 

nmap <leader>w viWy:!open <C-r>"<CR>

" Solarized theme setup
syntax enable
set background=dark
colorscheme solarized
let g:solarized_termcolors=256

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
map <leader>z :set foldmethod=indent<CR>
" select/comment chunks
map <leader>a V$%
map <leader>c <C-v>I//<C-c>
" delete all console.log's
map <leader>d :%s/^.*console\.log.*\n//gc<CR>
" go to mark and scroll to top
map <leader>, :call GoToMark()<CR>

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

" hitting a single key will go to associated marker and scroll top
function GoToMark()
  let mark = nr2char(getchar())
  call feedkeys("`" . mark . "zt")
endfunction

" set foldmethod=indent

" for syntastic
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
let g:syntastic_scss_checkers      = [ 'sass_lint' ]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

