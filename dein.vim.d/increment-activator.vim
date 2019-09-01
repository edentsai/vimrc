" https://github.com/nishigori/increment-activator
"
" [Vim] Enhance to increment candidates U have defined

call dein#add('nishigori/increment-activator', {
    \ 'lazy': 1,
    \ 'on_ft': ['gitrebase'],
    \ 'on_map': ['<Plug>(increment-activator-'],
\ })

nmap <C-a> <Plug>(increment-activator-increment)
nmap <C-x> <Plug>(increment-activator-decrement)

let g:increment_activator_no_default_key_mappings = 1
let g:increment_activator_no_default_candidates = 0

let g:increment_activator_filetype_candidates = {
    \ 'php': [
        \ ['public', 'protected', 'private'],
        \ ['class', 'interface', 'trait'],
    \ ],
    \ 'gitrebase': [
        \ ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop'],
        \ ['p', 'r', 'e', 's', 'f', 'x', 'd'],
    \ ],
    \ 'go': [
    \   ['true', 'false', 'iota', 'nil'],
    \   ['byte', 'complex64', 'complex128'],
    \   ['int', 'int8', 'int16', 'int32', 'int64'],
    \   ['uint', 'uint8', 'uint16', 'uint32', 'uint64'],
    \   ['float32', 'float64'],
    \   ['interface', 'struct'],
    \ ],
\ }
