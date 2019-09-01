" https://github.com/akiyan/vim-textobj-php
"
" Vim text object plugin for PHP view template.

call dein#add('akiyan/vim-textobj-php', {
    \ 'depends': ['vim-textobj-user'],
    \ 'lazy': 1,
    \ 'on_map': [
        \ ['xo', 'ap'],
        \ ['xo', 'ip'],
    \ ],
\ })
