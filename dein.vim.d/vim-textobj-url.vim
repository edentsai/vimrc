" https://github.com/mattn/vim-textobj-url
"
" Vim plugin: Text objects for URL.

call dein#add('mattn/vim-textobj-url', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'au'],
        \ ['xo', 'iu'],
    \ ],
\ })
