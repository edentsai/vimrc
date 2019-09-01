" https://github.com/ctrlpvim/ctrlp.vim
"
" Active fork of kien/ctrlp.vim—Fuzzy file, buffer, mru, tag, etc finder.

call dein#add('ctrlpvim/ctrlp.vim', {
    \ 'depends': ['vim-airline'],
    \ 'lazy': 1,
    \ 'on_cmd': ['CtrlP'],
    \ 'on_map': ['<Leader><C-p>'],
\ })

let g:ctrlp_map = '<Leader><C-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_cache_dir = $HOME . '/.vim/tmp/ctrlp'
let g:ctrlp_use_caching = 0
let g:ctrlp_clear_cache_on_exit = 0             " 離開 vim 後不要清 cache
let g:ctrlp_max_files = 100000                  " 加大 cache 索引的檔案數, 否則會漏找檔案
let g:ctrlp_working_path_mode = 'ra'

let g:ctrlp_custom_ignore = {
    \ 'dir': '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
\ }

let g:ctrlp_user_command = [
    \ '.git',
    \ 'cd %s && git ls-files . --cached --others --exclude-standard',
    \ 'find %s -type f -not -iwholename "*.[git|hg]*"',
\ ]

let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
\ }

" Configure extension for vim-airline integration.
let g:airline#extensions#ctrlp#color_template = 'normal'
let g:airline#extensions#ctrlp#show_adjacent_modes = 1
