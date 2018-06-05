if version >= 800
    source $VIMRUNTIME/defaults.vim
    packadd! matchit
endif

set directory=$TMP
set path& | let &path .= "**"

set wildignore+=**/obj*/**,**/bin*/**,**/node_modules/**
set wildmode=full
set wildcharm=<C-z>

if has('gui')
    set guioptions-=T
    set guioptions-=L
    set guioptions-=m
    set guioptions-=e
endif

augroup change_number_colour
    au!
    au VimEnter * highlight LineNr guifg=gray
augroup END

set visualbell

set hidden
set laststatus=1

set foldlevel=999
set foldmethod=indent

set autowrite
set undodir^=$TMP undolevels=5000 undofile
set updatecount=10

set incsearch ignorecase smartcase hlsearch

set encoding=utf-8 renderoptions=type:directx,taamode:1
set guifont=Consolas:h12

set shiftwidth=4 softtabstop=-1 expandtab smarttab

set listchars=tab:»\ ,trail:·,precedes:<,extends:>,nbsp:+
set list

set sidescroll=1 sidescrolloff=10
set wrap

set linebreak
let &showbreak="¬ "

set nonumber
set cursorline

set foldlevel=999
set foldmethod=indent

nnoremap <silent> <F1>      :ls<Cr>:b<Space>
nnoremap <silent> <BS>      :nohlsearch<Cr>

nnoremap <silent> <A-Left>  :bprevious<Cr>
nnoremap <silent> <A-Right> :bnext<Cr>

nnoremap <silent> <A-Up>    :cprevious<Cr>
nnoremap <silent> <A-Down>  :cnext<Cr>

inoremap <silent> <C-Enter> <Esc>

set grepprg=\"C:\Utilities\sift\sift.exe\"\ --binary-skip\ --line-number\ --blocksize=4M\ --recursive\ --smart-case\ --exclude-files=tags
set grepformat^=%f:%l:%c:%m

syntax on
