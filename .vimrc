if version >= 800
	source $VIMRUNTIME/defaults.vim
endif

set hidden
set visualbell

set encoding=utf-8 renderoptions=type:directx,taamode:1
set guifont=Liberation\ Mono:h11

set tabstop=4 softtabstop=4 shiftwidth=4
set sidescroll=5 listchars+=tab:→\ ,precedes:«,extends:»
let &showbreak="¬ "
set wrap linebreak

set grepprg=\"C:\Utilities\ripgrep\rg.exe\"\ --vimgrep\ --smart-case\ --glob\ !tags\ --glob\ !*.layout\ 
set grepformat^=%f:%l:%c:%m

nnoremap <silent> <F1> :set hls!<Cr>
nnoremap <silent> <F2> :set wrap! list!<Cr>
