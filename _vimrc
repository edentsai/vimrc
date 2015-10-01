" vim: set filetype=vim

" Functions {
    " Include vimrc_functions.vim if it exists {
        if filereadable($HOME . '/.vim/vimrc_functions.vim')
            source $HOME/.vim/vimrc_functions.vim
        endif
    " }
" }
" Local settings {
    " Include .vimrc_local if it exists {
        if filereadable($HOME . '/.vimrc_local')
            source $HOME/.vimrc_local
        endif
    " }
" }
