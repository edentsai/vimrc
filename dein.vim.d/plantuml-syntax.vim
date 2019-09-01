" https://github.com/aklt/plantuml-syntax
"
" Vim syntax file for PlantUML

call dein#add('aklt/plantuml-syntax', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'markdown',
        \ 'plantuml',
    \ ],
    \ 'on_path': [
        \ '*.plantuml',
        \ '*.pu',
        \ '*.puml',
        \ '*.uml',
        \ '*.md',
        \ '*.markdown',
    \ ],
\ })
