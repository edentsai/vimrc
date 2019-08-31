autocmd FileType go
    \ setlocal foldlevel=10 |
    \ setlocal foldmethod=syntax |
    \ setlocal noexpandtab

autocmd FileType go
    \ setlocal omnifunc=go#complete#Complete |
    \ setlocal syntax=go
