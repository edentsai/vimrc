" https://github.com/Shougo/neocomplete.vim
"
" Next generation completion framework after neocomplcache

call dein#add('Shougo/neocomplete.vim', {
    \ 'depends': ['vimproc.vim'],
    \ 'lazy': 1,
    \ 'on_i': 1,
    \ 'hook_post_source': 'call SetupNeoComplete()',
\ })

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_auto_select = 1
let g:neocomplete#enable_ignore_case = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
let g:neocomplete#min_keyword_length = 2
let g:neocomplete#auto_completion_start_length = 2
let g:neocomplete#manual_completion_start_length = 2
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#release_cache_time = 300
let g:neocomplete#skip_auto_completion_time = "0.5"
let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

if !exists('g:neocomplete#delimiter_patterns')
    let g:neocomplete#delimiter_patterns = {}
endif
let g:neocomplete#delimiter_patterns.vim = ['#']
let g:neocomplete#delimiter_patterns.cpp = ['::']
let g:neocomplete#delimiter_patterns.php = ['::', '->']

if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplete#sources#omni#functions')
    let g:neocomplete#sources#omni#functions = {}
endif
let g:neocomplete#sources#omni#functions.sql = 'sqlcomplete#Complete'

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

function! SetupNeoComplete()
    " <C-h>, <Left>: close popup and move backward char.
    inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
    inoremap <expr><Left> neocomplete#smart_close_popup() . "\<Left>"

    inoremap <expr><C-g> neocomplete#undo_completion()
    inoremap <expr><C-l> neocomplete#complete_common_string()

    " Disable sort.
    call neocomplete#custom#source('_', 'sorters', [''])
endfunction
