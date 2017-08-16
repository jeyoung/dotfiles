if version >= 800
	source $VIMRUNTIME/defaults.vim
    packadd! matchit
endif

set visualbell

set hidden 
set laststatus=2

set autowrite
set undodir^=$TMP undolevels=5000 undofile 
set updatecount=10

set hlsearch incsearch ignorecase smartcase

set encoding=utf-8 renderoptions=type:directx,taamode:1 
set guifont=Lucida\ Console:h10

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set autoindent smartindent

set linebreak
let &showbreak="¬ "

nnoremap <silent> <F1>  :ls<Cr>:b<Space>
nnoremap <silent> <BS>  :nohlsearch<Cr>

nnoremap <silent> <A-Left>  :bprevious<Cr>
nnoremap <silent> <A-Right> :bnext<Cr>

nnoremap <silent> <A-Up>    :cprevious<Cr>
nnoremap <silent> <A-Down>  :cnext<Cr>

inoremap <silent> <C-Enter> <Esc>

set grepprg=\"C:\Utilities\ripgrep\rg.exe\"\ --vimgrep\ --smart-case\ --glob\ !tags\ --glob\ !*.layout\ --glob\ !*.temp
set grepformat^=%f:%l:%c:%m

syntax off
