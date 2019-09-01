" https://github.com/kana/vim-textobj-datetime
"
" Vim plugin: Text objects for date and time.

call dein#add('kana/vim-textobj-datetime', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'ada'],
        \ ['xo', 'ida'],
    \ ],
\ })
