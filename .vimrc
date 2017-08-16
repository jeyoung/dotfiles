if version >= 800
	source $VIMRUNTIME/defaults.vim
    packadd! matchit
endif

set visualbell

set hidden 
set laststatus=2

set undofile undodir^=$TMP

set hlsearch incsearch ignorecase smartcase

set encoding=utf-8 renderoptions=type:directx,taamode:1 
set guifont=Cousine:h10

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
set autoindent smartindent

set linebreak
let &showbreak="¬ "

nnoremap <silent> <F1>  :ls<Cr>:b<Space>
nnoremap <silent> <F2>  :nohlsearch<Cr>

set grepprg=\"C:\Utilities\ripgrep\rg.exe\"\ --vimgrep\ --smart-case\ --glob\ !tags\ --glob\ !*.layout\ --glob\ !*.temp\ --glob\ !*.jfm\ --glob\ !*.swp
set grepformat^=%f:%l:%c:%m
