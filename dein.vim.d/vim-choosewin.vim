" https://github.com/t9md/vim-choosewin
"
" Land on window you chose like tmux's 'display-pane'

call dein#add('t9md/vim-choosewin', {
    \ 'lazy': 1,
    \ 'on_map': [
        \ '<C-w><C-w>',
        \ '<Plug>(choosewin)'
    \ ],
\ })

nmap <C-w><C-w> <Plug>(choosewin)

" if you want to use overlay feature.
let g:choosewin_overlay_enable = 1
