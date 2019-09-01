" http://github.com/thinca/vim-textobj-between
"
" Text objects for a range between a character.

call dein#add('thinca/vim-textobj-between', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'af'],
        \ ['xo', 'if'],
    \ ],
\ })
