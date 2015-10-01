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
" }
" Local settings {
    " Include .vimrc_local if it exists {
        if filereadable($HOME . '/.vimrc_local')
            source $HOME/.vimrc_local
        endif
    " }
" }
