" https://github.com/kana/vim-textobj-lastpat
"
" Vim plugin: Text objects for the last searched pattern.

call dein#add('kana/vim-textobj-lastpat', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'a/'],
        \ ['xo', 'i/'],
    \ ],
\ })
