set shiftwidth=4 softtabstop=-1 incsearch hlsearch visualbell
set grepprg=rg\ -i\ --vimgrep

nnoremap <silent><BS> :nohl<Cr>
nnoremap <silent><leader>b :ls<Cr>

augroup logfiles
    au! BufRead *.log setlocal buftype=nowrite undolevels=10 noswapfile autoread
augroup END

filetype indent plugin on
syntax on
