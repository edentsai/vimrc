" https://github.com/kana/vim-textobj-syntax
"
" Vim plugin: Text objects for syntax highlighted items.

call dein#add('kana/vim-textobj-syntax', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'ay'],
        \ ['xo', 'iy'],
    \ ],
\ })
