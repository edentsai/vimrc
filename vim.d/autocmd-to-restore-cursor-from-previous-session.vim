" Restore cursor to file position in previous editing session. {
    function! RestoreCursorFromPreviousSession()
        set viminfo='10,\"100,:20,%,n~/.viminfo

        if line("'\"") > 0
            if line("'\"") <= line("$")
                exe "norm '\""
            else
                exe "norm $"
            endif
        endif
    endfunction

    autocmd BufReadPost * :call RestoreCursorFromPreviousSession()
" }
