" https://github.com/jparise/vim-graphql
"
" A Vim plugin that provides GraphQL file detection,
" syntax highlighting, and indentation.

call dein#add('jparise/vim-graphql', {
    \ 'lazy': 1,
    \ 'on_ft': ['graphql'],
    \ 'on_path': [
        \ '*.graphql',
        \ '*.graphqls',
        \ '*.gql',
    \ ],
\ })
