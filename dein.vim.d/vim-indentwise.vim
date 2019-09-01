" https://github.com/jeetsukumaran/vim-indentwise
"
" A Vim plugin for indent-level based motion.

call dein#add('jeetsukumaran/vim-indentwise', {
    \ 'lazy': 1,
    \ 'on_map': ['<Plug>(IndentWise'],
\ })

map <Leader>[- <Plug>(IndentWisePreviousLesserIndent)
map <Leader>[= <Plug>(IndentWisePreviousEqualIndent)
map <Leader>[+ <Plug>(IndentWisePreviousGreaterIndent)
map <Leader>]- <Plug>(IndentWiseNextLesserIndent)
map <Leader>]= <Plug>(IndentWiseNextEqualIndent)
map <Leader>]+ <Plug>(IndentWiseNextGreaterIndent)
map <Leader>[_ <Plug>(IndentWisePreviousAbsoluteIndent)
map <Leader>]_ <Plug>(IndentWiseNextAbsoluteIndent)
map <Leader>[% <Plug>(IndentWiseBlockScopeBoundaryBegin)
map <Leader>]% <Plug>(IndentWiseBlockScopeBoundaryEnd)
