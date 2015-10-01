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
    " mhinz/vim-startify - A start screen for Vim {
        NeoBundleLazy 'mhinz/vim-startify', {
            \ 'autoload': {
                \ 'commands': ['Startify'],
            \ }
        \ }

        let g:startify_change_to_dir = 1
        let g:startify_files_number = 15
        let g:startify_session_dir = '~/.vim/session'
        let g:startify_session_autoload = 0
        let g:startify_session_persistence = 1
        let g:startify_session_delete_btartify_session_delete_buffersffers = 1
        let g:startify_bookmarks = ['~/.dotfiles']
    " }
    " rking/ag.vim - The silver searcher, 'ag', a replacement for the Perl module / CLI script 'ack' {
        NeoBundleLazy 'rking/ag.vim', {
            \ 'autoload': {
                \ 'commands': ['Ag'],
            \ }
        \ }
    " }
    " scrooloose/nerdtree - A tree explorer plugin for Vim {
        NeoBundleLazy 'scrooloose/nerdtree', {
            \ 'autoload': {
                \ 'commands': ['NERDTreeToggle']
            \ }
        \ }

        let NERDTreeShowLineNumbers = 1
        let NERDTreeShowHidden = 0
        let NERDTreeIgnore = ['\~$', '\.lo$', '\.la$', '\.pyc']

        nnoremap <Bslash><Bslash> :NERDTreeToggle<CR>
    " }
