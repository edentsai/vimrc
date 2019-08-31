autocmd FileType gitconfig,gitignore
    \ setlocal commentstring=#\ %s

autocmd FileType gitcommit,gitrebase
    \ setlocal commentstring=#\ %s |
    \ setlocal textwidth=112
