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

" Plugins For Shell, Bash, TMUX {
    " " edkolev/tmuxline.vim - Simple tmux statusline generator with support for powerline symbols and airline integration {
    "     call dein#add('edkolev/tmuxline.vim', {
    "         \ 'depends': ['vim-airline'],
    "         \ 'lazy': 1,
            " \ 'on_cmd': ['Tmuxline'],
    "     \ })

    "     let g:tmuxline_powerline_separators = 0
    "     let g:tmuxline_theme = 'nightly_fox'
    "     let g:tmuxline_preset = {
    "         \ 'a'   : ['#(whoami)@#h'],
    "         \ 'b'   : ['❐ #S'],
    "         \ 'c'   : [''],
    "         \ 'win' : ['[#I] #W'],
    "         \ 'cwin': ['[#I] #W'],
    "         \ 'x'   : [''],
    "         \ 'y'   : ['%a', '%Y-%m-%d %H:%M:%S'],
    "         \ 'options': {
    "             \ 'status-justify': 'left'
    "         \ }
    "     \ }

    "     " Configure vim-airline extension
    "     let g:airline#extensions#tmuxline#enabled = 1
    "     let airline#extensions#tmuxline#color_template = 'replace'
    "     let airline#extensions#tmuxline#snapshot_file = '~/.tmux/colorschemes/tmuxlineSnapshot.conf'
    " " }
    " ericpruitt/tmux.vim - Vim syntax file for tmux configuration files {
        call dein#add('ericpruitt/tmux.vim', {
            \ 'lazy': 1,
            \ 'on_ft': ['conf', 'tmux'],
            \ 'rtp': 'vim/',
        \ })
    " }
    " vimez/vim-tmux - Vim syntax highlighting for tmux.conf {
        call dein#add('vimez/vim-tmux', {
            \ 'lazy': 1,
            \ 'on_ft': ['conf', 'tmux'],
        \ })
    " }
    " dag/vim-fish - Vim support for editing fish scripts {
        call dein#add('dag/vim-fish', {
            \ 'lazy': 1,
            \ 'on_ft': ['fish'],
        \ })
    " }
" }
" Plugins For Misc {
    " uarun/vim-protobuf - Vim syntax highlighting for Google's Protocol Buffers {
        call dein#add('uarun/vim-protobuf', {
            \ 'lazy': 1,
            \ 'on_ft': ['proto'],
        \ })
    " }
    " ludovicchabant/vim-gutentags - A Vim plugin that manages your tag files {
        " https://robertbasic.com/blog/current-vim-setup-for-php-development/
        call dein#add('ludovicchabant/vim-gutentags')

        let g:gutentags_enabled = 1
        let g:gutentags_ctags_executable='~/.vim/bin/ctags'
        let g:gutentags_cache_dir = '~/.vim/tmp/gutentags'
        let g:gutentags_ctags_exclude = [
            \ '*.css',
            \ '*.html', '*.js', '*.json', '*.xml',
            \ '*.phar', '*.ini', '*.rst', '*.md',
            \ '*vendor/*/test*', '*vendor/*/Test*',
            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
            \ '*var/cache*', '*var/log*'
        \ ]
        let g:gutentags_exclude_filetypes = []
    " }
" }
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
