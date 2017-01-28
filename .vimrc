if version >= 800
	source $VIMRUNTIME/defaults.vim
endif

set hidden 
set undofile

set encoding=utf-8 renderoptions=type:directx,taamode:1 
set guifont=Consolas:h13

set tabstop=4 softtabstop=4 shiftwidth=4 expandtab smarttab
let &showbreak="¬ "

set grepprg=\"C:\Utilities\ripgrep\rg.exe\"\ --vimgrep\ --smart-case\ --glob\ !tags\ --glob\ !*.layout\ --glob\ !*.temp
set grepformat^=%f:%l:%c:%m

nnoremap <silent> <F1>  :ls<Cr>:b<Space>
