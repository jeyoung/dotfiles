set shiftwidth=4 softtabstop=-1 ignorecase smartcase incsearch hlsearch visualbell smarttab expandtab shortmess-=S updatetime=100 spelllang=en_gb wildmenu wildmode=longest:list,full completeopt-=preview
set grepprg=rg\ -i\ --vimgrep

set hidden undofile undodir=~/.vim/undo spellfile=~/.vim/custom.utf8.add directory=~/.vim/swap

set showmatch smartindent autoindent
set listchars=tab:>.,trail:.
let &showbreak="+++ "

nnoremap <silent><BS> :nohl<Cr>
nnoremap <leader>b :ls<Cr>:b

nnoremap <leader>e :Ex<Space>

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

nnoremap <leader>p "+gp
vnoremap <leader>p "+gp
nnoremap <leader>P "+gP

nnoremap <C-j> gj
vnoremap <C-j> gj
nnoremap <C-k> gk
vnoremap <C-k> gk

nnoremap <F8> :cnext<Cr>zz
nnoremap <S-F8> :cprevious<Cr>zz

nnoremap <C-PageUp> :bprevious<Cr>
nnoremap <C-PageDown> :bnext<Cr>

vnoremap < <gv
vnoremap > >gv

nnoremap <F7> :set spell! spell?<Cr>

nnoremap <leader>a ggVG

nnoremap <leader>e :Ex<Space>

augroup custom_filetypes
    au!
    au! BufRead *.log setlocal buftype=nowrite undolevels=10 noswapfile autoread syntax=OFF
    au! BufRead Makefile,*.mk setlocal shiftwidth=8
    au! BufRead *.bas,*.BAS setlocal filetype=basic
augroup END

highlight WhitespaceEol ctermbg=red guibg=red
match WhitespaceEol /\s\+$/

filetype indent on
filetype indent plugin on
