" https://github.com/tpope/vim-commentary
"
" commentary.vim: comment stuff out.
"
" Key mappings in Normal mode {
"   gc   : To comment out the target of a motion
"   gcc  : To comment out a line
"   gcap : To comment out a paragraph a section.
" }
"
" Key mappings in Visual mode {
"   gc   : To comment out the selection at visual mode
" }

call dein#add('tpope/vim-commentary', {
    \ 'lazy': 1,
    \ 'on_cmd': ['Commentary'],
    \ 'on_map': ['gc'],
\ })

" Example: To custom the comment string for a specific filetype
" autocmd FileType sql setlocal commentstring=--\ %s
