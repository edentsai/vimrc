" https://github.com/ericpruitt/tmux.vim
"
" Vim syntax file for tmux configuration files.

call dein#add('ericpruitt/tmux.vim', {
    \ 'lazy': 1,
    \ 'on_ft': ['tmux'],
    \ 'on_path': ['.tmux.conf'],
    \ 'rtp': 'vim/',
\ })
