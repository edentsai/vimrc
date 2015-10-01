" vim: set filetype=vim

" Functions {
    " Include vimrc_functions.vim if it exists {
        if filereadable($HOME . '/.vim/vimrc_functions.vim')
            source $HOME/.vim/vimrc_functions.vim
        endif
    " }
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
        set t_Co=256                    " Number of colors in terminal
        set ttyfast                     " Indicates a fast terminal connection
    " }
    " Interfaces {
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
        set showcmd                     " Show command in the last line of the screen.
        set showmode                    " Show the mode line.
        set showtabline=2               " Always show the tab line.
        set title                       " Set the terminal title to the current file.
        set fillchars+=vert:│           " Characters to fill the statuslines and vertical separators.

        " Strings to use in 'list' mode and for the :list command.
        set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
    " }
    " History, File, Directory {
        set history=500                 " How many commands be stored in history.
        set autochdir                   " Auto change to the directory containing the file which was opened file.
        set nobackup                    " Do not make a backup before overwriting a file.
        set noswapfile                  " Do not use a swapfile for the buffer.

        " List of directory names for the backup/swap/undo files,
        " And make the directories if no exists.
        set backupdir=$HOME/.vim/tmp/backup/
        set directory=$HOME/.vim/tmp/swap/
        set undodir=$HOME/.vim/tmp/undo/
        silent! call MakeDirIfNoExists(&backupdir)
        silent! call MakeDirIfNoExists(&directory)
        silent! call MakeDirIfNoExists(&undodir)
    " }
" }
" Local settings {
    " Include .vimrc_local if it exists {
        if filereadable($HOME . '/.vimrc_local')
            source $HOME/.vimrc_local
        endif
    " }
" }
