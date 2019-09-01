" https://github.com/sgur/vim-textobj-parameter
"
" vim-textobj-parameter is a Vim plugin to provide text objects
" (a, and i, by default) to select parameters of functions.

call dein#add('sgur/vim-textobj-parameter', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'a,'],
        \ ['xo', 'i,'],
    \ ],
\ })
