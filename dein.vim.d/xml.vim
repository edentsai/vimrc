" https://github.com/othree/xml.vim
"
" Helps editing xml (and [x]html, sgml, xslt) files.

call dein#add('othree/xml.vim', {
    \ 'lazy': 1,
    \ 'on_ft': [
        \ 'sgml',
        \ 'xhtml',
        \ 'xml',
        \ 'xslt',
    \ ],
\ })
