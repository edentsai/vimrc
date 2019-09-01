" https://github.com/scrooloose/nerdtree
"
" A tree explorer plugin for vim.

call dein#add('scrooloose/nerdtree', {
    \ 'depends': ['nerdtree-git-plugin'],
    \ 'lazy': 1,
    \ 'on_cmd': ['NERDTreeToggle'],
\ })

call dein#add('Xuyuanp/nerdtree-git-plugin', {
    \ "lazy": 1,
\ })

nnoremap <Bslash><Bslash> :NERDTreeToggle<CR>

let NERDTreeShowLineNumbers = 1
let NERDTreeShowHidden = 0
let NERDTreeIgnore = ['\~$', '\.lo$', '\.la$', '\.pyc']
