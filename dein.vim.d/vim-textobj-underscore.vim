" https://github.com/kana/vim-textobj-underscore
"
" Underscore text-object for Vim.

call dein#add('kana/vim-textobj-underscore', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'a_'],
        \ ['xo', 'i_'],
    \ ],
\ })
