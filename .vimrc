" Load pathogen to manage plugins
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

" Change the leader key to something easier
let mapleader=","

" Plugin: SnipMate
" ----------------
" Edit .vim/snippets/filetype.snippet
" Then inside vim, enter keyword then tab
" To do normal auto completion, do ctrl-n

" Plugin: YankRing
" ----------------
" After a paste, press ctrl-p to cycle through last pastes
let g:yankring_history_dir = '~/.vim/temp'
" Also allows pasting between windows

" Plugin: MRU
" -----------
" ,f shows MRU
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

" Plugin: Fugitive
" ----------------
" Git:
" :Git _____ lets you run anything
" But try not to use
" eg. :Git log shows the log
" Aliases, completion is also handled correctly

" Status: 
" :Gstatus
" git status
nmap <leader>gs :Gstatus<cr>
	" Press "Enter" to open the file in the window below
	" Then run Gdiff
	" Then use "-" to stage it/remove it
	" Press "p" to add parts of a file
	" Press "shift-c" to commit

" Old Versions:
" :Glog
" run ,gl, then use these [q and ]q to move through
" then ,ge to return to the top
nmap <leader>gl :Glog<cr>
map [q :cprev<cr>
map ]q :cnext<cr>
map [Q :cfirst<cr>
map ]Q :clast<cr>
nmap <leader>ge :Gedit<cr>

" Other Branches:
" Edit files in any branch:
" :Gedit branchname:filename
" eg. :Gedit master:.vimrc
" :Gvsplit

" Search:
" :Ggrep findme
" :Ggrep findme branchnam
" Find something taken out during acommit
" :Glog -S findme --

" Explore:
" :Gedit HEAD^ (replace HEAD with a specific SHA if desired)
" Press enter on the tree line to see all files in that commit
" Press enter on the parent line to go to the parent commit
" To go back to the top, 
" :Gedit if get stuck
nmap <leader>gx :Gedit HEAD^<cr>
" To go back, use ,gu if inside file tree, Shift-C to go to commit version
nmap <leader>gu :edit %:h<CR> 

" Commit:
" :Gcommit
" git commit
" Put commit message at the top of the new window
nmap <leader>gc :Gcommit<cr>

" Add:
" :Gwrite
" git add currentfile
nmap <leader>ga :Gwrite<cr>

" Remove:
" :Gremove
" git remove currentfile
nmap <leader>grm :Gremove<cr>

" Move:
" :Gmove targetpath (relative to current file location)
" git mv originalpath destinationpath
" / is the root of the repo, not the filesystem
nmap <leader>gm :Gmove<cr>

" Revert:
" :Gread
" git checkout currentfile
nmap <leader>gre :Gread<cr>

" Blame:
" :Gblame
" git blame
nmap <leader>gb :Gblame<cr>

" Log:
" :Glob
" git log
nmap <leader>gl :Glog<cr>

" Diff:
" :Gdiff
" git diff
" Current (working) on the right, what will be committed (stage) on the left
" :diffget on oneside will move to the other
" :do (diffobtain)
" :diffupdate to update colors
" If do on a merge conflict file, 
" left: target (probably master)
" middle: working copy (if we just opened it in an editor)
" right: merge branch (what we tried to merge in)
nmap <leader>gd :Gdiff<cr>

autocmd BufReadPost fugitive://* set bufhidden=delete


" Plugin: NerdCommenter
" ---------------------
" ,c<space> toggles
" ,cs better comment
" ,cc comments selected
" ,cu uncomments selected

" Plugin: Scratch
" ---------------
" ,<tab> will open a scratch window
map <leader><tab> :Sscratch<cr>

" Plugin: Command-t
" -----------------
" ,t starts command t
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc

" Plugin: Slime
" -------------
" screen -S sessionname in another window
" Ctrl-c-c to send to this (need to enter sessionname)
" By default sends the current paragraph, can use visual mode
" to send something else
" Ctrl-c v reprompts to reattach to a new session
"

" Plugin: LargeFile
" -----------------
" Makes reading large files easier


" Plugin: ACK
" -----------
" To do an ACK search
" ,a to do an ack search
" :Ack pattern
" To learn more
" :h Ack
" Be careful if not in the right directory
" ..need to use ,cd
" Use Ctrl-P to paste path of current directory
" t opens in a new tab
" T opens in a background tab
" o opoens
" q closes
" go previews
noremap <leader>a :Ack 

" ,cd will switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


" Plugin: Nerdtree
" ----------------
" ,t opens it
" t opens in a new tab
" o opens file
" s opens in new vertical
" p to go to parent
" r to refresh
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeBookmarksFile="~/.vim/NERDTreeBookmarks"
map <Leader>d :NERDTreeToggle<CR>


" Leader shortcuts
" ----------------

" ctrl-n does autocompletion

" Open this file more easily 
" ,ev to edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Vertical split then hop to new buffer
" ,v to create a new vertical split
noremap <Leader>v :vsplit<CR>

" Horizontal split
" ,h to create a new horizontal split
noremap <Leader>h :split<CR>

" ,, moves between buffers
map <Leader>, <C-W>W

" Make forward and back easier
" Shift-j to move a page down
" Shift-k to move a page up
map <S-j> <C-F>
map <S-k> <C-B>

