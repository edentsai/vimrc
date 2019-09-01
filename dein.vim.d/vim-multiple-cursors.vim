" https://github.com/terryma/vim-multiple-cursors
"
" True Sublime Text style multiple selections for Vim

call dein#add('terryma/vim-multiple-cursors', {
    \ 'lazy': 1,
    \ 'on_map': [
        \ '<C-n>',
        \ ['ox', '<C-n>']
    \ ],
\ })

let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

" Called once right before you start selecting multiple cursors
function! Multiple_cursors_before()
    if exists(':NeoCompleteLock') == 2
        exe 'NeoCompleteLock'
    endif
endfunction

" Called once only when the multiple selection is canceled (default <Esc>)
function! Multiple_cursors_after()
    if exists(':NeoCompleteUnlock') == 2
        exe 'NeoCompleteUnlock'
    endif
endfunction
