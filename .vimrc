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
set laststatus=1

augroup change_number_colour
    au!
    au VimEnter * highlight LineNr guifg=Grey50
augroup END

set foldmethod=indent foldlevel=999

set viminfofile=~/.viminfo

set incsearch ignorecase smartcase hlsearch
set autoindent

set shiftwidth=4 softtabstop=-1 autoindent expandtab&

set listchars=tab:→\ ,extends:»,precedes:« list

set scrolloff=2 sidescroll=1 sidescrolloff=10 nowrap

set linebreak breakindent
let &showbreak="¬ "

set number

set foldlevel=999
set foldmethod=indent

nnoremap <silent> k gk
nnoremap <silent> j gj

nnoremap <silent> <F1>      :ls<Cr>:b<Space>
nnoremap <silent> <BS>      :nohlsearch<Cr>

nnoremap <silent> <A-Left>  :bprevious<Cr>
nnoremap <silent> <A-Right> :bnext<Cr>

nnoremap <silent> <A-Up>    :cprevious<Cr>
nnoremap <silent> <A-Down>  :cnext<Cr>

nnoremap <leader>c          :set cursorline!<Cr>
nnoremap <leader>l	    :set list!<Cr>:set list?<Cr>
nnoremap <leader>n          :set number!<Cr>
nnoremap <leader>w          :set wrap!<Cr>:set wrap?<Cr>

set grepprg=C:\Utilities\ripgrep\rg.exe\ -nHS\ --max-columns=150\ --glob=!git/*\ --glob=!tags

filetype plugin indent on
