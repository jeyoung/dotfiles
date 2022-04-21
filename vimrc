set shiftwidth=4 softtabstop=-1 ignorecase smartcase incsearch hlsearch visualbell
set grepprg=rg\ -i\ --vimgrep

set showmatch smartindent autoindent
set listchars=tab:>.,trail:.

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

augroup logfiles
    au!
    au! BufRead *.log setlocal buftype=nowrite undolevels=10 noswapfile autoread syntax=OFF
augroup END

highlight WhitespaceEol ctermbg=red guibg=red
match WhitespaceEol /\s\+$/

filetype indent plugin on
syntax on
