set runtimepath+=~\Source\GitHub\vim-ps1

if version >= 800
    source $VIMRUNTIME/defaults.vim
    packadd! matchit
endif

set hidden
set writebackup backupdir^=~/vimfiles/backup
set directory^=~/vimfiles/swap
set undofile undodir^=~/vimfiles/undo
set viminfofile=~/vimfiles/viminfo

set wildmenu&

if has('gui_running')
    set guioptions-=m
    set guioptions-=e
    set guioptions-=L
    set guioptions-=T
    set lines=40 columns=100
endif

set ruler visualbell ttyfast lazyredraw

set encoding=utf-8 renderoptions=taamode:2
set guifont=Consolas:h11

set incsearch ignorecase smartcase nohlsearch

set softtabstop=-1 autoindent

set scrolloff=2 sidescroll=1 sidescrolloff=10
set listchars=tab:→\ ,trail:·,extends:»,precedes:« list
set linebreak
let &showbreak=""

set foldlevel=999

set diffopt+=algorithm:patience,indent-heuristic

augroup change_number_colour
    au!
    au VimEnter    * highlight LineNr guifg=Grey
    au Colorscheme * highlight LineNr guifg=Grey
augroup END

inoremap <F1>               <Nop>

inoremap <C-S>              <Esc>:update<Cr>
nnoremap <C-S>              <Esc>:update<Cr>

nnoremap <F1>               :ls<Cr>:b
nnoremap <silent> <F2>      :b#<Cr>

nnoremap <silent> <BS>      :set hlsearch!<Cr>

nnoremap <silent> <A-Left>  :bprevious<Cr>
nnoremap <silent> <A-Right> :bnext<Cr>

nnoremap <silent> <A-Up>    :cprevious<Cr>
nnoremap <silent> <A-Down>  :cnext<Cr>

nnoremap <silent> <leader>c :set cursorline!<Cr>
nnoremap <silent> <leader>l :set list!<Cr>:set list?<Cr>
nnoremap <silent> <leader>n :set number!<Cr>
nnoremap <silent> <leader>w :set wrap!<Cr>:set wrap?<Cr>
nnoremap <silent> <leader>s :set spell!<Cr>:set spell?<Cr>

nnoremap <silent> <leader>. @:
vnoremap <silent> <leader>. @:

nnoremap <silent> <leader>y "*y
vnoremap <silent> <leader>y "*y
nnoremap <silent> <leader>Y "*Y

nnoremap <silent> <leader>p "*p
vnoremap <silent> <leader>p "*p
nnoremap <silent> <leader>P "*P

nnoremap <silent> <leader>f :echo expand('%:p')<CR>

filetype plugin indent on

set grepprg=C:\Utilities\ripgrep\rg.exe\ --vimgrep\ --smart-case\ -g\ \"!tags\"
