set runtimepath+=~\Source\GitHub\vim-ps1

if version >= 800
    source $VIMRUNTIME/defaults.vim
    packadd! matchit
endif

set directory=$TMP
set path&
set path+=**

set wildignore&
set wildignore+=**/obj,**/bin,**/node_modules
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

set viminfofile=.viminfo

set incsearch ignorecase smartcase hlsearch
set autoindent

set encoding=utf-8 renderoptions=type:directx,taamode:1
set guifont=Consolas:h12

set shiftwidth=4 softtabstop=-1 expandtab
set autoindent

set listchars&
set nolist

set sidescroll=1 sidescrolloff=10
set wrap

set linebreak
let &showbreak="¬ "

set number

set foldlevel=999
set foldmethod=indent

nnoremap <silent> <F1>      :ls<Cr>:b<Space>
nnoremap <silent> <BS>      :nohlsearch<Cr>

nnoremap <silent> <A-Left>  :bprevious<Cr>
nnoremap <silent> <A-Right> :bnext<Cr>

nnoremap <silent> <A-Up>    :cprevious<Cr>
nnoremap <silent> <A-Down>  :cnext<Cr>

nnoremap <leader>c          :set cursorline!<Cr>

inoremap <silent> <C-Enter> <Esc>

syntax on
filetype plugin indent on

set spell
