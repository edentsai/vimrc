" https://github.com/godlygeek/tabular
"
" Vim script for text filtering and alignment.

call dein#add('godlygeek/tabular', {
    \ 'lazy': 1,
    \ 'on_cmd': ['Tabularize'],
\ })

noremap <Leader><Tab>/ :Tabularize /
