" https://github.com/gregsexton/MatchTag
"
" Vim's MatchParen for HTML tags

call dein#add('gregsexton/MatchTag', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'xml',
        \ 'html',
    \ ],
\ })
