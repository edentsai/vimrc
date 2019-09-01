" https://github.com/rayburgemeestre/phpfolding.vim
"
" Automatic folding of PHP functions, classes, ... (also folds related PhpDoc).

call dein#add('rayburgemeestre/phpfolding.vim', {
    \ 'lazy': 1,
    \ 'on_ft': ['php'],
    \ 'on_cmd': ['EnableFastPHPFolds'],
    \ 'hook_post_source': 'call SetupPHPFolding()',
\ })

let php_folding = 1
let g:DisableAutoPHPFolding = 1

function! SetupPHPFolding()
    nnoremap <Bslash>pf :EnableFastPHPFolds<CR>
endfunction

" " NOTE: Temporary disabled for performance issue
" " Refresh PHPFolds on insert leave
" autocmd InsertLeave *.php if &modified && exists(":EnableFastPHPFolds") | :EnableFastPHPFolds
