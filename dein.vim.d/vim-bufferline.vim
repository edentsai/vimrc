" https://github.com/bling/vim-bufferline
"
" Super simple vim plugin to show the list of buffers in the command bar.

call dein#add('bling/vim-bufferline')

let g:bufferline_echo = 0
let g:bufferline_fname_mod = ':p:~'
let g:bufferline_rotate = 0
let g:bufferline_solo_highlight = 1

" Configure extension for vim-airline integration.
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#bufferline#overwrite_variables = 1
