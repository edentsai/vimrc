autocmd FileType yaml
    \ setlocal commentstring=#\ %s |
    \ setlocal foldlevel=5 |
    \ setlocal foldlevelstart=6 |
    \ setlocal shiftwidth=2 |
    \ setlocal softtabstop=2 |
    \ setlocal tabstop=2

autocmd FileType yaml
    \ setlocal syntax=yaml

" Yamllint configuration
" https://github.com/adrienverge/yamllint
autocmd BufNewFile,BufRead *.yamllint
    \ setlocal filetype=yaml
