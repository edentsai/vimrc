autocmd FileType htm,html,phtml
    \ setlocal syntax=html

autocmd FileType htm,html,phtml
    \ setlocal syntax=html |
    \ setlocal omnifunc=htmlcomplete#CompleteTags

autocmd FileType htm,html,phtml
    \ nnoremap <Bslash>f zfat |
    \ vnoremap <Bslash>f zfat

autocmd BufNewFile,BufRead *.phtml
    \ setlocal filetype=html
