" vim: set filetype=vim

" Environment {
    " isMacOSX() {
        function! IsMacOSX()
            return has('macunix')
        endfunction
    " }
    " isLinux() {
        function! IsLinux()
            return has('unix') && !has('macunix') && !has('win32unix')
        endfunction
    " }
    " isWindows() {
        function! IsWindows()
            return has('win16') || has('win32') || has('win64')
        endfunction
    " }
" }
" File, Directory {
    " MakeDirIfNoExists() {
        function! MakeDirIfNoExists(path)
            if !isdirectory(expand(a:path))
                call mkdir(expand(a:path), "p")
            endif
        endfunction
    " }
" }
