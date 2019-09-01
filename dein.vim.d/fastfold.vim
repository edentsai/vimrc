" https://github.com/Konfekt/FastFold
"
" Speed up Vim by updating folds only when called-for.

call dein#add('Konfekt/FastFold')

let g:fastfold_savehook = 1     " 在儲存時更新折疊資訊
let g:javaScript_fold = 1
let g:tex_fold_enabled = 1

" NOTE: Temporary disable g:perl_fold, it cause folding issue in vimrc
" let g:perl_fold = 1

let g:php_folding = 1
let g:vimsyn_folding = 'af'
let g:xml_syntax_folding = 1

" FastFold 只在 za/zA/zx/zX 時更新折疊資訊
" let g:fastfold_fold_command_suffixes = ['a', 'A', 'x', 'X']
" let g:fastfold_skip_filetypes = [
"     \ 'vim',
"     \ 'taglist',
" \ ]
