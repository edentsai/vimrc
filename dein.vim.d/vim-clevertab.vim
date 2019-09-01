" https://github.com/neitanod/vim-clevertab
"
" Tiny replacement for Supertab that DOES do what I need.

call dein#add('neitanod/vim-clevertab', {
    \ 'lazy': 1,
    \ 'on_i': 1,
    \ 'hook_post_source': 'call SetupVimCleverTab()',
\ })

function! SetupVimCleverTab()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-r>=CleverTab#Complete('prev')\<CR>" : "\<S-TAB>"
    inoremap <TAB> <C-r>=CleverTab#Complete('start')<CR>
        \<C-r>=CleverTab#Complete('tab')<CR>
        \<C-r>=CleverTab#Complete('omni')<CR>
        \<C-r>=CleverTab#Complete('neocomplete')<CR>
        \<C-r>=CleverTab#Complete('keyword')<CR>
        \<C-r>=CleverTab#Complete('ultisnips')<CR>
        \<C-r>=CleverTab#Complete('stop')<CR>
endfunction
