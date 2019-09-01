" https://github.com/ludovicchabant/vim-gutentags
"
" A Vim plugin that manages your tag files.
"
" References:
" - https://robertbasic.com/blog/current-vim-setup-for-php-development/

call dein#add('ludovicchabant/vim-gutentags')

let g:gutentags_enabled = 1
let g:gutentags_cache_dir = $HOME . '/.vim/tmp/gutentags'
let g:gutentags_ctags_executable = $HOME . '/.vim/bin/ctags'

let g:gutentags_ctags_exclude = [
    \ '*.css',
    \ '*.html',
    \ '*.ini',
    \ '*.js',
    \ '*.json',
    \ '*.md',
    \ '*.phar',
    \ '*.rst',
    \ '*.xml',
    \ '*var/cache*',
    \ '*var/log*',
    \ '*vendor/*/Fixture*',
    \ '*vendor/*/Test*',
    \ '*vendor/*/fixture*',
    \ '*vendor/*/test*',
\ ]

let g:gutentags_exclude_filetypes = []
