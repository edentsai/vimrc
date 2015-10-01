" vim: set filetype=vim

" NeoBundle - Auto download and setup {
    " Download NeoBundle {
        let neoBundleReadme = expand($HOME . '/.vim/bundles/neobundle.vim/README.md')
        if !filereadable(neoBundleReadme)
            echo "Download NeoBundle to '"
            silent !mkdir -p $HOME/.vim/bundles
            silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundles/neobundle.vim

            autocmd VimEnter * NeoBundleCheck
        endif
    " }
    " Set up NeoBundle {
        if has('vim_starting')
            if &compatible
                set nocompatible   " Be Improved
            endif

            set runtimepath+=$HOME/.vim/bundles/neobundle.vim/
        endif

        call neobundle#begin(expand($HOME.'/.vim/bundles/'))
        " Is better if NeoBundle rules NeoBundle (needed!)
        NeoBundleFetch 'Shougo/neobundle.vim'
    " }
" }

" Utilities {
    " Shougo/vimproc.vim - Interactive command execution in Vim. {
        NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
                \ 'windows' : 'tools\\update-dll-mingw',
                \ 'cygwin' : 'make -f make_cygwin.mak',
                \ 'mac' : 'make -f make_mac.mak',
                \ 'linux' : 'make',
                \ 'unix' : 'gmake',
            \ },
        \ }
    " }
" }
" User Interfaces {
    " bling/vim-airline - Lean & mean status/tabline for vim that's light as air {
        NeoBundle 'bling/vim-airline'

        let g:airline_theme = 'murmur'
        let g:airline_detect_paste = 1
        let g:airline_detect_modified = 1
        let g:airline_powerline_fonts = 0
        if 0 == g:airline_powerline_fonts
            let g:airline_left_sep = ''
            let g:airline_right_sep = ''
            let g:airline_symbols = {}
            let g:airline_symbols.branch = '⎇'
            let g:airline_symbols.linenr = '␊' " or ␤
            " let g:airline_symbols.paste = 'ρ'
            let g:airline_symbols.whitespace = 'Ξ'
        endif

        " Configure vim-airline extensions
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#buffer_idx_mode = 1
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline#extensions#tabline#show_tab_nr = 1
        let g:airline#extensions#tabline#tab_nr_type = 0
        let g:airline#extensions#whitespace#enabled = 1
        let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
        let g:airline#extensions#whitespace#show_message = 1

        if neobundle#tap('vim-airline')
            function! neobundle#hooks.on_source(bundle)
                nmap <leader>1 <Plug>AirlineSelectTab1
                nmap <leader>2 <Plug>AirlineSelectTab2
                nmap <leader>3 <Plug>AirlineSelectTab3
                nmap <leader>4 <Plug>AirlineSelectTab4
                nmap <leader>5 <Plug>AirlineSelectTab5
                nmap <leader>6 <Plug>AirlineSelectTab6
                nmap <leader>7 <Plug>AirlineSelectTab7
                nmap <leader>8 <Plug>AirlineSelectTab8
                nmap <leader>9 <Plug>AirlineSelectTab9
            endfunction
            call neobundle#untap()
        endif
    " }
    " bling/vim-bufferline - Super simple vim plugin to show the list of buffers in the command bar {
        NeoBundle 'bling/vim-bufferline', {
            \ 'depends': ['bling/vim-airline']
        \ }

        " Configure vim-airline extension
        let g:airline#extensions#bufferline#enabled = 1
        let g:airline#extensions#bufferline#overwrite_variables = 1
    " }
    " guns/xterm-color-table.vim - All 256 xterm colors with their RGB equivalents {
        NeoBundleLazy 'guns/xterm-color-table.vim', {
            \ 'autoload': {
                \ 'commands': ['XtermColorTable'],
            \ }
        \ }
    " }
    " jimsei/winresizer - very simple vim plugin for easy resizing of your vim windows {
        " Key mappings in Normal mode {
        "   <Ctrl+w>r : Start window resize mode
        "   [hjkl]   : Expand window size (work after <Ctrl+w>r)
        " }
        NeoBundleLazy 'jimsei/winresizer', {
            \ 'autoload': {
                \ 'commands': ['WinResizerStartResize'],
                \ 'mappings': ['<C-w>r']
            \ }
        \ }

        let g:winresizer_start_key = '<C-w>r'
        let g:winresizer_enable = 1
        let g:winresizer_finish_with_escape = 1
    " }
    " nathanaelkane/vim-indent-guides - Show the indent line {
        NeoBundle 'nathanaelkane/vim-indent-guides'

        let g:indent_guides_auto_colors = 0
        let g:indent_guides_guide_size = 0
        let g:indent_guides_start_level = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }
    " tomasr/molokai - Molokai color scheme for Vim {
        NeoBundle 'tomasr/molokai'

        let g:molokai_original = 0
        let g:rehash256 = 0
    " }
" }
" File & Directory Management {
    " chrisbra/vim-diff-enhanced - Better Diff options for Vim {
        NeoBundleLazy 'chrisbra/vim-diff-enhanced', {
            \ 'autoload' : {
                \ 'commands' : [
                    \ 'EnhancedDiff',
                    \ 'PatienceDiff',
                \ ]
            \ }
        \ }
    " }
    " kien/ctrlp.vim - Full path fuzzy finder for Vim {
        NeoBundle 'kien/ctrlp.vim', {
            \ 'depends': ['bling/vim-airline'],
            \ 'autoload': {
                \ 'commands': ['CtrlP'],
                \ 'mappings': ['<Leader><C-p>'],
            \ }
        \ }

        let g:ctrlp_map = '<Leader><C-p>'
        let g:ctrlp_cmd = 'CtrlP'
        let g:ctrlp_use_caching = 0
        let g:ctrlp_clear_cache_on_exit = 0             " 離開 vim 後不要清 cache
        let g:ctrlp_max_files = 100000                  " 加大 cache 索引的檔案數, 否則會漏找檔案
        let g:ctrlp_working_path_mode = 'ra'
        let g:ctrlp_custom_ignore = {
            \ 'dir': '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll)$',
        \ }

        if executable('ag')
            set grepprg=ag\ --nogroup\ --nocolor
            let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
        else
            let g:ctrlp_user_command = [
                \ '.git',
                \ 'cd %s && git ls-files . -co --exclude-standard',
                \ 'find %s -type f -not -iwholename "*.[git|hg]*"'
            \ ]
            let g:ctrlp_prompt_mappings = {
                \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
            \ }
        endif

        " Configure vim-airline extension
        let g:airline#extensions#ctrlp#color_template = 'normal'
        let g:airline#extensions#ctrlp#show_adjacent_modes = 1

    " }
    " mbbill/undotree - The ultimate undo history visualizer for Vim {
        NeoBundleLazy 'mbbill/undotree', {
            \ 'autoload': {
                \ 'commands': [
                    \ 'UndotreeToggle',
                    \ 'UndotreeShow',
                    \ 'UndotreeHide'
                \ ],
            \ }
        \ }

        let g:undotree_SplitWidth = 30
        let g:undotree_DiffpanelHeight = 15
        let g:undotree_DiffAutoOpen = 1
        let g:undotree_SetFocusWhenToggle = 1

        nmap <Bslash>u :UndotreeToggle<CR>
    " }
" }

" NeoBundle - Running {
    " End {
        call neobundle#end()

        " Required:
        filetype plugin indent on
    " }
" }
