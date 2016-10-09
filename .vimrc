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

"General settings
set cmdheight=1
set display+=lastline
set hidden
set showmode
set showcmd
set ttyfast
set lazyredraw
set novisualbell
set vb t_vb=
set wildmenu
set wildmode=list:longest,full

set foldmethod=marker
set foldlevelstart=1
set number
set ruler
set scrolloff=5
set sidescroll=5
set sidescrolloff=5
set virtualedit=block
set display+=lastline

set gdefault
set hlsearch
set ignorecase
set smartcase
set incsearch
set showmatch
set nowrapscan

set shiftwidth=4
set softtabstop=4
set tabstop=4
set autoindent
set shiftround
set expandtab
set smarttab

set formatoptions=qrn1j

set backspace=indent,eol,start

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

"Line wrapping
if has('gui_running')
    if (&termencoding ==# 'utf-8' || &encoding ==# 'utf-8') && version >= 700
        let &listchars = "tab:→\ ,trail:·,extends:»,precedes:«"
        let &fillchars = "vert:¦"
        let &showbreak = "↳ "
    else
        set listchars=tab:→\ ,trail:·,extends:»,precedes:«
    endif
endif

if has('gui_running')
    augroup width_and_height
        au!
        au VimEnter * set columns=999 lines=999
    augroup END
endif

set textwidth=78
set nowrap
set nolinebreak
set nobreakindent
set list
set cpoptions+=n
nnoremap <silent> <leader>l :setlocal wrap! linebreak! breakindent! list!<Cr>:setlocal wrap? linebreak? breakindent? list?<Cr>

"Section move
nnoremap <Tab> }zz
nnoremap <S-Tab> {zz
vnoremap <Tab> }zz
vnoremap <S-Tab> {zz

"Movement fix
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap ' `

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
else
    colorscheme default
    set background=dark
endif

"Other GUI options
if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guifont=Courier\ New:h10:cDEFAULT
endif

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
