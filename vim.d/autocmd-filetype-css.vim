autocmd FileType css
    \ setlocal foldlevel=1 |
    \ setlocal foldmarker={,} |
    \ setlocal foldmethod=marker |
    \ setlocal iskeyword+=-

autocmd FileType css
    \ setlocal omnifunc=csscomplete#CompleteCSS |
    \ setlocal syntax=css
