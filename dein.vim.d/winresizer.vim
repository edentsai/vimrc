" https://github.com/simeji/winresizer
"
" Very simple vim plugin for easy resizing of your vim windows.
"
" Key mappings in Normal mode {
"     <Ctrl+w>r : Start window resize mode
"     [hjkl]    : Expand window size (work after <Ctrl+w>r)
" }

call dein#add('simeji/winresizer', {
    \ 'lazy': 1,
    \ 'on_cmd': ['WinResizerStartResize'],
    \ 'on_map': ['<C-w>r'],
\ })

let g:winresizer_start_key = '<C-w>r'
let g:winresizer_enable = 1
let g:winresizer_finish_with_escape = 1
