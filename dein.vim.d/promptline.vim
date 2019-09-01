" https://github.com/edkolev/promptline.vim
"
" Generate a fast shell prompt with powerline symbols and airline colors.

" call dein#add('edkolev/promptline.vim', {
"     \ 'depends': ['vim-airline'],
"     \ 'lazy': 1,
"     \ 'on_cmd': [
"         \ 'Promptline',
"         \ 'PromptlineSnapshot',
"     \ ],
" \ })

" let g:promptline_powerline_symbols = 0
" let g:promptline_theme = 'airline'

" let g:promptline_preset = {
"     \ 'a': ['\u@\H'],
"     \ 'b': ['\w'],
"     \ 'c': [
"         \ '$(git_branch)',
"         \ '$(git rev-parse --short HEAD 2>/dev/null)',
"         \ '$(git_since_last_commit)'
"     \ ],
"     \ 'warn': [promptline#slices#last_exit_code()],
"     \ 'y': ['\n \t'],
"     \ 'options': {
"         \ 'left_sections': ['a', 'b', 'c', 'warn', 'y'],
"         \ 'left_only_sections': ['a', 'b', 'c', 'warn', 'y'],
"     \ },
" \ }

" let g:promptline_symbols = {
"     \ 'left'      : '',
"     \ 'left_alt'  : '>',
"     \ 'dir_sep'   : ' / ',
"     \ 'truncation': '...',
"     \ 'vcs_branch': '',
"     \ 'space'     : ' '
" \ }

" " Configure extension for vim-airline integration.
" let g:airline#extensions#promptline#enabled = 1
" let airline#extensions#promptline#color_template = 'replace'
" let airline#extensions#promptline#snapshot_file = $HOME . '/.bash/prompts/promptline.sh'
