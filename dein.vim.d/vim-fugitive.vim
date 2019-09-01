" https://github.com/tpope/vim-fugitive
"
" A Git wrapper so awesome, it should be illegal.

call dein#add('tpope/vim-fugitive', {
    \ 'depends': ['vim-airline'],
    \ 'lazy': 1,
    \ 'on_cmd': [
        \ 'Git', 'Gdiff', 'Gstatus', 'Gwrite', 'Gcd', 'Glcd',
        \ 'Ggrep', 'Glog', 'Gcommit', 'Gblame', 'Gbrowse',
    \ ],
\ })
