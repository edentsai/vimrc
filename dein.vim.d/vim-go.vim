" https://github.com/fatih/vim-go
"
" Go development plugin for Vim.

if executable('go')
    call dein#add('fatih/vim-go', {
        \ 'depends': ['ctrlp.vim'],
        \ 'lazy': 1,
        \ 'on_ft': ['go'],
        \ 'hook_post_source': 'call SetupVimGo()',
        \ 'hook_post_update': ':GoUpdateBinaries',
    \ })

    let g:go_auto_type_info = 0
    let g:go_auto_sameids = 0
    let g:go_decls_includes = 'func,type'
    let g:go_fmt_autosave = 1
    let g:go_fmt_command = "goimports"
    " let g:go_fmt_experimental = 1
    "
    let g:go_highlight_build_constraints = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_methods = 1
    let g:go_highlight_operators = 1
    let g:go_highlight_types = 1

    let g:go_jump_to_error = 1
    let g:go_list_type = 'quickfix'

    let g:go_metalinter_autosave = 1
    let g:go_metalinter_autosave_enabled = ['vet', 'golint']
    let g:go_metalinter_deadline = '5s'
    let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']

    let g:go_snippet_case_type = 'camelcase'

    function! SetupVimGo()
        nmap <Leader>gb <Plug>(go-build)
        nmap <Leader>gc <Plug>(go-coverage)
        nmap <Leader>gcb <Plug>(go-coverage-browser)
        nmap <Leader>gcc <Plug>(go-coverage-clear)
        nmap <Leader>gct <Plug>(go-coverage-toggle)
        nmap <Leader>gd <Plug>(go-doc)
        nmap <Leader>gdb <Plug>(go-doc-browser)
        nmap <Leader>gdv <Plug>(go-doc-vertical)
        nmap <Leader>gf <Plug>(go-fmt)
        nmap <Leader>gi <Plug>(go-info)
        nmap <Leader>gl <Plug>(go-lint)
        nmap <Leader>gr <Plug>(go-run)
        nmap <Leader>gt <Plug>(go-test)
    endfunction
endif
