" https://github.com/saihoooooooo/vim-textobj-space
"
" Text objects for continuity space.

call dein#add('saihoooooooo/vim-textobj-space', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'aS'],
        \ ['xo', 'iS'],
    \ ],
\ })
