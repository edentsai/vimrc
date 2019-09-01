" https://github.com/mjbrownie/html-textobjects
"
" Some advanced vim html textobject mappings.

call dein#add('mjbrownie/html-textobjects', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'ahf'],
        \ ['xo', 'ihf'],
    \ ],
\ })
