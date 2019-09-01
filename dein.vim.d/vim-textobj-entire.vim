" https://github.com/kana/vim-textobj-entire
"
" Vim plugin: Text objects for entire buffer.

call dein#add('kana/vim-textobj-entire', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'ae'],
        \ ['xo', 'ie'],
    \ ],
\ })
