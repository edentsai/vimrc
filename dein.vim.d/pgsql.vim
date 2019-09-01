" https://github.com/lifepillar/pgsql.vim
"
" The best PostgreSQL plugin for Vim!

call dein#add('lifepillar/pgsql.vim', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'pgsql',
        \ 'sql',
    \ ],
    \ 'on_cmd': ['SQLSetType'],
\ })

let g:sql_type_default = 'pgsql'
let g:pgsql_pl = ['python']
