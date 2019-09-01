autocmd FileType conf
    \ setlocal commentstring=#\ %s |
    \ setlocal foldlevel=1 |
    \ setlocal foldmethod=marker |
    \ setlocal foldminlines=5

" .env files
autocmd BufNewFile,BufRead *.env,*.env.*
    \ setlocal filetype=conf |
    \ setlocal syntax=dosini

" PHP FPM configuration.
autocmd BufNewFile,BufRead php-fpm.conf,php-fpm-*.conf,php-fpm.d/*.conf
    \ setlocal commentstring=;\ %s |
    \ setlocal filetype=conf |
    \ setlocal syntax=dosini
