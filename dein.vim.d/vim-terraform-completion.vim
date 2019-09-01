" https://github.com/juliosueiras/vim-terraform-completion
"
" A (Neo)Vim Autocompletion and linter for Terraform, a HashiCorp tool

call dein#add('juliosueiras/vim-terraform-completion', {
    \ 'depends': ['vim-terraform'],
    \ 'lazy': 1,
    \ 'on_ft': ['terraform'],
\ })
