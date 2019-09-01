" https://github.com/fvictorio/vim-textobj-backticks
"
" Vim text objects for regions inside backticks.

call dein#add('fvictorio/vim-textobj-backticks', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'a`'],
        \ ['xo', 'i`'],
    \ ],
\ })