" }
" Syntax & Completion {
    " " ervandew/supertab - Allows you to use <Tab> for all your insert completion needs {
    "     NeoBundleLazy 'ervandew/supertab', {
    "         \ 'autoload': {
    "             \ 'insert': 1
    "         \ }
    "     \ }

    "     let g:SuperTabDefaultCompletionType = 'context'
    "     let g:SuperTabContextDefaultCompletionType = '<C-p>'
    " " }
    " garbas/vim-snipmate - Provide support for textual snippets {
        NeoBundleLazy 'garbas/vim-snipmate', {
            \ 'depends': [
                \ 'MarcWeber/vim-addon-mw-utils',
                \ 'tomtom/tlib_vim',
                \ 'honza/vim-snippets'
            \ ],
            \ 'autoload': {
                \ 'insert': 1
            \ }
        \ }

        let g:commentChar = {
            \ 'vim'   : '"',
            \ 'c'     : '//',
            \ 'cpp'   : '//',
            \ 'sh'    : '#',
            \ 'python': '#',
            \ 'php'   : '//'
        \ }
    " }
    " majutsushi/tagbar - Browsing the tags of source code files {
        NeoBundleLazy 'majutsushi/tagbar', {
            \ 'depends': [
                \ 'bling/vim-airline',
                \ 'vim-php/tagbar-phpctags.vim'
            \ ],
            \ 'autoload': {
                \ 'commands': ['TagbarToggle'],
            \ }
        \ }

        noremap <Bslash>t :TagbarToggle<CR>

        let g:tagbar_autoclose = 1
        let g:tagbar_autofoucs = 1
        let g:tagbar_autopreview = 0
        let g:tarbar_autoshowtag = 1
        let g:tagbar_foldlevel = 1
        let g:tabbar_indent = 2
        let g:tagbar_iconchars = ['▶ ', '▼ ']
        let g:tagbar_left = 0
        let g:tagbar_show_linenumbers = 0
        let g:tagbar_show_visibility = 1
        let g:tagbar_sort = 0
        let g:tagbar_vertical = 0
        let g:tagbar_width = 40
        let g:tagbar_type_css = {
            \ 'ctagstype': 'Css',
            \ 'kinds': [
                \ 'c:classes',
                \ 's:selectors',
                \ 'i:identities'
            \ ]
        \ }

        " Configure tagbar-phpctags plugin
        let g:tagbar_phpctags_bin = '~/.vim/bin/phpctags'
        let g:tagbar_phpctags_memory_limit = '128M'

        " Configure vim-airline extension
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline#extensions#tagbar#flags = ''
    " }
    " scrooloose/syntastic - A syntax checking plugin for Vim {
        NeoBundle 'scrooloose/syntastic', {
            \ 'depends': ['bling/vim-airline'],
            \ 'autoload': {
                \ 'commands': ['SyntasticCheck'],
            \ }
        \ }

        let g:syntastic_check_on_open = 0
        let g:syntastic_check_on_wq = 0
        let g:syntastic_auto_jump = 0
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_loc_list_height = 5
        let g:syntastic_enable_highlighting = 1
        let g:syntastic_php_checkers = ['phpcs', 'phpmd', 'php']
        let g:syntastic_html_tidy_ignore_errors = [
            \ "proprietary attribute ",
            \ "trimming empty <", "unescaped &",
            \ "lacks \"action",
            \ "is not recognized!",
            \ "discarding unexpected "
        \ ]

        " Configure vim-airline extension
        let g:airline#extensions#syntastic#enabled = 1
    " }
    " Shougo/neocomplete.vim - Next generation completion framework after neocomplcache {
        NeoBundleLazy 'Shougo/neocomplete.vim', {
            \ 'depends': ['Shougo/vimproc.vim'],
            \ 'autoload': {
                \ 'insert': 1
            \ }
        \ }

        let g:neocomplete#enable_cursor_hold_i = 0
        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
        let g:neocomplete#min_keyword_length = 2
        let g:neocomplete#auto_completion_start_length = 3
        let g:neocomplete#manual_completion_start_length = 3
        let g:neocomplete#sources#syntax#min_keyword_length = 3

        " Define keyword.
        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

        if neobundle#tap('neocomplete.vim')
            function! neobundle#hooks.on_source(bundle)
                " <TAB>: completion.
                inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

                " <BackSpace>: close popup and delete backword char.
                inoremap <expr><BackSpace> neocomplete#smart_close_popup() . "\<C-h>"

                " <C-h>, <Left>: close popup and move backword char.
                inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<Left>"
                inoremap <expr><Left> neocomplete#smart_close_popup() . "\<Left>"
            endfunction
            call neobundle#untap()
        endif

    " }
    " SirVer/ultisnips - The ultimate snippet solution for Vim {
        NeoBundle 'SirVer/ultisnips', {
            \ 'depends': [
                \ 'honza/vim-snippets',
                \ 'garbas/vim-snipmate'
            \ ],
        \ }

        let g:UltiSnipsExpandTrigger = '<C-Bslash>'
        let g:UltiSnipsJumpForwardTrigger = '<C-p>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-n>'
        let g:UltiSnipsListSnippets = '<C-z>'
        let g:UltiSnipsEnableSnipMate = 1
        let g:UltiSnipsEditSplit = 'vertical'
        let g:UltiSnipsSnippetsDir = $HOME . '/.vim/UltiSnips'
        let g:UltiSnipsSnippetDirectories = ['UltiSnips']
    " }
