" Download dein.vim if not exists {
    let dein_readme = expand($HOME . '/.vim/dein/repos/github.com/Shougo/dein.vim/README.md')
    if !filereadable(dein_readme)
        echo "Download dein.vim :\n"
        " silent !mkdir -p $HOME/.vim/bundles/repos/github.com/Shougo/
        silent !git clone https://github.com/Shougo/dein.vim.git $HOME/.vim/dein/repos/github.com/Shougo/dein.vim
    endif
" }

" Initialize dein.vim {
    " Be improved
    if &compatible
        set nocompatible
    endif

    set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim

    " Configure plugins {
    call dein#begin(expand($HOME . '/.vim/dein'), [expand($HOME . '/.vim/dein.vim')])

        " Shougo/dein.vim - Dark powered Vim/Neovim plugin manager {
            call dein#add('Shougo/dein.vim')

            let g:dein#install_message_type='echo'
        " }

        call SourceVimFilesInDirectoryByGlob($HOME . '/.vim/dein.vim.d', '*.vim')

    call dein#end()
    " }

    autocmd VimEnter *
        \ call dein#call_hook('source') |
        \ call dein#call_hook('post_source')

    filetype plugin indent on
    syntax enable
" }

" Check and install plugins {
    if dein#check_install()
        set cmdheight=40
        call dein#install()
        set cmdheight=1
    endif
" }