" Move cursor within screen
" H moves to top
" M moves to middle
" B moves to bottom
" fx moves to next occurance of x
" tx moves to right before next occurance of x
" Fx moves to last occurance of x

" ,yf to copy filename to gnome clipboard
nmap ,yf :let @*=expand("%")<CR>

" ,yp to copy filename+path to gnome clipboard
nmap ,yp :let @*=expand("%:p")<CR>

" ,1 creates an underline for a comment
nnoremap <leader>1 yypllv$r-

" ,e opens an edit command with the path of the currently edited file filled in
map <Leader>e :e <C-R>=expand("%:p:h") . "/" <CR>

" ,t opens a tab edit command with the path of the currently edited file filled in
map <Leader>te :tabe <C-R>=expand("%:p:h") . "/" <CR>

" ctrl-p inserts the path of the currently edited file into a command
cmap <C-P> <C-R>=expand("%:p:h") . "/" <CR>

" Use tab to look between bracket pairs
nnoremap <tab> %
vnoremap <tab> %

" Tab configuration
" ,tn makes a new tab
map <leader>tn :tabnew<cr>
" ,te edits a file in a new tab
map <leader>te :tabedit

" 0 moves to beginning of line after tabs, not absolute beginning
map 0 ^

" just type xdate
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>

" ]p will paste with the same level of indent as the line above

" m <letter> will mark a section
" ` <letter> (backtick will return)
" `. goes to last edited line

" ,, changes from insert to command mode (esc)
imap ,, <esc>

" ,/ to clear highlights
nnoremap <leader>/ :noh<cr>

" Tab hotkeys
" ctrl-h to move to the left
" ctrl-l to move to the right
:map <C-h> :tabprev<CR>
:map <C-l> :tabnext<CR>

" ,w writes
nnoremap <Leader>w :w<CR>
" ,q quits
nnoremap <Leader>q :q<CR>
" ,x writes and quits
nnoremap <Leader>x :wq!<CR>

" ,p toggles paste mode to turn off weird wrapping/commenting
set pastetoggle=<leader>p
map <leader>p :set invpaste paste?<CR>

" ,W clears whitespacewn
noremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" In command mode, enter inserts a newline,
" Shift-enter inserts above
map <S-Enter> O<ESC>
map <Enter> o<ESC>

" ,v reselects just pasted text
nnoremap <leader>r V`]

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Vim settings
" ------------

" Turn off vi compatability
set nocompatible 

" Turn on syntax highlighting
syntax on

" Turn regex to perl/python style
nnoremap / /\v
vnoremap / /\v

" Turn on auto indentation
set autoindent

" Encodeing
set encoding=utf-8

" Show number of lines of selection
set showcmd

" Always show 3 lines when at the bottom of a file
set scrolloff=3

" Automatically reload a file when changed from the outside
set autoread

" Highlight the background of the entire line where the cursor is
set cursorline

" Should be on automatically, but just in case
set ttyfast

" Show the current line position
set ruler

" Allow backspace over anything
set backspace=indent,eol,start

" Always show a status line
set laststatus=2

" Ignore case while searching
set smartcase

" Show matching bracket when over one of them
set showmatch

" Show trailing whitespace
set listchars=tab:\▸\ ,trail:·

" Shortcut to rapidly toggle `set list`
" ,l shows invisible characters
nmap <leader>l :set list!<CR>


" Turn off backup (trust me to do it correctly)
set nobackup
set nowb
set noswapfile

" Set up persistent undo
" Only works in 7.3
try
	set undodir=~/.vim/undodir
	set undofile
catch
endtry

" Start scrolling three lines before horizontal border of window.
set scrolloff=3

" When buffer brought foreground, remember undo
set hidden 

" Searching
" Highlight dynamically as pattern is typed
set incsearch 
" Enable search highlighting
set hlsearch 

" Don't need /g for replaces
set gdefault

" Show filename in window title
set title

" Ignore case in searches
set ignorecase

" Make split windows the same width always
set equalalways

" Turn off beeping
set visualbell

" Better command line comletion
set wildmenu 
set wildmode=list:longest

" Keep command line history
set history=1000

" Setup copy/paste
" Mirror vim clipboard (eg. yank), with system clipboard
set clipboard=unnamed
source $VIMRUNTIME/mswin.vim
behave mswin

" Allow for mouse movement in vim
if has('mouse')
	set mouse=a 
endif

" Long lines
set wrap
set textwidth=79
set formatoptions=qrn1

" A tab is 2 spaces
set tabstop=2 
set shiftwidth=2

" Colors
" If using an 8 bit terminal colors will not work, need to
" reset the color scheme
let &t_Co=256
colorscheme molokai

if has('statusline')
	set laststatus=2

	" Broken down into easily includeable segments
	set statusline=%<%f\   " Filename
	set statusline+=%w%h%m%r " Options
	set statusline+=%{fugitive#statusline()} "  Git Hotness
	"set statusline+=\ [%{&ff}/%Y]            " filetype
	set statusline+=\ [%{getcwd()}]          " current dir
	"set statusline+=\ [A=\%03.3b/H=\%02.2B] " ASCII / Hexadecimal value of char
	set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
endif


" font
" set guifont=ProggyCleanTT\ 12
set guifont=Bitstream\ Vera\ Sans\ Mono\ 10
