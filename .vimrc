if version >= 800
	source $VIMRUNTIME/defaults.vim
    packadd! matchit
endif

set wildignore+=**/obj*/**,**/bin*/**,tags
set wildmode=full

if has('gui')
    set guioptions-=l
    set guioptions-=L
    set guioptions-=r
    set guioptions-=m
    set guioptions-=T
    set guioptions-=e
    set columns=140 lines=50
endif

if &diff
    set columns=9999 lines=9999
endif

set visualbell

set hidden 
set number
set laststatus=1

set autowrite
set undodir^=$TMP undolevels=5000 undofile 
set updatecount=10

set directory=$TMP
set path& | let &path .= "**"

set hlsearch incsearch ignorecase smartcase

set encoding=utf-8 renderoptions=type:directx,taamode:1 
set guifont=Fira\ Mono:h10

set shiftwidth=4 softtabstop=-1 expandtab smarttab
set autoindent smartindent

set linebreak
let &showbreak="¬ "

set cursorline

nnoremap <silent> <F1>  :ls<Cr>:b<Space>
nnoremap <silent> <BS>  :nohlsearch<Cr>

nnoremap <silent> <A-Left>  :bprevious<Cr>
nnoremap <silent> <A-Right> :bnext<Cr>

nnoremap <silent> <A-Up>    :cprevious<Cr>
nnoremap <silent> <A-Down>  :cnext<Cr>

inoremap <silent> <C-Enter> <Esc>

set grepprg=\"C:\Utilities\sift\sift.exe\"\ --line-number\ --smart-case\ --recursive\ --blocksize=4M\ --exclude-files=tags
set grepformat^=%f:%l:%c:%m

syntax on
