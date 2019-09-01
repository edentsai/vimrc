" https://github.com/kana/vim-textobj-user
"
" Vim plugin: Create your own text objects.
"
" Reference:
" - https://github.com/kana/vim-textobj-user/wiki

call dein#add('kana/vim-textobj-user', {
    \ 'lazy': 1,
    \ 'on_func': 'textobj#user',
\ })
