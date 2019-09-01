" https://github.com/kana/vim-textobj-line
"
" Vim plugin: Text objects for the current line.

call dein#add('kana/vim-textobj-line', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'al'],
        \ ['xo', 'il'],
    \ ],
\ })
