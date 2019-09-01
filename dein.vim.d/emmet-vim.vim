" https://github.com/mattn/emmet-vim
"
" emmet-vim is a vim plug-in which provides support for expanding
" abbreviations similar to emmet.

call dein#add('mattn/emmet-vim', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'css',
        \ 'html',
        \ 'markdown',
        \ 'xml',
    \ ],
\ })
