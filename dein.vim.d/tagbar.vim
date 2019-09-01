" https://github.com/majutsushi/tagbar
"
" Vim plugin that displays tags in a window, ordered by scope.

call dein#add('majutsushi/tagbar', {
    \ 'depends': [
        \ 'vim-airline',
        \ 'tagbar-phpctags.vim'
    \ ],
    \ 'lazy': 1,
    \ 'on_cmd': ['TagbarToggle'],
\ })

call dein#add('vim-php/tagbar-phpctags.vim', {
    \ 'lazy': 1
\ })

noremap <Bslash>t :TagbarToggle<CR>

let g:tagbar_autoclose = 1
let g:tagbar_autofoucs = 1
let g:tagbar_autopreview = 0
let g:tarbar_autoshowtag = 1
let g:tagbar_foldlevel = 1
let g:tabbar_indent = 2
let g:tagbar_iconchars = ['▶ ', '▼ ']
let g:tagbar_left = 0
let g:tagbar_show_linenumbers = 0
let g:tagbar_show_visibility = 1
let g:tagbar_sort = 1
let g:tagbar_vertical = 0
let g:tagbar_width = 40

let g:tagbar_type_css = {
    \ 'ctagstype': 'Css',
    \ 'kinds': [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities',
    \ ]
\ }

let g:tagbar_type_php  = {
    \ 'ctagstype' : 'php',
    \ 'kinds'     : [
        \ 'i:interfaces',
        \ 'c:classes',
        \ 'd:constants',
        \ 'f:functions',
        \ 'j:javascript functions:1'
    \ ]
\ }

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" Configure tagbar-phpctags plugin.
let g:tagbar_phpctags_bin = $HOME . '/.vim/bin/phpctags'
let g:tagbar_phpctags_memory_limit = '128M'

" Configure extension for vim-airline integration.
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#tagbar#flags = ''
