" https://github.com/thinca/vim-textobj-comment
"
" Text objects for a comment.

call dein#add('thinca/vim-textobj-comment', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'ac'],
        \ ['xo', 'ic'],
    \ ],
\ })
