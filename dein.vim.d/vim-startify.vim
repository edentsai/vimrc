" https://github.com/mhinz/vim-startify
"
" The fancy start screen for Vim.

call dein#add('mhinz/vim-startify', {
    \ 'lazy': 1,
    \ 'on_cmd': ['Startify'],
\ })

let g:startify_change_to_dir = 1
let g:startify_files_number = 15
let g:startify_session_dir = $HOME . '/.vim/session'
let g:startify_session_autoload = 0
let g:startify_session_persistence = 1
let g:startify_session_delete_btartify_session_delete_buffersffers = 1
let g:startify_bookmarks = [$HOME . '/.dotfiles']
