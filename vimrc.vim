" vim: filetype=vim

" Skip initialization for vim-tiny or vim-small. {
if !1
    finish
endif
" }

" Settings {
    " Compatible, Filetype, Syntax {
        set nocompatible                " Do not compatible with the old-fashion vi mode.
        filetype off                    " Necessary tip to make filetype detect work on Linux.
        filetype on                     " Enable filetype detection.
        filetype indent on              " Enable filetype-specific plugin.
        filetype plugin on              " Enable filetype-specific indent.
        syntax on                       " Enable syntax highlight.
    " }
    " Encodings {
        scriptencoding utf-8            " Specify the character encoding used in the script.
        set encoding=utf-8              " Encoding used inside Vim.
        set termencoding=utf-8          " Encoding used for the terminal.
        set fileencoding=utf-8          " Encoding used for the file of current buffer.
        " A list of encodings considered when starting to edit an existing file.
        set fileencodings=utf-8,ucs-bom,ig5,gb2312,latin1
    " }
    " Terminal Options {
        set t_Co=256                    " Number of colors in terminal.
        set ttyfast                     " Indicates a fast terminal connection.
    " }
    " Interfaces {
        set cmdheight=1                 " Command line height.
        set colorcolumn=120             " Highlight the screen column.
        set cursorcolumn                " Highlight the screen column of the cursor.
        set cursorline                  " Highlight the screen line of the cursor.
        set hidden                      " Hidden a buffer when it is abandoned.
        set laststatus=2                " Always show the status line.
        set lazyredraw                  " Enable lazy redraw.
        set number                      " Show number line.
        set numberwidth=5               " Speficy the width of number line.
        set ruler                       " Show the line and column number of the cursor position.
        set scrolloff=4                 " Minimal number of screen lines to keep above and below the cursor.
        set sidescroll=1                " Minimal number of columns to scroll horizontally.
        set sidescrolloff=10            " Minimal number of screen columns to keep to the left and to the right.
        set showcmd                     " Show command in the last line of the screen.
        set showmode                    " Show the mode line.
        set showtabline=2               " Always show the tab line.
        set title                       " Set the terminal title to the current file.
        set fillchars+=vert:│           " Characters to fill the statuslines and vertical separators.
        set updatetime=1000             " If this many milliseconds nothing is typed the swap file will be written to disk

        " Strings to use in 'list' mode and for the :list command.
        set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
    " }
    " History {
        set history=500                 " How many commands be stored in history.
    " }
    " Directory, File {
        set autochdir                   " Auto change to the directory containing the file which was opened file.
        set nobackup                    " Do not make a backup before overwriting a file.
        set noswapfile                  " Do not use a swapfile for the buffer.

        " List of directory names for the backup/swap/undo files.
        set backupdir=$HOME/.vim/tmp/backup/
        set directory=$HOME/.vim/tmp/swap/
        set undodir=$HOME/.vim/tmp/undo/
    " }
    " Text Editor {
        set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
        set virtualedit=all             " Allow virtual editing in all modes.

        " Indent
        set autoindent                  " Copy indent from current line when starting a new line.
        set copyindent                  " Copy the existing lines indent when autoindenting a new line.
        set smartindent                 " Do smart autoindenting when starting a new line.
        set shiftwidth=4                " Number of spaces to use for each step of (auto)indent.

        " <Tab>
        set expandtab                   " Use the appropriate number of spaces to insert a <Tab>.
        set tabstop=4                   " Number of spaces that a <Tab> in the file counts for.
        set softtabstop=4               " Number of spaces that a <Tab> counts for while performing editing operations.

        " Folding
        set foldenable                  " Enable folding.
        set foldlevel=2                 " Folds with a higher level will be closed.
        set foldlevelstart=1            " Sets 'foldlevel' when starting to edit another buffer in a window.
        set foldmarker={,}              " The start and end marker used when the 'foldmethod' is 'marker'.
        set foldmethod=syntax           " Folding by syntax highlight for the current window.
        set foldnestmax=2               " The maximum nesting of oflds for the 'foldmethod' is 'indent' and 'syntax'.

        " Split Windows
        set splitright                  " Splitting a window will put the new window right of the current one.
        set splitbelow                  " Splitting a window will put the new window below the current one.
    " }
    " Search {
        set hlsearch                   " Highlight all matches of search pattern.
        set incsearch                  " Enable incremental search.
        set ignorecase                 " Ignore case in search patterns.
        set smartcase                  " Disable 'ignorecase' if the search pattern contains upper case characters.
        set showmatch                  " When a bracket is inserted, briefly jump to the matching one.
        set matchtime=3                " Tenths of a second to show the matching paren when 'showmatch' is set.
    " }
    " Wildmenu {
        set completeopt=longest,menu    " A list of options for insert mode completion.
        set pumheight=10                " Maximum number of items to show in the popup menu for Insert mode completion.
        set wildchar=<Tab>              " Character you have to type to start wildcard expansion in the command-line.
        set wildmenu                    " Enable command-line completion operates in an enhanced mode.
        set wildmode=list:longest,full  " Completion mode is used for the character specified with 'wildchar'.

        " A list of file patterns is ignored when expanding wildcards.
        set wildignore+=*.sw?                       " Vim swap files.
        set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~ " Backup files.
        set wildignore+=*.luac                      " Lua byte code.
        set wildignore+=*.jar                       " Java archives.
        set wildignore+=*.pyc                       " Python byte code.
        set wildignore+=*.stats                     " Pylint stats.
        set wildignore+=*.class,*.o
        set wildignore+=*.zip
        set wildignore+=*.exe

        " Files with these suffixes get a lower priority when multiple files match a wildcard.
        set suffixes=.bak,~,.o,.info,.swp,.obj
    " }
    " Mouse, Keyboard {
        set mouse=                      " Disable the use of the mouse.
        set selection=inclusive         " Defines the behavior of the selection.
        set selectmode=key,mouse        " Start a selection by mouse or shifted special keys.
        set timeoutlen=1000             " The time in milliseconds that is waited for a key code or mapped key sequence to complete.
    " }
    " Sound {
        set t_vb=
        set novisualbell                " Disable the visual bell.
        set noerrorbells                " Disable the error bells.
    " }
" }

" Source all .vim files in directory by glob {
    function! SourceVimFilesInDirectoryByGlob(dir, glob)
        if isdirectory(a:dir)
            for s:filepath in split(globpath(a:dir, a:glob), '\n')
                exe 'source' s:filepath
            endfor
        endif
    endfunction

    call SourceVimFilesInDirectoryByGlob($HOME . '/.vim/vim.d', '*.vim')
" }

" Bundles (Plugins) {
    if filereadable($HOME . '/.vim/dein.vim')
        source $HOME/.vim/dein.vim
    endif
" }

" Colorscheme {
    try
        colorscheme molokai
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme elflord
    endtry
" }

" Local settings {
    " Include .vimrc_local if it exists. {
        if filereadable($HOME . '/.vimrc_local')
            source $HOME/.vimrc_local
        endif
    " }
" }

" Use syntax complete as omnifunc if nothing else available {
    if has("autocmd") && exists("+omnifunc")
        autocmd FileType *
            \ if &omnifunc == "" |
            \     setlocal omnifunc=syntaxcomplete#Complete |
            \ endif
    endif
" }
