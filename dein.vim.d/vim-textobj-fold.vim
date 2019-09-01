" https://github.com/kana/vim-textobj-fold
"
" Vim plugin: Text objects for foldings.

call dein#add('kana/vim-textobj-fold', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'az'],
        \ ['xo', 'iz'],
    \ ],
\ })
