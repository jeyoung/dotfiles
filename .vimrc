source $VIMRUNTIME/vimrc_example.vim

filetype plugin indent on
if has('autocmd')
    autocmd FileType * set omnifunc=syntaxcomplete#Complete
endif

set path=.,**
set wildignore=*.class,*.obj,*.exe,*.dll,*.pdb,*.pyc,*.lib,*.swp,*.war,*.jar

"Backup
set backupdir=~/vimfiles/backup,$TMP
set backup
set writebackup

"Swap file
set directory=~/vimfiles/swap,$TMP
set swapfile

syntax enable
:map <F7> :if exists("g:syntax_on") <Bar>
\   syntax off <Bar>
\ else <Bar>
\   syntax enable <Bar>
\ endif <CR>

"File settings
set encoding=utf-8
set modelines=1

"General settings
set cmdheight=1
set display=lastline
set hidden
set showmode
set showcmd
set ttyfast
set visualbell
set wildmenu
set wildmode=list:full

set foldmethod=marker
set number
set ruler
set scrolloff=5
set sidescroll=5
set sidescrolloff=5
set virtualedit=block

set gdefault
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch

set autoindent
set expandtab
set shiftround
set shiftwidth=4
set softtabstop=4
set smarttab
set tabstop=4

set formatoptions=qrn1

set backspace=indent,eol,start

"Map leader


"Search
nnoremap <silent> <leader><Space> :set nohlsearch!<CR>
nnoremap <silent> <Esc> <Esc>:noh<Cr>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

vnoremap <leader>/ y/<C-r>"<Cr><Cr>
    "searches selected text

"Formatting
nnoremap <silent> <leader>f gqip$
vnoremap <silent> <leader>f gq

inoremap jj <Esc>

"Windows
nnoremap <C-Right> <C-w>l
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Up> <C-w>k

nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k

nnoremap gw <C-w>

if version >= 700
    augroup win_fix_height
        au!
        au WinEnter * set winfixheight
    augroup END
endif

"Buffers
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
nnoremap <silent> <leader>b :buffers<CR>:buffer<space>

"Cursorline
set cursorline
nnoremap <silent> <leader>c :setlocal cursorline!<CR>
if version >= 700
    augroup cursorline_toggle
        au!
        au WinLeave * setlocal nocursorline
        au WinEnter * setlocal cursorline
    augroup END
endif

"Line wrapping
if has('gui')
    if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
        let &listchars = "tab:→\ ,trail:·,extends:»,precedes:«"
        let &fillchars = "vert:¦"
        let &showbreak = "¬\ "
    else
        set listchars=tab:→\ ,trail:·,extends:»,precedes:«
    endif
endif

set textwidth=79
set wrap
set linebreak
set nolist

nnoremap <silent> <leader>l :setlocal wrap! linebreak! list!<Cr>:setlocal wrap? linebreak? list?<Cr>

"Tag
nnoremap <leader>t :tag<Space>

"Completion
inoremap <C-o> <C-X><C-o>
inoremap <C-]> <C-X><C-]>

"Section move
map [[ ?{<CR>w99[{
map ][ /}<CR>b99]}
map ]] j0[[%/{<CR>
map [] k$][%?}<CR>

"Movement fix
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"Status line
set laststatus=2

if version >= 700
    augroup line_number_colour
        au!
        au GUIEnter * hi LineNr guifg=#888888
        au ColorScheme * hi LineNr guifg=#888888
        au ColorScheme * hi CursorLine ctermfg=Black ctermbg=Grey
    augroup END
endif

"Find
nnoremap <leader>. :find<Space>

"Delete buffer
nnoremap <leader>d :bdel<Cr>

"Vimgrep
if executable('findstr')
    set grepprg=C:\\Utilities\\findstr2\\fs.bat
endif
nnoremap <leader>g :grep<Space>"\<<cword>\>" *.*<Cr>:cw<Cr>
nnoremap <leader>G :grep<Space>

"Repeat command
nnoremap <leader>@ @:

"Y
nnoremap Y yg_

"Clipboard copy/paste
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>P "*P

"Colorscheme
if has('gui')
    colorscheme default
    set background=light
else
    colorscheme darkblue
    set background=dark
endif

"Turn off toolbar in GUI
if has('gui')
    set guioptions-=T
endif

set guifont=Consolas:h11

" Commenting blocks of code.
autocmd FileType c,cpp,cs,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python,perl   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType sql             let b:comment_leader = '-- '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:nohlsearch<CR>
