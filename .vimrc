if version >= 800
    unlet! skip_defaults_vim
    source $VIMRUNTIME/defaults.vim

    "Matchit
    packadd! matchit
endif

if has('persistent_undo')
    set undofile
endif

set encoding=utf-8

if has('syntax')
    set spelllang=en_gb
    map <F7> :if exists("g:syntax_on") <Bar>
                \   syntax off <Bar>
                \ else <Bar>
                \   syntax enable <Bar>
                \ endif <CR>
endif

set visualbell belloff+=backspace,cursor

set wildmode+=list:full

set foldlevelstart=1 foldmethod=marker

set linebreak breakindent textwidth=78
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

set hlsearch
set ignorecase smartcase
vnoremap <leader>/ y/<C-r>"<Cr><Cr>
    "searches selected text
nmap <leader>n :set hlsearch! hlsearch?<Cr>
nmap <Esc><Esc> :nohlsearch<Cr>

set showmatch matchpairs+=<:>

set autoindent smartindent
set expandtab smarttab shiftwidth=4
set softtabstop=4 
set tabstop=4

set formatoptions+=rn1j2

set showfulltag

inoremap jj <Esc>

nnoremap <C-Right> <C-w>l
nnoremap <C-Down> <C-w>j
nnoremap <C-Left> <C-w>h
nnoremap <C-Up> <C-w>k
nnoremap gw <C-w>

set hidden
nnoremap <C-Tab> :bn<CR>
nnoremap <C-S-Tab> :bp<CR>
nnoremap <silent> <leader>b :buffers<CR>:buffer<space>

nnoremap <silent> <leader>c :setlocal cursorline!<CR>
if version >= 700
    augroup cursorline_toggle
        autocmd!
        autocmd WinLeave    * setlocal cursorline
        autocmd InsertEnter * setlocal cursorline nohlsearch
        autocmd WinEnter    * setlocal nocursorline
        autocmd InsertLeave * setlocal nocursorline hlsearch
    augroup END
endif

if has("directx") 
  set renderoptions=type:directx,taamode:1
endif

if has('gui_running')
    augroup width_and_height
        autocmd!
        autocmd VimEnter * set columns=999 lines=999
    augroup END
endif

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

nnoremap ' `
nnoremap g. <Esc>`[v`]<Left>

set number
if version >= 700
    augroup line_number_colour
        autocmd!
        autocmd GuiEnter    * hi LineNr guifg=#888888
        autocmd VimEnter    * hi LineNr guifg=#888888
        autocmd ColorScheme * hi LineNr guifg=#888888
        autocmd ColorScheme * hi CursorLine ctermfg=Black ctermbg=Grey
    augroup END
endif

set grepprg=\"C:\Utilities\sift\sift.exe\"\ --recursive\ --smart-case\ --line-number\ --binary-skip\ --git\ --exclude-files=tags.*
nnoremap <leader>g :grep<Space>"\b<cword>\b"<Cr>
augroup qf
    autocmd!
    autocmd QuickFixCmdPost [^l]* clist
    autocmd QuickFixCmdPost l* clist
augroup END
nnoremap <F8>   :cn<Cr>
nnoremap <S-F8> :cp<Cr>

nnoremap <leader>. @:

nnoremap Y yg_

noremap <leader>y "*y
noremap <leader>p "*p
noremap <leader>P "*P

if has('gui_running')
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L
    set guifont=Consolas:h12
    nnoremap <F3> :set gfn=*<Cr>
endif

if has("autocmd") && exists("+omnifunc")
autocmd Filetype *
        \	if &omnifunc == "" |
        \		setlocal omnifunc=syntaxcomplete#Complete |
        \	endif
endif
set completeopt+=menuone
set shortmess+=c

"Comment blocks 
autocmd FileType c,cpp,cs,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python,perl let b:comment_leader = '# '
autocmd FileType conf,fstab          let b:comment_leader = '# '
autocmd FileType tex                 let b:comment_leader = '% '
autocmd FileType mail                let b:comment_leader = '> '
autocmd FileType sql                 let b:comment_leader = '-- '
autocmd FileType vim                 let b:comment_leader = '" '
noremap <silent> <leader>cc :<C-B>silent <C-E>s/^\(\s*\)/\1<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> <leader>cu :<C-B>silent <C-E>s/^\(\s*\)\V<C-R>=escape(b:comment_leader,'\/')<CR>/\1/e<CR>:nohlsearch<CR>

"Clear trailing spaces
nnoremap <leader>cs :%s/\s\+$/<Cr>

"Save
nnoremap <leader>w :w<Cr>
