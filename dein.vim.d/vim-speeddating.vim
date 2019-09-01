" https://github.com/tpope/vim-speeddating
"
" speeddating.vim: use CTRL-A/CTRL-X to increment dates, times, and more.

call dein#add('tpope/vim-speeddating', {
    \ 'lazy': 1,
    \ 'on_map': [
        \ '<C-a>',
        \ '<C-x>',
        \ '<Plug>SpeedDating',
    \ ],
\ })

nmap <leader>d<C-a> <Plug>SpeedDatingUp<Leader>d
nmap <leader>d<C-x> <Plug>SpeedDatingDown<Leader>d
nmap <leader>d+ <Plug>SpeedDatingUp<Leader>d
nmap <leader>d- <Plug>SpeedDatingDown<Leader>d
nmap <leader>dn <Plug>SpeedDatingNowUTC<Leader>d

let g:speeddating_no_mappings = 1
