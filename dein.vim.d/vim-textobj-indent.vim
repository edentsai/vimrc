" https://github.com/kana/vim-textobj-indent
"
" Vim plugin: Text objects for indented blocks of lines.

call dein#add('kana/vim-textobj-indent', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'aI'],
        \ ['xo', 'iI'],
    \ ]
\ })
