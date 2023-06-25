set shiftwidth=4 softtabstop=-1 ignorecase smartcase incsearch hlsearch visualbell smarttab shortmess-=S spelllang=en_gb wildmenu wildmode=longest:list,full completeopt-=preview
set grepprg=rg\ -i\ --vimgrep

set showmatch smartindent autoindent
set listchars=tab:>.,trail:.

set undofile undodir=~/.vim directory=~/.vim hidden spellfile=~/.vim/custom.utf8.add

nnoremap <silent><BS> :nohl<Cr>
nnoremap <silent><leader>b :ls<Cr>

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
augroup END

highlight WhitespaceEol ctermbg=red guibg=red
match WhitespaceEol /\s\+$/

filetype indent plugin on
syntax on
