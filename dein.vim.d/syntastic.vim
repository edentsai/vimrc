" https://github.com/vim-syntastic/syntastic
"
" Syntax checking hacks for vim.

call dein#add('vim-syntastic/syntastic', {
    \ 'depends': ['vim-airline'],
\ })

nmap <Bslash>st :SyntasticToggleMode<CR>

let g:syntastic_aggregate_errors = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_loc_list_height = 5
let g:syntastic_enable_highlighting = 1
let g:syntastic_go_checkers = ['govet', 'golint', 'errcheck']
let g:syntastic_php_checkers = ['phpcs', 'phpmd', 'php']
let g:syntastic_html_tidy_ignore_errors = []

" Configure extension for vim-airline integration.
let g:airline#extensions#syntastic#enabled = 1
