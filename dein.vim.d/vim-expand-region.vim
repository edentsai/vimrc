" https://github.com/terryma/vim-expand-region
"
" Vim plugin that allows you to visually select increasingly larger regions of
" text using the same key combination.

call dein#add('terryma/vim-expand-region', {
    \ 'lazy': 1,
    \ 'on_map': ['<Plug>(expand_region_'],
\ })

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)
