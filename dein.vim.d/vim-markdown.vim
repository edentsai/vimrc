" https://github.com/tpope/vim-markdown
"
" Vim Markdown runtime files

call dein#add('tpope/vim-markdown', {
    \ 'lazy': 1,
    \ 'on_ft': ['markdown'],
\ })

" let g:markdown_folding = 1
let g:markdown_minlines = 100
let g:markdown_syntax_conceal = 0

" let g:markdown_fenced_languages = [
"     \ 'bash=sh',
"     \ 'html',
"     \ 'json',
"     \ 'php',
"     \ 'python',
"     \ 'sh',
"     \ 'sql',
"     \ 'vim',
"     \ 'yaml',
" \ ]
