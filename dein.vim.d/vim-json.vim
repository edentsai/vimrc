" https://github.com/elzr/vim-json
"
" A better JSON for Vim: distinct highlighting of keywords vs values,
" JSON-specific (non-JS) warnings, quote concealing. Pathogen-friendly.

call dein#add('elzr/vim-json', {
    \ 'lazy': 1,
    \ 'on_ft': ['json'],
\ })

let g:vim_json_syntax_conceal = 0
