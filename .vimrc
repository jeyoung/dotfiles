set runtimepath+=~/Source/GitHub/vim-ps1

if version >= 800
    source $VIMRUNTIME/defaults.vim
    packadd! matchit
endif

set path&
set path+=**

set directory=$TMP updatecount=10
set undodir^=$TMP undolevels=5000 undofile

set hidden autowrite

set wildignore&
set wildignore+=**/obj,**/bin,**/node_modules
set wildmode=full
set wildcharm=<C-z>

if has('gui')
    set guioptions-=m
    set guioptions-=e
    set guioptions-=L
    set guioptions-=T
    set columns=150 lines=45
endif

set encoding=utf-8 renderoptions=type:directx,taamode:1
set guifont=Consolas:h12

set visualbell
set laststatus=2

augroup change_number_colour
    au!
    au VimEnter * highlight LineNr guifg=Grey50
augroup END

set foldmethod=indent foldlevel=999

set viminfofile=~/.viminfo

set incsearch ignorecase smartcase hlsearch
set autoindent

set shiftwidth=4 softtabstop=-1 autoindent expandtab

set listchars=tab:→\ ,trail:·,extends:»,precedes:« list

set scrolloff=2 sidescroll=1 sidescrolloff=10 nowrap

set linebreak breakindent
let &showbreak="¬ "

set nonumber

set foldlevel=999
set foldmethod=indent

nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> 0 g0
nnoremap <silent> $ g$

nnoremap <F1>               :ls<Cr>:b
nnoremap <silent> <F2>      :b#<Cr>
nnoremap <silent> <BS>      :nohlsearch<Cr>

nnoremap <silent> <A-Left>  :bprevious<Cr>
nnoremap <silent> <A-Right> :bnext<Cr>

nnoremap <silent> <A-Up>    :cprevious<Cr>
nnoremap <silent> <A-Down>  :cnext<Cr>

nnoremap <silent> <leader>c :set cursorline!<Cr>
nnoremap <silent> <leader>l :set list!<Cr>:set list?<Cr>
nnoremap <silent> <leader>n :set number!<Cr>
nnoremap <silent> <leader>w :set wrap!<Cr>:set wrap?<Cr>
nnoremap <silent> <leader>s :set spell!<Cr>:set spell?<Cr>

nnoremap <silent> <leader>. :s/\v\s+$//g<Cr>
vnoremap <silent> <leader>. :s/\v\s+$//g<Cr>

filetype plugin indent on

set lazyredraw

set grepprg=C:\Utilities\ripgrep\rg.exe\ -nHS\ --max-columns=150\ --glob=!git/*\ --glob=!tags
