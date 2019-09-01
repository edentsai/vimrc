" https://github.com/othree/html5.vim{
"
" HTML5 omnicomplete and syntax.

call dein#add('othree/html5.vim', {
    \ 'depends': ['html5-syntax.vim'],
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'css',
        \ 'html',
    \ ],
\ })

let g:html5_event_handler_attributes_complete = 1
let g:html5_rdfa_attributes_complete = 1
let g:html5_microdata_attributes_complete = 1
let g:html5_aria_attributes_complete = 1
