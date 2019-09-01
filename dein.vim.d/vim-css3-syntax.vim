" https://github.com/hail2u/vim-css3-syntax
"
" CSS3 syntax (and syntax defined in some foreign specifications)
" support for Vim's built-in syntax/css.vim

call dein#add('hail2u/vim-css3-syntax', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'css',
        \ 'html',
    \ ],
\ })
