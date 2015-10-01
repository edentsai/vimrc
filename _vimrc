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
" }
" Local settings {
    " Include .vimrc_local if it exists {
        if filereadable($HOME . '/.vimrc_local')
            source $HOME/.vimrc_local
        endif
    " }
" }
