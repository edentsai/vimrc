" Preserve cursor position, and execute the command. {
    function! PreserveCursorAndExecuteCommand(command)
        let _s=@/
        let l = line(".")
        let c = col(".")

        " Do the business:
        execute a:command

        " Clean up: restore previous search history, and cursor position.
        let @/=_s
        call cursor(l, c)
    endfunction
" }

" Auto remove all trailing whitespaces on save file. {
    autocmd BufWritePre * :call PreserveCursorAndExecuteCommand("%s/\\s\\+$//ec")
" }
