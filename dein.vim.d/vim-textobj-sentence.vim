" https://github.com/reedes/vim-textobj-sentence
"
" Improving on Vim's native sentence text object and motion.

call dein#add('reedes/vim-textobj-sentence', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'as'],
        \ ['xo', 'is'],
    \ ],
\ })
