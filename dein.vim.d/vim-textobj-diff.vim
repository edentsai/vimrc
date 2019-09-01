" https://github.com/kana/vim-textobj-diff
"
" Vim plugin: Text objects for ouputs of diff.

call dein#add('kana/vim-textobj-diff', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'adf'],
        \ ['xo', 'idf'],
    \ ],
\ })
