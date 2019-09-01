" https://github.com/jaxbot/semantic-highlight.vim
"
" Semantic Highlighting for Vim.

call dein#add('jaxbot/semantic-highlight.vim', {
    \ 'lazy': 1,
    \ 'on_cmd': [
        \ 'SemanticHighlight',
        \ 'SemanticHighlightRevert',
        \ 'SemanticHighlightToggle',
    \ ],
\ })

nnoremap <Bslash>sht :SemanticHighlightToggle<CR>
