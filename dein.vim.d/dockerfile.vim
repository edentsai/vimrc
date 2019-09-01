" https://github.com/ekalinin/Dockerfile.vim
"
" Vim syntax file & snippets for Docker's Dockerfile

call dein#add('ekalinin/Dockerfile.vim', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'Dockerfile',
        \ 'yaml.docker-compose',
    \ ],
\ })
