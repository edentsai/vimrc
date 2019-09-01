" https://github.com/rhysd/clever-f.vim
"
" Extended f, F, t and T key mappings for Vim.

call dein#add('rhysd/clever-f.vim', {
    \ 'lazy': 1,
    \ 'on_map': [
        \ 'f',
        \ 'F',
        \ 't',
        \ 'T',
    \ ],
\ })

let g:clever_f_across_no_line = 1
let g:clever_f_ignore_case = 0
let g:clever_f_show_prompt = 1
let g:clever_f_smart_case = 1
let g:clever_f_mark_char = 1
let g:clever_f_mark_cursor = 1
let g:clever_f_repeat_last_char_inputs = ["\<CR>"]
