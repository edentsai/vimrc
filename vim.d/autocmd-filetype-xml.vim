autocmd FileType xml
    \ let xml_syntax_folding=1

autocmd FileType xml
    \ setlocal foldlevel=4 |
    \ setlocal foldlevelstart=5 |
    \ setlocal foldmethod=syntax |
    \ setlocal foldnestmax=6

autocmd FileType xml
    \ setlocal omnifunc=xmlcomplete#CompleteTags |
    \ setlocal syntax=xml

