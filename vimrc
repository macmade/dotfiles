""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM configuration file
" 
" Jean-David Gadina - www.xs-labs.com
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Color theme
color xs-labs

" Don't behave Vi-compatible
set nocompatible

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax highlighting
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Allows syntax highlighting
syntax on

" Briefly jump to matching bracket if insert one
set showmatch

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spaces & tabs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Use spaces when <Tab> is inserted
set expandtab

" number of spaces that <Tab> uses while editing
set softtabstop=4

" number of spaces that <Tab> in file uses
set tabstop=4

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Special characters
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Show <Tab> and <EOL>
set list

" Characters for displaying in list mode
set listchars=tab:>-,trail:~

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text wrap
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't wrap long lines at a blank
set nolinebreak

" Don't wrap long lines
set nowrap

" Maximum width of text that is being inserted
set textwidth=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Minimum number of columns to scroll horizontal
set sidescroll=10

" Minimum number of columns to left and right of cursor
set sidescrolloff=20

" Minimum number of lines above and below cursor
set scrolloff=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Take indent for new line from previous line
set autoindent

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight matches with last search pattern
set hlsearch

" Highlight match while typing search pattern
set incsearch

" Searches wrap around the end of the file
set wrapscan

" Ignore case in search patterns
set ignorecase

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status & command line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Message on status line to show current mode
set showmode

" Show (partial) command in status line
set showcmd

" Show cursor line and column in the status line
set ruler

" Tell when last window has status lines
set laststatus=2

" Number of lines to use for the command-line
set cmdheight=5

" Height of the command-line window
set cmdwinheight=5

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line numbers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Print the line number in front of each line
set number

" Don't show relative line number in front of each line
set norelativenumber

" Number of columns used for the line number
set numberwidth=10

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Folding type
set foldmethod=syntax

" Set to display all folds open
set foldenable

" Fold level when starting to edit a file
set foldlevelstart=99

" Minimum number of lines for a fold to be closed
set foldminlines=1

" Maximum fold depth
set foldnestmax=20

" Width of the column used to indicate folds
set foldcolumn=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't adjust case of match for keyword completion
set noinfercase

" Show full tag pattern when completing tag
set showfulltag

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" History
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" maximum number of changes that can be undone
set undolevels=500

" Number of command-lines that are remembered
set history=1000

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" How backspace works at start of line
set backspace=indent,eol,start

" Don't start the edit of a file in Insert mode
set noinsertmode

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Read & write
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically read file when changed outside of Vim
set autoread

" Don't automatically write file if changed
set noautowrite

" Write <EOL> for last line in file
set endofline

" Don't keep backup file after overwriting a file
set nobackup

" Don't prepend a Byte Order Mark to the file
set nobomb

" Writing to a file is allowed
set write

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Mouse
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Enable the use of mouse clicks
set mouse=a	

" Keyboard focus follows the mouse
set mousefocus

" Hide mouse pointer while typing
set mousehide

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Don't highlight the screen column of the cursor
set nocursorcolumn

" Highlight the screen line of the cursor
set cursorline

" Columns to highlight
set colorcolumn=80

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Mac OS X - use smooth, antialiased fonts
set antialias

" Windows are automatically made the same size
set equalalways

" Ring the bell for error messages
set errorbells

" Use visual bell instead of beeping
set visualbell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

autocmd VimEnter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
autocmd VimEnter * wincmd l
