" https://github.com/chr4/nginx.vim
"
" Improved nginx vim plugin (incl. syntax highlighting)

call dein#add('chr4/nginx.vim', {
    \ 'lazy': 1,
    \ 'on_ft': ['nginx'],
    \ 'on_path': [
        \ 'nginx.conf',
        \ 'nginx-*.conf',
        \ 'nginx/conf/*.conf',
        \ 'nginx/conf.d/*.conf',
    \ ]
\ })

" autocmd BufNewFile,BufRead nginx.conf,nginx-*.conf,nginx/conf.d/*.conf,nginx/conf/*.conf
"     \ setlocal filetype=nginx
