" https://github.com/chrisbra/csv.vim
"
" A Filetype plugin for csv files.

call dein#add('chrisbra/csv.vim', {
    \ 'depends': ['vim-airline'],
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'csv',
        \ 'tsv',
    \ ],
    \ 'hook_post_source': 'call SetupCsv()'
\ })

let g:csv_autocmd_arrange = 0
let g:csv_autocmd_arrange_size = 512*512

" Configure extension for vim-airline integration.
let g:airline#extensions#csv#enabled = 1
let g:airline#extensions#csv#column_display = 'Name'

function! SetupCsv()
    nnoremap <Bslash>ac :%ArrangeColumn<CR>:Header 1<CR>
    nnoremap <Bslash>uac :%UnArrangeColumn<CR>:Header 1<CR>
endfunction

autocmd BufRead,BufNewFile *.csv,*.tsv
    \ setlocal filetype=csv
