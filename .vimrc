if version >= 800
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim

    "Matchit
    packadd! matchit
endif

"Buffers
set encoding=utf-8
set hidden
nnoremap <silent> <leader>b :buffers<CR>:buffer<space>

if has('persistent_undo')
    set undodir=~\AppData\Local\Temp\vim_undo_files
    set undofile
endif
" When open a new file remember the cursor position of the last editing
if has("autocmd")
    " When editing a file, always jump to the last cursor position
    autocmd BufReadPost * if line("'\"") | exe "'\"" | endif
endif

"Syntax highlighting
if has('syntax')
    set spelllang=en_gb
    map <F7> :if exists("g:syntax_on") <Bar>
                \   syntax off <Bar>
                \ else <Bar>
                \   syntax enable <Bar>
                \ endif <CR>
endif

"Line wrapping and marker visibilities
nnoremap <F1> :setlocal wrap!<Cr>:setlocal wrap?<Cr>
nnoremap <F2> :setlocal list!<Cr>:setlocal list?<Cr>
set linebreak textwidth=78
set sidescroll=1 sidescrolloff=1
if has('gui_running')
    let &listchars = "tab:→ ,trail:·,extends:»,precedes:«,nbsp:␣"
    let &fillchars = "vert:|"
    let &showbreak = "↳ "
else
    let &listchars = "tab:>-,trail:-,extends:>,precedes:<,nbsp:%"
    let &fillchars = "vert:|"
    let &showbreak = "¬ "
endif

"Searching
set hlsearch incsearch ignorecase smartcase
vnoremap <leader>/ y/<C-r>"<Cr><Cr>
    "searches selected text
nmap <leader>n  :set hlsearch! hlsearch?<Cr>
nmap <Esc><Esc> :nohlsearch<Cr>

"Indenting and formatting
set autoindent smartindent
set expandtab smarttab shiftwidth=4 tabstop=4 softtabstop=4
set formatoptions+=rn1j2

"Insert mode
inoremap jj <Esc>
set showmatch matchpairs+=<:>

"Window navigation
nnoremap <C-Tab>   <C-w>w
nnoremap <C-S-Tab> <C-w>W
nnoremap <C-Right> <C-w>l
nnoremap <C-Down>  <C-w>j
nnoremap <C-Left>  <C-w>h
nnoremap <C-Up>    <C-w>k
nnoremap <A-m>     <C-w>o

"Cursorline
set cursorline
nnoremap <silent> <leader>c :setlocal cursorline!<CR>
augroup cursorline_toggle
    autocmd!
    autocmd BufWinEnter,WinEnter,FocusGained    * setlocal cursorline
    autocmd BufWinLeave,WinLeave,FocusLost      * setlocal nocursorline
    autocmd InsertEnter                         * setlocal nocursorline nohlsearch
    autocmd InsertLeave                         * setlocal cursorline hlsearch
    autocmd VimEnter                            * hi CursorLine ctermfg=Black ctermbg=Gray
    autocmd ColorScheme                         * hi CursorLine ctermfg=Black ctermbg=Gray
augroup END

if has('gui_running')
    augroup width_and_height
        autocmd!
        autocmd VimEnter * set columns=999 lines=999
    augroup END
endif

"Motion
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap ' `
nnoremap g. <Esc>`[v`]<Left>

"Number line
set number
augroup line_number_colour
    autocmd!
    autocmd VimEnter     * hi LineNr guifg=#999999 ctermfg=Gray
    autocmd ColorScheme  * hi LineNr guifg=#999999 ctermfg=Gray
augroup END

"Grep
set grepprg=\"C:\Utilities\sift\sift.exe\"\ --recursive\ --smart-case\ --line-number\ --binary-skip\ --git\ --exclude-files=tags.*
nnoremap <leader>g :grep<Space>"\b<cword>\b"<Cr>
nnoremap <F8>      :cn<Cr>
nnoremap <S-F8>    :cp<Cr>
nnoremap <C-F8>    :botright cwindow<Cr>
nnoremap <C-S-F8>  :cclose<Cr>

"Yanking
nnoremap Y yg_
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>P "*P

"Fonts
if has("directx")
    set encoding=utf-8 "Repeated here to guarantee that it is available for 'renderoptions'
    set renderoptions=type:directx,taamode:1
endif
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guifont=DejaVu\ Sans\ Mono:h12
    nnoremap <F3> :set gfn=*<Cr>
endif

"Completion
if has("autocmd") && exists("+omnifunc")
    augroup completion
        autocmd!
        autocmd Filetype *
                \	if &omnifunc == "" |
                \		setlocal omnifunc=syntaxcomplete#Complete |
                \	endif
    augroup END
endif
set showfulltag completeopt+=menuone shortmess+=c
set wildmode+=list:longest

"Comment blocks
augroup comments
    autocmd!
    autocmd FileType c,cpp,cs,java,scala let b:comment_leader = '// '
    autocmd FileType sh,ruby,python,perl let b:comment_leader = '# '
    autocmd FileType conf,fstab          let b:comment_leader = '# '
    autocmd FileType tex                 let b:comment_leader = '% '
    autocmd FileType mail                let b:comment_leader = '> '
    autocmd FileType sql                 let b:comment_leader = '-- '
    autocmd FileType vim                 let b:comment_leader = '" '
augroup END
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:nohlsearch<CR>

"Clear trailing spaces
nnoremap <leader>cs :%s/\s\+$/<Cr>

"Save
nnoremap <leader>w :w<Cr>

"Find
nnoremap <leader>f :find **/*

"Repeat last command
nnoremap <leader>. @:

"Others
set visualbell belloff+=backspace,cursor
set foldlevelstart=1 foldmethod=marker
set laststatus=2 statusline=%<%f\ %h%m%r%=%k[%{(&fenc==\"\")?&enc:&fenc}%{(&bomb?\",BOM\":\"\")}]\ %-14.(%l,%c%V%)\ %P
