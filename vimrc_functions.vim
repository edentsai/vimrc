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
" Search {
    " PreserveSearch() - save last search, and cursor position {
        function! PreserveSearch(command)
            let _s=@/
            let l = line(".")
            let c = col(".")
            " Do the business:
            execute a:command
            " Clean up: restore previous search history, and cursor position
            let @/=_s
            call cursor(l, c)
        endfunction
    " }
" }
