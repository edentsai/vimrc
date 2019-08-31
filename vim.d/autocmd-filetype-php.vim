autocmd FileType php
    \ setlocal commentstring=//\ %s |
    \ setlocal foldlevel=1 |
    \ setlocal foldlevelstart=2

autocmd FileType php
    \ setlocal syntax=php |
    \ setlocal omnifunc=phpcomplete#CompletePHP

" PHP-CS-Fixer configuration.
autocmd BufNewFile,BufRead *.php_cs,*.php_cs.dist
    \ setlocal filetype=php
