autocmd FileType json
    \ setlocal foldlevel=1 |
    \ setlocal foldmethod=syntax |
    \ setlocal shiftwidth=4 |
    \ setlocal softtabstop=4 |
    \ setlocal tabstop=4

autocmd BufNewFile,BufRead *.json.example
    \ setlocal filetype=json
