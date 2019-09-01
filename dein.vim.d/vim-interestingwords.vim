" https://github.com/lfv89/vim-interestingwords
"
" A vim plugin for highlighting and navigating
" through different words in a buffer.

call dein#add('lfv89/vim-interestingwords', {
    \ 'lazy': 1,
    \ 'on_func': [
        \ 'InterestingWords',
        \ 'UncolorAllWords',
        \ 'WordNavigation',
    \ ],
\ })

nnoremap <silent> <leader>k :call InterestingWords('n')<CR>
nnoremap <silent> <leader>K :call UncolorAllWords()<CR>
nnoremap <silent> n :call WordNavigation('forward')<CR>
nnoremap <silent> N :call WordNavigation('backward')<CR>
