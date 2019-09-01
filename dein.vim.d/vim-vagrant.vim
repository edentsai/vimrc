" https://github.com/hashivim/vim-vagrant
"
" Basic vim/vagrant integration.

call dein#add('hashivim/vim-vagrant', {
    \ 'lazy': 1,
    \ 'on_cmd': ['Vagrant'],
    \ 'on_ft': ['ruby'],
    \ 'on_path': ['Vagrantfile'],
\ })
