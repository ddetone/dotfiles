" ---- Start plug-vim 
" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'ntpeters/vim-better-whitespace'

" Initialize plugin system
call plug#end()
" ---- End plug-vim


"" Fix terminal colors
"if $COLORTERM == 'gnome-terminal'
"  set t_Co=256
"endif
set t_Co=256
colorscheme peachpuff
" colorscheme ron

set splitbelow
set splitright

" Tweak default explorer view
let g:netrw_liststyle=3

"nnoremap H gT
"nnoremap L gt
map <leader>w <Esc>:tabclose<CR>

if bufwinnr(1)
	map + <C-W><
	map _ <C-W>>
endif

" VIM Example Stuff Below

" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
:set nocompatible

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
"filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmode=longest,list,full
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline

"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Display a color line at 80 chars
set colorcolumn=80


" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" ******
" SETTING UP 2 TAB IN PYTHON. MUST CREATE THE FOLLOWING FILE TO OVERWRITE VIM.
"
" There are two ways to go about doing this. If you have a ~/.vim folder, the
" easiest way is to add the file ~/.vim/after/ftplugin/python.vim:
" 
" " Here, you can set the setting directly, or call a command or function
" " to help you.  We'll call a command, and then implement that command in
" " your top-level vimrc to help keep things in one place.
" SetupPython
" In your .vimrc, add:
function! SetupPython()
    " Here, you can have the final say on what is set.  So
    " fixup any settings you don't like.
    setlocal softtabstop=4
    setlocal tabstop=4
    setlocal shiftwidth=4
endfunction
command! -bar SetupPython call SetupPython()
" ******


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
"map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>

"------------------------------------------------------------

"Bundle 'Valloric/YouCompleteMe'
"let g:ycm_autoclose_preview_window_after_completion=1
"let mapleader=" "
"map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"
""Bundle 'ivanov/vim-ipython'
"
"""python with virtualenv support
""py << EOF
""import os
""import sys
""if 'VIRTUAL_ENV' in os.environ:
""  project_base_dir = os.environ['VIRTUAL_ENV']
""  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
""  execfile(activate_this, dict(__file__=activate_this))
""EOF
"
""Bundle 'scrooloose/syntastic'
"
"" Better tree navigation
"Bundle 'scrooloose/nerdtree'
"map <C-n> :NERDTreeToggle<CR>
"let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
"set encoding=utf-8 "fix bug with not being able to click subdirs in NERDTree
"
"" Show git status in nerdtree
"Bundle 'Xuyuanp/nerdtree-git-plugin'
"
"Plugin 'JamshedVesuna/vim-markdown-preview'
"
"Plugin 'ntpeters/vim-better-whitespace'
"" Useful commands
"" :ToggleWhitespace
"" :StripWhitespace
