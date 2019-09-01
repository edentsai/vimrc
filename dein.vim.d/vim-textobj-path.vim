" https://github.com/paulhybryant/vim-textobj-path
"
" This Vim plugin provides text objects for file paths.

call dein#add('paulhybryant/vim-textobj-path', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'ap'],
        \ ['xo', 'aP'],
        \ ['xo', 'ip'],
        \ ['xo', 'iP'],
    \ ],
\ })
