" https://github.com/mhinz/vim-signify
"
" Signify (or just Sy) uses the sign column to indicate added, modified and
" removed lines in a file that is managed by a version control system (VCS).

call dein#add('mhinz/vim-signify', {
    \ 'depends': ['vim-airline']
\ })

nnoremap <Bslash>gt :SignifyToggle<CR>
nnoremap <Bslash>gh :SignifyToggleHighlight<CR>
nnoremap <Bslash>gr :SignifyRefresh<CR>
nnoremap <Bslash>gd :SignifyDebug<CR>

nmap <Bslash>gj <plug>(signify-next-hunk)
nmap <Bslash>gk <plug>(signify-prev-hunk)

let g:signify_vcs_list = ['git']
let g:signify_disable_by_default = 0
let g:signify_line_highlight = 0
let g:signify_mapping_toggle = '<leader>gt'
let g:signify_mapping_prev_hunk = '<leader>gk'
let g:signify_mapping_next_hunk = '<leader>gj'

" Configure extension for vim-airline integration.
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']
