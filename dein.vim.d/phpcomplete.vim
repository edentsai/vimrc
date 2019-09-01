" https://github.com/shawncplus/phpcomplete.vim
"
" Improved PHP omnicompletion.

call dein#add('shawncplus/phpcomplete.vim', {
    \ 'lazy': 1,
    \ 'on_ft': ['php'],
    \ 'hook_post_source': 'setlocal commentstring=//\ %s'
\ })

let g:phpcomplete_relax_static_constraint = 1
let g:phpcomplete_enhance_jump_to_definition = 1

let g:phpcomplete_mappings = {
    \ 'jump_to_def': '<C-]>',
    \ 'jump_to_def_split': '<C-Q><C-]>',
    \ 'jump_to_def_vsplit': '<C-Q><C-\>',
    \ 'jump_to_def_tabnew': '<C-Q><C-[>',
\ }
