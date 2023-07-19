" Tab and indent
set autoindent cindent smartindent smarttab expandtab

" Search and completion
set grepprg=rg\ -i\ --vimgrep
set ignorecase smartcase incsearch hlsearch

" Wildmenu
set wildmenu wildmode=longest:list,full

" Spelling
set spelllang=en_gb spellfile=~/.vim/custom.utf8.add

" Display
set listchars=tab:>.,trail:.
set shortmess-=S
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

highlight rightMargin term=bold ctermfg=blue guifg=blue
match rightMargin /.\%>80v/

highlight WhitespaceEol ctermbg=red guibg=red
match WhitespaceEol /\s\+$/

" Buffer
set hidden undofile undodir=~/.vim/undo directory=~/.vim/swap

" Shortcuts
nnoremap <silent><BS> :nohl<Cr>

nnoremap <leader>a ggVG
nnoremap <leader>b :ls<Cr>:b
nnoremap <leader>e :Ex<Space>

nnoremap <leader>p "+gp
nnoremap <leader>P "+gP
vnoremap <leader>p "+gp

nnoremap <leader>y "+y
nnoremap <leader>Y "+Y
vnoremap <leader>y "+y

nnoremap <C-j> gj
vnoremap <C-j> gj
nnoremap <C-k> gk
vnoremap <C-k> gk

nnoremap <C-PageDown> :bnext<Cr>
nnoremap <C-PageUp> :bprevious<Cr>

nnoremap <F5> G5k:e<Cr>zt

nnoremap <F7> :set spell! spell?<Cr>

nnoremap <F8> :cnext<Cr>zz
nnoremap <S-F8> :cprevious<Cr>zz

vnoremap < <gv
vnoremap > >gv

" Filetypes
filetype plugin on
filetype plugin indent on
syntax on

