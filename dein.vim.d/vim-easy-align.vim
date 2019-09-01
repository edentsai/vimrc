" https://github.com/junegunn/vim-easy-align
"
" A Vim alignment plugin

call dein#add('junegunn/vim-easy-align', {
    \ 'lazy': 1,
    \ 'on_map': ['<Plug>(EasyAlign)']
\ })

" Start interactive EasyAlign in visual mode (e.g. vip<CR>)
vmap <CR> <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
