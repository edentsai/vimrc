" https://github.com/h1mesuke/textobj-wiw
"
" Text object to select a range of words for humans.

call dein#add('h1mesuke/textobj-wiw', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'a,w'],
        \ ['xo', 'i,w'],
    \ ],
\ })