" }
" Text Edition {
    " easymotion/vim-easymotion - Provides a much simpler way to use some motions in Vim {
        " Key mappings in Normal mode {
            " <Leader><Leader> : To jump cursor fast
        " }
        NeoBundleLazy 'easymotion/vim-easymotion', {
            \ 'autoload': {
                \ 'mappings': [
                    \ '<Leader><Leader>',
                    \ '<Plug>(easymotion-'
                \ ]
            \ }
        \ }

        let g:EasyMotion_leader_key = '<Leader><Leader>'
        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_use_upper = 1
        let g:EasyMotion_do_special_mapping = 1
        let g:EasyMotion_startofline = 0

        highlight link EasyMotionTarget ErrorMsg
        highlight link EasyMotionShade  Comment

        if neobundle#tap('vim-easymotion')
            function! neobundle#hooks.on_source(bundle)
                " Search
                map <Plug>(easymotion-prefix)/ <Plug>(easymotion-sn)
                map <Plug>(easymotion-prefix)? <Plug>(easymotion-tn)
                map <Plug>(easymotion-prefix). <Plug>(easymotion-repeat)
                map <Plug>(easymotion-prefix)vn <Plug>(easymotion-vim-n)
                map <Plug>(easymotion-prefix)vN <Plug>(easymotion-vim-N)
                map n <Plug>(easymotion-next)
                map N <Plug>(easymotion-prev)

                " Cursor movement.
                map <Plug>(easymotion-prefix)<Leader> <Plug>(easymotion-jumptoanywhere)
                map <Plug>(easymotion-prefix)<CR> <Plug>(easymotion-lineanywhere)
                map <Plug>(easymotion-prefix)h <Plug>(easymotion-linebackward)
                map <Plug>(easymotion-prefix)l <Plug>(easymotion-lineforward)
                map <Plug>(easymotion-prefix)j <Plug>(easymotion-j)
                map <Plug>(easymotion-prefix)k <Plug>(easymotion-k)
                map <Plug>(easymotion-prefix)0j <Plug>(easymotion-sol-j)
                map <Plug>(easymotion-prefix)0k <Plug>(easymotion-sol-k)
                map <Plug>(easymotion-prefix)$j <Plug>(easymotion-eol-j)
                map <Plug>(easymotion-prefix)$k <Plug>(easymotion-eol-k)

                " Mapping arrows as same as hjkl.
                map <Plug>(easymotion-prefix)<Left> <Plug>(easymotion-prefix)h
                map <Plug>(easymotion-prefix)<Right> <Plug>(easymotion-prefix)l
                map <Plug>(easymotion-prefix)<Down> <Plug>(easymotion-prefix)j
                map <Plug>(easymotion-prefix)<Up> <Plug>(easymotion-prefix)k

                " Easy motion for bidirectional
                map <Plug>(easymotion-prefix)af <Plug>(easymotion-bd-f)
                map <Plug>(easymotion-prefix)at <Plug>(easymotion-bd-t)
                map <Plug>(easymotion-prefix)aw <Plug>(easymotion-bd-w)
                map <Plug>(easymotion-prefix)aW <Plug>(easymotion-bd-W)
                map <Plug>(easymotion-prefix)ae <Plug>(easymotion-bd-e)
                map <Plug>(easymotion-prefix)aE <Plug>(easymotion-bd-E)
                map <Plug>(easymotion-prefix)al <Plug>(easymotion-bd-jk)
                map <Plug>(easymotion-prefix)an <Plug>(easymotion-bd-n)
            endfunction
            call neobundle#untap()
        endif
    " }
    " edsono/vim-matchit - extended % matching for HTML, LaTeX, and many other languages {
        NeoBundleLazy 'edsono/vim-matchit', {
            \ 'autoload': {
                \ 'filetypes': ['xml', 'htm', 'html', 'xhtml', 'phtml'],
                \ 'mappings': ['%', 'g%']
            \ }
        \ }
    " }
    " godlygeek/tabular - vim script for text filtering and alignment {
        NeoBundleLazy 'godlygeek/tabular', {
            \ 'autoload': {
                \ 'commands': ['Tabularize']
            \ }
        \ }

        noremap <Leader><Tab>/ :Tabularize /
    " }
    " gregsexton/MatchTag - highlights the matching HTML tag when the cursor is positioned on a tag {
        NeoBundleLazy 'gregsexton/MatchTag', {
            \ 'autoload': {
                \ 'filetypes': ['xml', 'htm', 'html', 'xhtml', 'phtml']
            \ }
        \ }
    " }
    " haya14busa/incsearch.vim - incrementally highlights ALL pattern matches unlike default 'incsearch' {
        NeoBundle 'haya14busa/incsearch.vim', {
            \ 'autoload': {
                \ 'mappings': [
                    \ '<Plug>(incsearch-',
                    \ '<Over>(incsearch-'
                \ ]
            \ }
        \ }

        " Fixes some keys in TMUX
        " Using '[Z' instead of '<S-Tab>' in TMUX
        if '' != system('echo $TMUX')
            let g:incsearch_cli_key_mappings = {
                \ "[Z" : {
                    \ "key" : "<Over>(incsearch-prev)",
                    \ "noremap" : 1,
                \ },
                \ "\<S-Tab>" : {
                    \ "key" : "<Over>(incsearch-prev)",
                    \ "noremap" : 1,
                \ },
                \ "\<C-f>" : {
                    \ "key" : "<Over>(incsearch-scroll-f)",
                    \ "noremap" : 1,
                \ },
                \ "\<C-b>" : {
                    \ "key" : "<Over>(incsearch-scroll-b)",
                    \ "noremap" : 1,
                \ },
            \ }
        endif

        map <Leader>/  <Plug>(incsearch-forward)
        map <Leader>?  <Plug>(incsearch-backward)
        map <Leader>g/ <Plug>(incsearch-stay)
    " }
    " haya14busa/vim-asterisk - *-Improved {
        NeoBundleLazy 'haya14busa/vim-asterisk', {
            \ 'autoload': {
                \ 'mappings': ['<Plug>(asterisk-']
            \ }
        \ }

        let g:asterisk#keeppos = 1

        map *   <Plug>(asterisk-*)
        map #   <Plug>(asterisk-#)
        map g*  <Plug>(asterisk-g*)
        map g#  <Plug>(asterisk-g#)
        map z*  <Plug>(asterisk-z*)
        map gz* <Plug>(asterisk-gz*)
        map z#  <Plug>(asterisk-z#)
        map gz# <Plug>(asterisk-gz#)
    " }
    " junegunn/vim-easy-align - a vim alignment plugin {
        NeoBundleLazy 'junegunn/vim-easy-align', {
            \ 'autoload': {
                \ 'mappings': ['<Plug>(asterisk-']
            \ }
        \ }

        " start interactive easyalign in visual mode (e.g. vip<CR>)
        vmap <CR> <Plug>(EasyAlign)
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    " }
    " jeetsukumaran/vim-indentwise - A Vim plugin for indent-level based motion {
        NeoBundleLazy 'jeetsukumaran/vim-indentwise', {
            \ 'autoload': {
                \ 'mappings': ['<Plug>(IndentWise']
            \ }
        \ }

        map <Leader>[- <Plug>(IndentWisePreviousLesserIndent)
        map <Leader>[= <Plug>(IndentWisePreviousEqualIndent)
        map <Leader>[+ <Plug>(IndentWisePreviousGreaterIndent)
        map <Leader>]- <Plug>(IndentWiseNextLesserIndent)
        map <Leader>]= <Plug>(IndentWiseNextEqualIndent)
        map <Leader>]+ <Plug>(IndentWiseNextGreaterIndent)
        map <Leader>[_ <Plug>(IndentWisePreviousAbsoluteIndent)
        map <Leader>]_ <Plug>(IndentWiseNextAbsoluteIndent)
        map <Leader>[% <Plug>(IndentWiseBlockScopeBoundaryBegin)
        map <Leader>]% <Plug>(IndentWiseBlockScopeBoundaryEnd)
    " }
    " kshenoy/vim-signature - A plugin to place, toggle and display marks {
        " Key mappings in Normal mode {
        "   m[a-zA-Z]    : Toggle mark
        "   m<Space>     : Delete all marks
        "   m,           : Place the next available mark
        "   ]`           : Jump to next mark
        "   [`           : Jump to prev mark
        "   ]'           : Jump to start of next line containing a mark
        "   ['           : Jump to start of prev line containing a mark
        "   `]           : Jump by alphabetical order to next mark
        "   `[           : Jump by alphabetical order to prev mark
        "   ']           : Jump by alphabetical order to start of next line containing a mark
        "   '[           : Jump by alphabetical order to start of prev line containing a mark
        "   m[0-9]       : Toggle the corresponding marker !@#$%^&*()
        "   m<S-[0-9]>   : Remove all markers of the same type
        "   ]-           : Jump to next line having same marker
        "   [-           : Jump to prev line having same marker
        "   ]=           : Jump to next line having any marker
        "   [=           : Jump to prev line having any marker
        "   m<BackSpace> : Remove all corresponding markers
        " }
        NeoBundle 'kshenoy/vim-signature'
    " }
    " nishigori/increment-activator - Enhance to increment candidates {
        NeoBundleLazy 'nishigori/increment-activator', {
            \ 'autoload': {
                \ 'mappings': [
                    \ '<Plug>(increment-activator-'
                \ ]
            \ }
        \ }

        let g:increment_activator_no_default_key_mappings = 1
        let g:increment_activator_no_default_candidates = 0
        let g:increment_activator_filetype_candidates = {
            \ 'php': [
                \ ['public', 'protected', 'private'],
                \ ['class', 'interface', 'trait'],
            \ ],
            \ 'git-rebase-todo': [
                \ ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec'],
            \ ],
            \ 'go': [
            \   ['true', 'false', 'iota', 'nil'],
            \   ['byte', 'complex64', 'complex128'],
            \   ['int', 'int8', 'int16', 'int32', 'int64'],
            \   ['uint', 'uint8', 'uint16', 'uint32', 'uint64'],
            \   ['float32', 'float64'],
            \   ['interface', 'struct'],
            \ ],
        \ }

        nmap <C-a> <Plug>(increment-activator-increment)
        nmap <C-x> <Plug>(increment-activator-decrement)

        imap <C-a> <Plug>(increment-activator-increment)
        imap <C-x> <Plug>(increment-activator-decrement)
    " }
    " rhysd/clever-f.vim - Extended f, F, t and T key mappings for Vim {
        NeoBundle 'rhysd/clever-f.vim'

        let g:clever_f_across_no_line = 1
        let g:clever_f_ignore_case = 0
        let g:clever_f_show_prompt = 1
        let g:clever_f_smart_case = 1
        let g:clever_f_mark_char = 1
        let g:clever_f_mark_cursor = 1
        let g:clever_f_repeat_last_char_inputs = ["\<CR>"]
    " }
    " terryma/vim-expand-region - Allows you to visually select increasingly larger regions of text using the same key combination {
        NeoBundleLazy 'terryma/vim-expand-region', {
            \ 'autoload': {
                \ 'mappings': ['<Plug>(expand_region_']
            \ }
        \ }

        vmap v <Plug>(expand_region_expand)
        vmap V <Plug>(expand_region_shrink)
    "  }
    " terryma/vim-multiple-cursors - True Sublime Text style multiple selections for Vim {
        NeoBundleLazy 'terryma/vim-multiple-cursors', {
            \ 'autoload': {
                \ 'mappings': [
                    \ '<C-n>',
                    \ ['ox', '<C-n>']
                \ ],
            \ }
        \ }

        let g:multi_cursor_use_default_mapping = 0
        let g:multi_cursor_next_key = '<C-n>'
        let g:multi_cursor_prev_key = '<C-p>'
        let g:multi_cursor_skip_key = '<C-x>'
        let g:multi_cursor_quit_key = '<Esc>'

        " Called once right before you start selecting multiple cursors
        function! Multiple_cursors_before()
            if exists(':NeoCompleteLock') == 2
                exe 'NeoCompleteLock'
            endif
        endfunction

        " Called once only when the multiple selection is canceled (default <Esc>)
        function! Multiple_cursors_after()
            if exists(':NeoCompleteUnlock') == 2
                exe 'NeoCompleteUnlock'
            endif
        endfunction

    " }
    " tpope/vim-commentary - Comment the stuff out {
        " Key mappings in Normal mode {
        "   gc   : To comment out the target of a motion
        "   gcc  : To comment out a line
        "   gcap : To comment out a paragraph a section.
        " }
        " Key mappings in Visual mode {
        "   gc   : To comment out the selection at visual mode
        " }
        NeoBundleLazy 'tpope/vim-commentary', {
            \ 'autoload': {
                \ 'mappings': ['gc'],
                \ 'commands': ['Commentary']
            \ }
        \ }

        autocmd Filetype php let b:commentary_format='// %s'
    " }
" }

" NeoBundle - Running {
    " End {
        call neobundle#end()

        " Required:
        filetype plugin indent on
    " }
" }
