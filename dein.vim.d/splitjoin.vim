" https://github.com/AndrewRadev/splitjoin.vim
"
" A vim plugin that simplifies the transition
" between multiline and single-line code.

call dein#add('AndrewRadev/splitjoin.vim', {
    \ 'lazy': 1,
    \ 'on_map': [
        \ 'gS',
        \ 'gJ',
    \ ],
\ })
