" vim: set filetype=vim

" NeoBundle - Auto download and setup {
    " Download NeoBundle {
        let neoBundleReadme = expand($HOME . '/.vim/bundles/neobundle.vim/README.md')
        if !filereadable(neoBundleReadme)
            echo "Download NeoBundle to '"
            silent !mkdir -p $HOME/.vim/bundles
            silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundles/neobundle.vim

            autocmd VimEnter * NeoBundleCheck
        endif
    " }
    " Set up NeoBundle {
        if has('vim_starting')
            if &compatible
                set nocompatible   " Be Improved
            endif

            set runtimepath+=$HOME/.vim/bundles/neobundle.vim/
        endif

        call neobundle#begin(expand($HOME.'/.vim/bundles/'))
        " Is better if NeoBundle rules NeoBundle (needed!)
        NeoBundleFetch 'Shougo/neobundle.vim'
    " }
" }

" Utilities {
    " Shougo/vimproc.vim - Interactive command execution in Vim. {
        NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
                \ 'windows' : 'tools\\update-dll-mingw',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'linux' : 'make',
                \ 'unix' : 'gmake',
            \ },
        \ }
    " }
" }

" NeoBundle - Running {
    " End {
        call neobundle#end()

        " Required:
        filetype plugin indent on
    " }
" }
