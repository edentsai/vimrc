" https://github.com/haya14busa/incsearch.vim
"
" Improved incremental searching for Vim.

call dein#add('haya14busa/incsearch.vim', {
    \ 'lazy': 1,
    \ 'on_map': [
        \ '<Plug>(incsearch-',
        \ '<Over>(incsearch-',
    \ ],
\ })

map <Leader>/  <Plug>(incsearch-forward)
map <Leader>?  <Plug>(incsearch-backward)
map <Leader>g/ <Plug>(incsearch-stay)

" Fixes some keys in TMUX
" Using '[Z' instead of '<S-Tab>' in TMUX
if '' != system('echo $TMUX_PANE')
    let g:incsearch_cli_key_mappings = {
        \ "[Z" : {
            \ "key" : "<Over>(incsearch-prev)",
            \ "noremap" : 1,
        \ },
        \ "\<S-Tab>" : {
            \ "key" : "<Over>(incsearch-prev)",
            \ "noremap" : 1,
        \ },
        \ "\<C-f>" : {
            \ "key" : "<Over>(incsearch-scroll-f)",
            \ "noremap" : 1,
        \ },
        \ "\<C-b>" : {
            \ "key" : "<Over>(incsearch-scroll-b)",
            \ "noremap" : 1,
        \ },
    \ }
endif
