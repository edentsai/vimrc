" https://github.com/hashivim/vim-terraform
"
" Basic vim/terraform integration

call dein#add('hashivim/vim-terraform', {
    \ 'depends': ['vim-terraform-completion'],
    \ 'lazy': 1,
    \ 'on_cmd': ['Terraform'],
    \ 'on_ft': ['terraform'],
\ })

let g:terraform_align = 1
let g:terraform_commentstring = '#\ %s'
let g:terraform_fmt_on_save = 1
