" https://github.com/mbbill/undotree
"
" The undo history visualizer for Vim

call dein#add('mbbill/undotree', {
    \ 'lazy': 1,
    \ 'on_cmd': [
        \ 'UndotreeToggle',
        \ 'UndotreeShow',
        \ 'UndotreeHide',
    \ ],
\ })

let g:undotree_SplitWidth = 30
let g:undotree_DiffpanelHeight = 15
let g:undotree_DiffAutoOpen = 1
let g:undotree_SetFocusWhenToggle = 1

nmap <Bslash>ut :UndotreeToggle<CR>
