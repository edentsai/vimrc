" https://github.com/SirVer/ultisnips
"
" UltiSnips - The ultimate snippet solution for Vim.

call dein#add('SirVer/ultisnips', {
    \ 'depends': ['vim-snippets'],
    \ 'lazy': 1,
    \ 'on_i': 1,
\ })

call dein#add('honza/vim-snippets', {
    \ 'lazy': 1,
\ })

let g:UltiSnipsExpandTrigger = '<C-Bslash>'
let g:UltiSnipsJumpForwardTrigger = '<C-p>'
let g:UltiSnipsJumpBackwardTrigger = '<C-n>'
let g:UltiSnipsListSnippets = '<C-z>'
let g:UltiSnipsEditSplit = 'vertical'

let g:UltiSnipsSnippetDirectories = [
    \ $HOME . '/.vim/UltiSnips',
\ ]
