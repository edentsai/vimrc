autocmd FileType css,scss,sass
    \ setlocal foldlevel=1 |
    \ setlocal foldmarker={,} |
    \ setlocal foldmethod=marker |
    \ setlocal iskeyword+=-

autocmd FileType css,scss,sass
    \ setlocal omnifunc=csscomplete#CompleteCSS |
    \ setlocal syntax=css
