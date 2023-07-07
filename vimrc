" Tab and indent
set shiftwidth=4 softtabstop=-1 autoindent smartindent smarttab expandtab

" Search and completion
set grepprg=rg\ -i\ --vimgrep
set ignorecase smartcase incsearch hlsearch wildmenu wildmode=longest:list,full completeopt-=preview

" Spelling
set spelllang=en_gb spellfile=~\vimfiles\en_gb.utf8.add

" Display
set listchars=tab:>.,trail:.
set shortmess-=S visualbell showmatch
set statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P

highlight rightMargin term=bold ctermfg=blue guifg=blue
match rightMargin /.\%>80v/

highlight WhitespaceEol ctermbg=red guibg=red
match WhitespaceEol /\s\+$/

" Buffer
set hidden undofile undodir=~\vimfiles\undo directory=$TEMP

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

augroup special_files
    au!
    au! BufRead *.biml setlocal filetype=xml
    au! BufRead *.dtsConfig setlocal filetype=xml
    au! BufRead *.dtsx setlocal filetype=xml
    au! BufRead *.log setlocal buftype=nowrite undolevels=10 autoread noswapfile syntax=OFF
augroup END

" Plugin
set omnifunc=ale#completion#OmniFunc

let g:ale_linters = {
            \ 'cs': ['OmniSharp']
            \}

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  " autocmd! CursorHold *.cs OmniSharpTypeLookup
augroup END
