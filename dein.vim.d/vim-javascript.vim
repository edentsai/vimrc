" https://github.com/pangloss/vim-javascript
"
" Vastly improved Javascript indentation and syntax support in Vim.

call dein#add('pangloss/vim-javascript', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'html',
        \ 'javascript',
    \ ],
\ })

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow = 1
