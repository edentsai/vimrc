" Auto download and setup dein.vim {
    " Download dein.vim {
        let deinReadme = expand($HOME . '/.vim/dein/repos/github.com/Shougo/dein.vim/README.md')
        if !filereadable(deinReadme)
            echo "Download dein.vim :\n"
            " silent !mkdir -p $HOME/.vim/bundles/repos/github.com/Shougo/
            silent !git clone https://github.com/Shougo/dein.vim.git $HOME/.vim/dein/repos/github.com/Shougo/dein.vim
        endif
    " }
    " Set up dein.vim {
        if &compatible
            set nocompatible   " Be Improved
        endif

        set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim
    " }
" }

" if dein#load_state(expand($HOME . '/.vim/dein'))
    call dein#begin(expand($HOME . '/.vim/dein'), [expand($HOME . '/.vim/dein.vim')])

    " Shougo/dein.vim - Dark powered Vim/Neovim plugin manager {
        call dein#add('Shougo/dein.vim')

        let g:dein#install_message_type='echo'
    " }

    call SourceVimFilesInDirectoryByGlob($HOME . '/.vim/dein.vim.d', '*.vim')

    call dein#end()
    " call dein#save_state()
" endif

autocmd VimEnter * call dein#call_hook('source') |
    \ call dein#call_hook('post_source')

filetype plugin indent on
syntax enable

if dein#check_install()
    set cmdheight=40
    call dein#install()
    set cmdheight=1
endif
