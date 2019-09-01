" https://github.com/vim-airline/vim-airline
"
" Lean & mean status/tabline for vim that's light as air.

call dein#add('vim-airline/vim-airline', {
    \ 'depends': [
        \ 'vim-airline-themes',
        \ 'vim-bufferline',
    \ ],
\ })

call dein#add('vim-airline/vim-airline-themes', {
    \ 'lazy': 1,
\ })

let g:airline_theme = 'murmur'
let g:airline_detect_paste = 1
let g:airline_detect_modified = 1

" Configure powerline fonts.
let g:airline_powerline_fonts = 0
if 0 == g:airline_powerline_fonts
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_symbols = {}
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.linenr = '␊' " or ␤
    " let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.whitespace = 'Ξ'
endif

" Configure branch extension.
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#branch#empty_message = ''
let g:airline#extensions#branch#format = 0

" Configure tabline extension
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#tab_nr_type = 0
let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Configure whitespace extension
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
let g:airline#extensions#whitespace#show_message = 1
