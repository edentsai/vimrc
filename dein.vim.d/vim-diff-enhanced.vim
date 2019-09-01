" https://github.com/chrisbra/vim-diff-enhanced
"
" Better Diff options for Vim.

call dein#add('chrisbra/vim-diff-enhanced', {
    \ 'lazy' : 1,
    \ 'on_cmd' : [
        \ 'EnhancedDiff',
        \ 'PatienceDiff',
    \ ],
\ })
