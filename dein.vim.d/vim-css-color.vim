" https://github.com/ap/vim-css-color
"
" Preview colours in source code while editing.

call dein#add('ap/vim-css-color', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'css',
        \ 'html',
    \ ],
\ })
