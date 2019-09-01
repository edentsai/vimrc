" https://github.com/haya14busa/vim-asterisk
"
" asterisk.vim provides improved * motions.

call dein#add('haya14busa/vim-asterisk', {
    \ 'lazy': 1,
    \ 'on_map': ['<Plug>(asterisk-'],
\ })

map *   <Plug>(asterisk-*)
map #   <Plug>(asterisk-#)
map g*  <Plug>(asterisk-g*)
map g#  <Plug>(asterisk-g#)
map z*  <Plug>(asterisk-z*)
map gz* <Plug>(asterisk-gz*)
map z#  <Plug>(asterisk-z#)
map gz# <Plug>(asterisk-gz#)

let g:asterisk#keeppos = 1
