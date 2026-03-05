"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""               
"               
"               ██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"               ██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"               ██║   ██║██║██╔████╔██║██████╔╝██║     
"               ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║     
"                ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"                 ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" ===== General =====


" Disable compatibility with vi.
set nocompatible

" Set the commands to save in history default number is 20.
set history=500

" Automatically install vim-plug.
if empty(glob("~/.vim/autoload/plug.vim"))
    execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.github.com/junegunn/vim-plug/master/plug.vim'
endif

" Block redraw while executing macros.
set lazyredraw


" ===== Files =====


" Enable file type detection.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Auto updating file if changed elsewhere.
set autoread
au FocusGained,BufEnter * silent! checktime

" Use Unix as the standard file type
set ffs=unix,dos,mac


" ===== Syntax =====


" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" How many tenths of a second to blink when matching brackets
set mat=2

" Add a bit extra margin to the left
set foldcolumn=0


" ===== Highlightning =====


" Highlight cursor line underneath the cursor horizontally.
" set cursorline

" Use highlighting when doing a search.
set hlsearch

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=999


" ===== Indentation =====


" Set shift width to 4 spaces.
set shiftwidth=4

" Set tab width to 4 columns.
set tabstop=4
set softtabstop=4

" Use space characters instead of tabs.
set expandtab

" Linebreak on 500 characters
set lbr
set tw=500


" ===== Backups =====


" Do not save backup files.
set nobackup
set nowb
set noswapfile

" ===== Searching =====


" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" This will allow to search specifically for capital letters.
set smartcase

" Show matching words during a search.
set showmatch


" ===== Hot-Keys =====


" Press the space bar to type the : character in command mode.
nnoremap <space> :

" Yank from cursor to the end of line.
nnoremap Y y$

" Configure backspace.
set backspace=eol,start,indent
set whichwrap+=<,>,h,l


" ===== Window =====


" Split window.
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Resize split windows using arrow keys.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END


" ===== Language =====


" Set default language.
let $LANG='en'
set langmenu=en
set encoding=utf8


" ===== Menu =====


" Reload menu
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Enable auto completion menu after pressing TAB.
set wildmenu
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx,*.o
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" Show current position.
set ruler


" ===== GUI =====


if has('gui_running')
    " Hide the the right-side scroll bar.
    set guioptions-=r

    " Hide the the bottom scroll bar.
    set guioptions-=b

    " Set 24-bit colors if supported.
    if exists('+termguicolors')
        set termguicolors
    endif
endif


" ===== Plugins =====


call plug#begin('~/.vim/plugged')

" Class/module browser: https://github.com/preservim/tagbar
Plug 'preservim/tagbar'

" Colorscheme: https://github.com/devsjc/vim-jb
" Plug 'devsjc/vim-jb'

" Colorscheme: https://github.com/doums/darcula
Plug 'doums/darcula'

" Automatically highlighting words under the cursor: https://github.com/RRethy/vim-illuminate
Plug 'RRethy/vim-illuminate'
let g:Illuminate_delay = 30

call plug#end()


" ===== Sound =====


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb= 
endif


" ===== Regex =====


" For regular expressions turn magic on
set magic

" Set regular expression engine automatically
set regexpengine=0


" ===== ColorScheme Activation =====


colorscheme darcula
