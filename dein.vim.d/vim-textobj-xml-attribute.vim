" https://github.com/akiyan/vim-textobj-xml-attribute
"
" Vim plugin: Text objects for XML attribute.

call dein#add('akiyan/vim-textobj-xml-attribute', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'axa'],
        \ ['xo', 'ixa'],
    \ ],
\ })
