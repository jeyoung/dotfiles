set shiftwidth=4 softtabstop=-1 incsearch hlsearch visualbell
set grepprg=rg\ -i\ --vimgrep

nnoremap <silent><BS> :nohl<Cr>
nnoremap <silent><leader>b :ls<Cr>

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y "+Y

nnoremap <leader>p "+p
vnoremap <leader>p "+p
nnoremap <leader>P "+P

nnoremap <C-j> gj
vnoremap <C-j> gj
nnoremap <C-k> gk
vnoremap <C-k> gk

augroup logfiles
    au!
    au! BufRead *.log setlocal buftype=nowrite undolevels=10 noswapfile autoread syntax=OFF
augroup END

filetype indent plugin on
syntax on
