" https://github.com/tpope/vim-ragtag
"
" ragtag.vim: ghetto HTML/XML mappings (formerly allml.vim)

call dein#add('tpope/vim-ragtag', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'html',
        \ 'xml',
    \ ],
    \ 'on_map': ['<Plug>ragtag'],
\ })
