" Resize the divsions if the Vim window size changes.
autocmd VimResized *
    \ exe "normal! \<c-w>="
