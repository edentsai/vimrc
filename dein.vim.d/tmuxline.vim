" https://github.com/edkolev/tmuxline.vim
"
" Simple tmux statusline generator with support for powerline symbols
" and statusline / airline / lightline integration.

" call dein#add('edkolev/tmuxline.vim', {
"     \ 'depends': ['vim-airline'],
"     \ 'lazy': 1,
"     \ 'on_cmd': ['Tmuxline'],
" \ })

" let g:tmuxline_powerline_separators = 0
" let g:tmuxline_theme = 'nightly_fox'

" let g:tmuxline_preset = {
"     \ 'a': ['#(whoami)@#h'],
"     \ 'b': ['❐ #S'],
"     \ 'c': [''],
"     \ 'win' : ['[#I] #W'],
"     \ 'cwin': ['[#I] #W'],
"     \ 'x': [''],
"     \ 'y': ['%a', '%Y-%m-%d %H:%M:%S'],
"     \ 'options': {
"         \ 'status-justify': 'left'
"     \ }
" \ }

" " Configure extension for vim-airline integration.
" let g:airline#extensions#tmuxline#enabled = 1
" let airline#extensions#tmuxline#color_template = 'replace'
" let airline#extensions#tmuxline#snapshot_file = '~/.tmux/colorschemes/tmuxlineSnapshot.conf'
