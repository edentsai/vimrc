" https://github.com/2072/php-indenting-for-vim
"
" The official VIm indent script for PHP.

call dein#add('2072/php-indenting-for-vim', {
    \ 'lazy': 1,
    \ 'on_ft': ['php'],
\ })

let g:PHP_BracesAtCodeLevel = 0
let g:PHP_autoformatcomment = 0
let g:PHP_noArrowMatching = 1
let g:PHP_outdentSLComments = 0
