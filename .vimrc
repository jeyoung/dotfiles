if version >= 800
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim

    "Matchit
    packadd! matchit
endif

"Search paths
set path+=**
set wildignore+=**/bin/**/*,**/obj/**/*,*.class,*.obj,*.exe,*.dll,*.pdb,*.pyc,*.lib,*.swp,*.war,*.jar

"Backup
set backupdir=~/vimfiles/backup,$TMP
set backup
set writebackup

"Swap file
set directory=~/vimfiles/swap,$TMP
set swapfile

"Persistent undo
if has('persistent_undo')
    set undodir=~/vimfiles/undo
    set undofile
endif

"Viminfo
set viminfo='1000,f1,<500,:500,@500,/500,rA:,rB:,h

"Sessions
set sessionoptions+=resize

"Spelling
if has('syntax')
    set spelllang=en_gb
endif

"Diff
set diffopt+=iwhite

"File settings
set encoding=utf-8
set modelines=1

"Options based on filetypes
if has('autocmd')
    filetype plugin indent on
    autocmd FileType * set omnifunc=syntaxcomplete#Complete
endif

if has('syntax') && !exists('g:syntax_on')
    syntax enable
    :map <F7> :if exists("g:syntax_on") <Bar>
                \   syntax off <Bar>
                \ else <Bar>
                \   syntax enable <Bar>
                \ endif <CR>
endif


"UX
set ttyfast
set nolazyredraw
set visualbell
set belloff+=backspace,cursor

"General
set wildmenu
set wildmode=list:longest,full

set foldmethod=marker
set foldlevelstart=1

set number

set scrolloff=5
set sidescroll=5
set sidescrolloff=5
set virtualedit=block

"Search
set gdefault
set hlsearch
set ignorecase
set incsearch
set nowrapscan
set smartcase

set showmatch
set matchpairs+=<:>
au FileType c,cpp,java,js,cs set matchpairs+==:;

"Indent
set shiftwidth=4
set softtabstop=4
set tabstop=4

set autoindent
set smartindent

set shiftround

set expandtab
set smarttab

set formatoptions=qrn1j

set backspace=indent,eol,start

"Tags
set showfulltag

"Search
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

vnoremap <leader>/ y/<C-r>"<Cr><Cr>
    "searches selected text
nmap <leader>n :set hlsearch! hlsearch?<Cr>
nmap <Esc><Esc> :nohlsearch<Cr>

inoremap jj <Esc>

"Windows
nnoremap <C-Right> <C-w>l
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Up> <C-w>k
nnoremap gw <C-w>

"Buffers
set hidden
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
        au InsertEnter * setlocal nocursorline nohlsearch
        au WinEnter * setlocal cursorline
        au InsertLeave * setlocal cursorline hlsearch
    augroup END
endif

"DirectX
if has("directx") && $VIM_USE_DIRECTX != '0'
  set renderoptions=type:directx,taamode:1
endif

"Hidden characters
if has('gui_running')
    let &listchars = "tab:→ ,trail:·,extends:»,precedes:«,nbsp:␣"
    let &fillchars = "vert:|"
    let &showbreak = "↳ "
else
    let &listchars = "tab:>-,trail:-,extends:>,precedes:<,nbsp:%"
    let &fillchars = "vert:|"
    let &showbreak = "¬ "
endif
set list

if has('gui_running')
    augroup width_and_height
        au!
        au VimEnter * set columns=999 lines=999
    augroup END
endif

"Line wrap
set textwidth=78
set wrap
set linebreak
set breakindent
nnoremap <silent> <leader>l :setlocal wrap!<Cr>:setlocal wrap?<Cr>

"Movement fix
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap ' `

"Bottom of screen
set cmdheight=1
set display+=lastline
set laststatus=2
set ruler
set showcmd 
set showmode
set statusline=%<%f\ \[%n%R%H]%m\ %=%-14.(%l,%c%V%)\ %P
if version >= 800
    set statusline+=\ %{gutentags#statusline()}
endif

if version >= 700
    augroup line_number_colour
        au!
        au GUIEnter * hi LineNr guifg=#888888
        au ColorScheme * hi LineNr guifg=#888888
        au ColorScheme * hi CursorLine ctermfg=Black ctermbg=Grey
    augroup END
endif

"Grep
set grepprg=\"C:\Utilities\sift\sift.exe\"\ --recursive\ --smart-case\ --line-number\ --binary-skip\ --git\ --exclude-files=tags.*
nnoremap <leader>g :grep<Space>"\b<cword>\b"<Cr>
augroup qf
    au!
"    autocmd QuickFixCmdPost [^l]* clist
    autocmd QuickFixCmdPost l* clist
augroup END
nnoremap <F8> :cn<Cr>
nnoremap <S-F8> :cp<Cr>

"Repeat command
nnoremap <leader>. @:

"Y
nnoremap Y yg_

"Clipboard copy/paste
noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>P "*P

"Colorscheme
if has('gui_running')
    colorscheme default
    set background=light
endif

"Other GUI options
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guifont=Consolas:h10
    nnoremap <F3> :set gfn=*<Cr>
endif

"Autocomplete
set completeopt+=menuone
set shortmess+=c

" Commenting blocks of code.
autocmd FileType c,cpp,cs,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python,perl let b:comment_leader = '# '
autocmd FileType conf,fstab let b:comment_leader = '# '
autocmd FileType tex let b:comment_leader = '% '
autocmd FileType mail let b:comment_leader = '> '
autocmd FileType sql let b:comment_leader = '-- '
autocmd FileType vim let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:nohlsearch<CR>
