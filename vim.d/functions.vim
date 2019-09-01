" Is Vim running in MacOS {
    function! IsMacOS()
        return has('macunix')
    endfunction
" }

" Is Vim running in Linux {
    function! IsLinux()
        return has('unix') && !has('macunix') && !has('win32unix')
    endfunction
" }

" Is Vim running in Windows {
    function! IsWindows()
        return has('win16') || has('win32') || has('win64')
    endfunction
" }

" Make the directory if not exists {
    function! MakeDirIfNotExists(path)
        if !isdirectory(expand(a:path))
            call mkdir(expand(a:path), "p")
        endif
    endfunction
" }
