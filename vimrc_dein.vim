" vim: set filetype=vim

" Auto download and setup dein.vim {
    " Download dein.vim {
        let deinReadme = expand($HOME . '/.vim/dein/repos/github.com/Shougo/dein.vim/README.md')
        if !filereadable(deinReadme)
            echo "Download dein.vim :\n"
            " silent !mkdir -p $HOME/.vim/bundles/repos/github.com/Shougo/
            silent !git clone https://github.com/Shougo/dein.vim.git $HOME/.vim/dein/repos/github.com/Shougo/dein.vim
        endif
    " }
    " Set up dein.vim {
        if &compatible
            set nocompatible   " Be Improved
        endif

        set runtimepath+=$HOME/.vim/dein/repos/github.com/Shougo/dein.vim
    " }
" }

" if dein#load_state(expand($HOME . '/.vim/dein'))
    call dein#begin(expand($HOME . '/.vim/dein'), [expand($HOME . '/.vim/vimrc_dein.vim')])
    " Shougo/dein.vim - Dark powered Vim/Neovim plugin manager {
        call dein#add('Shougo/dein.vim')

        let g:dein#install_message_type='echo'
    " }
" Plugins For User Interface {
    " vim-airline/vim-airline - lean & mean status/tabline for vim that's light as air {
        call dein#add('vim-airline/vim-airline', {
            \ 'depends': ['vim-airline-themes', 'vim-bufferline'],
        \ })
        call dein#add('vim-airline/vim-airline-themes', {'lazy': 1})

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
        let g:airline#extensions#tabline#buffer_idx_mode = 1
        let g:airline#extensions#tabline#enabled = 1
        let g:airline#extensions#tabline#fnamemod = ':t'
        let g:airline#extensions#tabline#show_buffers = 0
        let g:airline#extensions#tabline#show_splits = 1
        let g:airline#extensions#tabline#show_tab_nr = 1
        let g:airline#extensions#tabline#show_tabs = 1
        let g:airline#extensions#tabline#tab_nr_type = 0
        let g:airline#extensions#tabline#keymap_ignored_filetypes = ['vimfiler', 'nerdtree']
        let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
        let g:airline#extensions#whitespace#enabled = 1
        let g:airline#extensions#whitespace#checks = ['indent', 'trailing']
        let g:airline#extensions#whitespace#show_message = 1
    " }
    " bling/vim-bufferline - Super simple vim plugin to show the list of buffers in the command bar {
        call dein#add('bling/vim-bufferline')

        let g:bufferline_echo = 0
        let g:bufferline_fname_mod = ':p:~'
        let g:bufferline_rotate = 0
        let g:bufferline_solo_highlight = 1

        " Configure vim-airline extension
        let g:airline#extensions#bufferline#enabled = 1
        let g:airline#extensions#bufferline#overwrite_variables = 1
    " }
    " guns/xterm-color-table.vim - All 256 xterm colors with their RGB equivalents {
        call dein#add('guns/xterm-color-table.vim', {
            \ 'lazy': 1,
            \ 'on_cmd': ['XtermColorTable'],
        \ })
    " }
    " simeji/winresizer - very simple vim plugin for easy resizing of your vim windows {
        " Key mappings in Normal mode {
        "   <Ctrl+w>r : Start window resize mode
        "   [hjkl]   : Expand window size (work after <Ctrl+w>r)
        " }
        call dein#add('simeji/winresizer', {
            \ 'lazy': 1,
            \ 'on_cmd': ['WinResizerStartResize'],
            \ 'on_map': ['<C-w>r'],
        \ })

        let g:winresizer_start_key = '<C-w>r'
        let g:winresizer_enable = 1
        let g:winresizer_finish_with_escape = 1
    " }
    " nathanaelkane/vim-indent-guides - Show the indent line {
        call dein#add('nathanaelkane/vim-indent-guides')

        let g:indent_guides_auto_colors = 0
        let g:indent_guides_guide_size = 0
        let g:indent_guides_start_level = 1
        let g:indent_guides_enable_on_vim_startup = 1
    " }
    " edentsai/extended-molokai - Extended molokai color scheme for Vim {
        call dein#add('edentsai/extended-molokai')

        let g:molokai_original = 0
        let g:molokai_transparent = 0
        let g:rehash256 = 0
    " }
" }
" Plugins For File & Directory Management {
    " chrisbra/vim-diff-enhanced - Better Diff options for Vim {
        call dein#add('chrisbra/vim-diff-enhanced', {
            \ 'lazy' : 1,
            \ 'on_cmd' : ['EnhancedDiff', 'PatienceDiff'],
        \ })
    " }
    " ctrlpvim/ctrlp.vim - Full path fuzzy finder for Vim {
        call dein#add('ctrlpvim/ctrlp.vim', {
            \ 'depends': ['vim-airline'],
            \ 'lazy': 1,
            \ 'on_cmd': ['CtrlP'],
            \ 'on_map': ['<Leader><C-p>'],
        \ })

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
        let g:ctrlp_user_command = [
            \ '.git',
            \ 'cd %s && git ls-files . -co --exclude-standard',
            \ 'find %s -type f -not -iwholename "*.[git|hg]*"',
        \ ]
        let g:ctrlp_prompt_mappings = {
            \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
        \ }

        " Configure vim-airline extension
        let g:airline#extensions#ctrlp#color_template = 'normal'
        let g:airline#extensions#ctrlp#show_adjacent_modes = 1
    " }
    " mbbill/undotree - The ultimate undo history visualizer for Vim {
        call dein#add('mbbill/undotree', {
            \ 'lazy': 1,
            \ 'on_cmd': ['UndotreeToggle', 'UndotreeShow', 'UndotreeHide'],
        \ })

        let g:undotree_SplitWidth = 30
        let g:undotree_DiffpanelHeight = 15
        let g:undotree_DiffAutoOpen = 1
        let g:undotree_SetFocusWhenToggle = 1

        nmap <Bslash>u :UndotreeToggle<CR>
    " }
    " mhinz/vim-startify - A start screen for Vim {
        call dein#add('mhinz/vim-startify', {
            \ 'lazy': 1,
            \ 'on_cmd': ['Startify'],
        \ })

        let g:startify_change_to_dir = 1
        let g:startify_files_number = 15
        let g:startify_session_dir = '~/.vim/session'
        let g:startify_session_autoload = 0
        let g:startify_session_persistence = 1
        let g:startify_session_delete_btartify_session_delete_buffersffers = 1
        let g:startify_bookmarks = ['~/.dotfiles']
    " }
    " scrooloose/nerdtree - A tree explorer plugin for Vim {
        call dein#add('scrooloose/nerdtree', {
            \ 'depends': ['nerdtree-git-plugin'],
            \ 'lazy': 1,
            \ 'on_cmd': ['NERDTreeToggle'],
        \ })
        call dein#add('Xuyuanp/nerdtree-git-plugin', {"lazy": 1})

        nnoremap <Bslash><Bslash> :NERDTreeToggle<CR>

        let NERDTreeShowLineNumbers = 1
        let NERDTreeShowHidden = 0
        let NERDTreeIgnore = ['\~$', '\.lo$', '\.la$', '\.pyc']
    " }
" }
" Plugins For Syntax & Completion {
    " neitanod/vim-clevertab - Tiny replacement for Supertab that DOES do what I need {
        call dein#add('neitanod/vim-clevertab', {
            \ 'lazy': 1,
            \ 'on_i': 1,
            \ 'hook_post_source': 'call SetupVimCleverTab()',
        \ })

        function! SetupVimCleverTab()
            inoremap <expr><S-TAB> pumvisible() ? "\<C-r>=CleverTab#Complete('prev')\<CR>" : "\<S-TAB>"
            inoremap <TAB> <C-r>=CleverTab#Complete('start')<CR>
                \<C-r>=CleverTab#Complete('tab')<CR>
                \<C-r>=CleverTab#Complete('omni')<CR>
                \<C-r>=CleverTab#Complete('neocomplete')<CR>
                \<C-r>=CleverTab#Complete('keyword')<CR>
                \<C-r>=CleverTab#Complete('ultisnips')<CR>
                \<C-r>=CleverTab#Complete('stop')<CR>
        endfunction
    " }
    " majutsushi/tagbar - Browsing the tags of source code files {
        call dein#add('majutsushi/tagbar', {
            \ 'depends': ['vim-airline', 'tagbar-phpctags.vim'],
            \ 'lazy': 1,
            \ 'on_cmd': ['TagbarToggle'],
        \ })
        call dein#add('vim-php/tagbar-phpctags.vim', {'lazy': 1})

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
        let g:tagbar_sort = 1
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
        let g:tagbar_type_go = {
            \ 'ctagstype' : 'go',
            \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
            \ ],
            \ 'sro' : '.',
            \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
            \ },
            \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
            \ },
            \ 'ctagsbin'  : 'gotags',
            \ 'ctagsargs' : '-sort -silent'
        \ }

        " Configure tagbar-phpctags plugin
        let g:tagbar_phpctags_bin = '~/.vim/bin/phpctags'
        let g:tagbar_phpctags_memory_limit = '128M'

        " Configure vim-airline extension
        let g:airline#extensions#tagbar#enabled = 0
        let g:airline#extensions#tagbar#flags = ''
    " }
    " vim-syntastic/syntastic - A syntax checking plugin for Vim {
        call dein#add('vim-syntastic/syntastic', {
            \ 'depends': ['vim-airline'],
        \ })

        nmap <Bslash>st :SyntasticToggleMode<CR>

        let g:syntastic_aggregate_errors = 1
        let g:syntastic_check_on_open = 0
        let g:syntastic_check_on_wq = 0
        let g:syntastic_auto_jump = 0
        let g:syntastic_auto_loc_list = 0
        let g:syntastic_always_populate_loc_list = 1
        let g:syntastic_loc_list_height = 5
        let g:syntastic_enable_highlighting = 1
        let g:syntastic_go_checkers = ['govet', 'golint', 'errcheck']
        let g:syntastic_php_checkers = ['phpcs', 'phpmd', 'php']
        let g:syntastic_html_tidy_ignore_errors = []

        " Configure vim-airline extension
        let g:airline#extensions#syntastic#enabled = 1
    " }
    " Shougo/vimproc.vim - Interactive command execution in Vim. {
        call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
    " }
    " Shougo/neocomplete.vim - Next generation completion framework after neocomplcache {
        call dein#add('Shougo/neocomplete.vim', {
            \ 'depends': ['vimproc.vim'],
            \ 'lazy': 1,
            \ 'on_i': 1,
            \ 'hook_post_source': 'call SetupNeoComplete()',
        \ })

        let g:acp_enableAtStartup = 0
        let g:neocomplete#enable_at_startup = 1
        let g:neocomplete#enable_auto_select = 1
        let g:neocomplete#enable_ignore_case = 1
        let g:neocomplete#enable_smart_case = 1
        let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
        let g:neocomplete#min_keyword_length = 2
        let g:neocomplete#auto_completion_start_length = 2
        let g:neocomplete#manual_completion_start_length = 2
        let g:neocomplete#sources#syntax#min_keyword_length = 2
        let g:neocomplete#release_cache_time = 300
        let g:neocomplete#skip_auto_completion_time = "0.5"
        let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]

        if !exists('g:neocomplete#delimiter_patterns')
            let g:neocomplete#delimiter_patterns = {}
        endif
        let g:neocomplete#delimiter_patterns.vim = ['#']
        let g:neocomplete#delimiter_patterns.cpp = ['::']
        let g:neocomplete#delimiter_patterns.php = ['::', '->']

        if !exists('g:neocomplete#keyword_patterns')
            let g:neocomplete#keyword_patterns = {}
        endif
        let g:neocomplete#keyword_patterns['default'] = '\h\w*'

        if !exists('g:neocomplete#sources#omni#functions')
            let g:neocomplete#sources#omni#functions = {}
        endif
        let g:neocomplete#sources#omni#functions.sql = 'sqlcomplete#Complete'

        " Enable heavy omni completion.
        if !exists('g:neocomplete#sources#omni#input_patterns')
            let g:neocomplete#sources#omni#input_patterns = {}
        endif
        let g:neocomplete#sources#omni#input_patterns.php = '\h\w*\|[^. \t]->\%(\h\w*\)\?\|\h\w*::\%(\h\w*\)\?'

        function! SetupNeoComplete()
            " <C-h>, <Left>: close popup and move backward char.
            inoremap <expr><C-h> neocomplete#smart_close_popup() . "\<C-h>"
            inoremap <expr><Left> neocomplete#smart_close_popup() . "\<Left>"

            inoremap <expr><C-g> neocomplete#undo_completion()
            inoremap <expr><C-l> neocomplete#complete_common_string()

            " Disable sort.
            call neocomplete#custom#source('_', 'sorters', [''])
        endfunction
    " }
    " SirVer/ultisnips - The ultimate snippet solution for Vim {
        call dein#add('honza/vim-snippets', {'lazy': 1})
        call dein#add('SirVer/ultisnips', {
            \ 'depends': ['vim-snippets'],
            \ 'lazy': 1,
            \ 'on_i': 1,
        \ })
        let g:UltiSnipsExpandTrigger = '<C-Bslash>'
        let g:UltiSnipsJumpForwardTrigger = '<C-p>'
        let g:UltiSnipsJumpBackwardTrigger = '<C-n>'
        let g:UltiSnipsListSnippets = '<C-z>'
        let g:UltiSnipsEditSplit = 'vertical'
        let g:UltiSnipsSnippetDirectories = [
            \ $HOME . '/.vim/UltiSnips',
        \ ]
    " }
" }
" Plugins For Text Editing {
    " AndrewRadev/splitjoin.vim - simplifies the transition between multiline and single-line code {
        call dein#add('AndrewRadev/splitjoin.vim', {
            \ 'lazy': 1,
            \ 'on_map': ['gS', 'gJ'],
        \ })
    " }
    " easymotion/vim-easymotion - Provides a much simpler way to use some motions in Vim {
        " Key mappings in Normal mode {
        " <Leader><Leader> : To jump cursor fast
        " }
        call dein#add('easymotion/vim-easymotion', {
            \ 'lazy': 1,
            \ 'on_map': ['<Leader><Leader>', '<Plug>(easymotion-'],
            \ 'hook_post_source': 'call SetupVimEasyMotionMappings()',
        \ })

        let g:EasyMotion_leader_key = '<Leader><Leader>'
        let g:EasyMotion_smartcase = 1
        let g:EasyMotion_use_upper = 1
        let g:EasyMotion_do_special_mapping = 1
        let g:EasyMotion_startofline = 0

        function! SetupVimEasyMotionMappings()
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
    " }
    " editorconfig/editorconfig-vim - EditorConfig plugin for Vim {
        call dein#add('editorconfig/editorconfig-vim')
    " }
    " godlygeek/tabular - vim script for text filtering and alignment {
        call dein#add('godlygeek/tabular', {
            \ 'lazy': 1,
            \ 'on_cmd': ['Tabularize'],
        \ })

        noremap <Leader><Tab>/ :Tabularize /
    " }
    " gregsexton/MatchTag - highlights the matching HTML tag when the cursor is positioned on a tag {
        call dein#add('gregsexton/MatchTag', {
            \ 'lazy': 1,
            \ 'on_ft': ['xml', 'htm', 'html', 'xhtml', 'phtml'],
        \ })
    " }
    " haya14busa/incsearch.vim - incrementally highlights ALL pattern matches unlike default 'incsearch' {
        call dein#add('haya14busa/incsearch.vim', {
            \ 'lazy': 1,
            \ 'on_map': ['<Plug>(incsearch-', '<Over>(incsearch-'],
        \ })

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
        call dein#add('haya14busa/vim-asterisk', {
            \ 'lazy': 1,
            \ 'on_map': ['<Plug>(asterisk-'],
        \ })

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
        call dein#add('junegunn/vim-easy-align', {
            \ 'lazy': 1,
            \ 'on_map': ['<Plug>(EasyAlign)']
        \ })

        " Start interactive EasyAlign in visual mode (e.g. vip<CR>)
        vmap <CR> <Plug>(EasyAlign)
        " Start interactive EasyAlign for a motion/text object (e.g. gaip)
        nmap ga <Plug>(EasyAlign)
    " }
    " jeetsukumaran/vim-indentwise - A Vim plugin for indent-level based motion {
        call dein#add('jeetsukumaran/vim-indentwise', {
            \ 'lazy': 1,
            \ 'on_map': ['<Plug>(IndentWise'],
        \ })

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
    " Konfekt/FastFold - Speed up Vim by updating folds only when called-for {
        call dein#add('Konfekt/FastFold')

        let g:tex_fold_enabled = 1
        let g:fastfold_savehook = 1     " 在儲存時更新折疊資訊
        let g:javaScript_fold = 1
        " Temporary disable g:perl_fold, it cause folding issue in vimrc
        " let g:perl_fold = 1
        let g:php_folding = 1
        let g:vimsyn_folding = 'af'
        let g:xml_syntax_folding = 1

        " FastFold 只在 za/zA/zx/zX 時更新折疊資訊
        " let g:fastfold_fold_command_suffixes = ['a', 'A', 'x', 'X']
        " let g:fastfold_skip_filetypes = [
        "     \ 'vim',
        "     \ 'taglist',
        " \ ]
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
        call dein#add('kshenoy/vim-signature')
    " }
    " nishigori/increment-activator - Enhance to increment candidates {
        call dein#add('nishigori/increment-activator', {
            \ 'lazy': 1,
            \ 'on_ft': ['gitrebase'],
            \ 'on_map': ['<Plug>(increment-activator-'],
        \ })

        let g:increment_activator_no_default_key_mappings = 1
        let g:increment_activator_no_default_candidates = 0
        let g:increment_activator_filetype_candidates = {
            \ 'php': [
                \ ['public', 'protected', 'private'],
                \ ['class', 'interface', 'trait'],
            \ ],
            \ 'gitrebase': [
                \ ['pick', 'reword', 'edit', 'squash', 'fixup', 'exec', 'drop'],
                \ ['p', 'r', 'e', 's', 'f', 'x', 'd'],
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
    " }
    " ntpeters/vim-better-whitespace - Better whitespace highlighting for Vim {
        call dein#add('ntpeters/vim-better-whitespace')
    " }
    " rhysd/clever-f.vim - Extended f, F, t and T key mappings for Vim {
        call dein#add('rhysd/clever-f.vim', {
            \ 'lazy': 1,
            \ 'on_map': ['f', 'F', 't', 'T'],
        \ })

        let g:clever_f_across_no_line = 1
        let g:clever_f_ignore_case = 0
        let g:clever_f_show_prompt = 1
        let g:clever_f_smart_case = 1
        let g:clever_f_mark_char = 1
        let g:clever_f_mark_cursor = 1
        let g:clever_f_repeat_last_char_inputs = ["\<CR>"]
    " }
    " terryma/vim-expand-region - To visually select increasingly larger regions of text using the same key combination {
        call dein#add('terryma/vim-expand-region', {
            \ 'lazy': 1,
            \ 'on_map': ['<Plug>(expand_region_'],
        \ })

        vmap v <Plug>(expand_region_expand)
        vmap V <Plug>(expand_region_shrink)
    "  }
    " terryma/vim-multiple-cursors - True Sublime Text style multiple selections for Vim {
        call dein#add('terryma/vim-multiple-cursors', {
            \ 'lazy': 1,
            \ 'on_map': [
                \ '<C-n>',
                \ ['ox', '<C-n>']
            \ ],
        \ })

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
        call dein#add('tpope/vim-commentary', {
            \ 'lazy': 1,
            \ 'on_cmd': ['Commentary'],
            \ 'on_map': ['gc'],
        \ })

        " To custom the comment string for a specific filetype
        " autocmd FileType sql setlocal commentstring=--\ %s
    " }
    " tpope/vim-unimpaired - pairs of handy bracket mappings {
        call dein#add('tpope/vim-unimpaired', {
            \ 'lazy': 1,
            \ 'on_map': ['[', ']'],
        \ })
    " }
    " tpope/vim-surround - To surround vim objects with a pair of identical chars {
        " Key mappings in Normal mode {
        "   ds  : Delete surrondings
        "   c   : Change surrondings
        "   ys  : takes a valid Vim motion or text object as the first object,
        "         and wraps it using the second argument
        "   yss : Operates on the current line, ignoring leading whitespace.
        "
        " }
        call dein#add('tpope/vim-surround')
    " }
    " tpope/vim-speeddating - Use CTRL-A/CTRL-X to increment dates, times, and more {
        call dein#add('tpope/vim-speeddating', {
            \ 'lazy': 1,
            \ 'on_map': ['<C-a>', '<C-x>', '<Plug>SpeedDating'],
        \ })

        let g:speeddating_no_mappings = 1

        nmap <leader>d<C-a> <Plug>SpeedDatingUp<Leader>d
        nmap <leader>d<C-x> <Plug>SpeedDatingDown<Leader>d
        nmap <leader>d+ <Plug>SpeedDatingUp<Leader>d
        nmap <leader>d- <Plug>SpeedDatingDown<Leader>d
        nmap <leader>dn <Plug>SpeedDatingNowUTC<Leader>d
    " }
    " tpope/vim-repeat - Extend repeatitions by the '.' key {
        call dein#add('tpope/vim-repeat', {
            \ 'lazy': 1,
            \ 'on_map': ['.'],
        \ })
    " }
    " vasconcelloslf/vim-interestingwords - Allows you to highlight and navigate through (multiple) different words in a buffer {
        call dein#add('vasconcelloslf/vim-interestingwords', {
            \ 'lazy': 1,
            \ 'on_func': ['InterestingWords', 'UncolorAllWords', 'WordNavigation'],
        \ })

        nnoremap <silent> <leader>k :call InterestingWords('n')<CR>
        nnoremap <silent> <leader>K :call UncolorAllWords()<CR>
        nnoremap <silent> n :call WordNavigation('forward')<CR>
        nnoremap <silent> N :call WordNavigation('backward')<CR>
    " }
" }
" Plugins For Text Object Selection {
    " kana/vim-textobj-user - Create your own text objects {
        " Reference: https://github.com/kana/vim-textobj-user/wiki
        call dein#add('kana/vim-textobj-user', {
            \ 'lazy': 1,
            \ 'on_func': 'textobj#user',
        \ })
    " }
    " kana/vim-textobj-datetime - Text objects for date and time {
        call dein#add('kana/vim-textobj-datetime', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'ada'],
                \ ['xo', 'ida'],
            \ ],
        \ })
    " }
    " kana/vim-textobj-diff - Text objects for ouputs of diff(1) {
        call dein#add('kana/vim-textobj-diff', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'adf'],
                \ ['xo', 'idf'],
            \ ],
        \ })
    " }
    " kana/vim-textobj-entire - Text objects for entire buffer {
        call dein#add('kana/vim-textobj-entire', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'ae'],
                \ ['xo', 'ie'],
            \ ],
        \ })
    " }
    " kana/vim-textobj-fold - Text objects for foldings {
        call dein#add('kana/vim-textobj-fold', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'az'],
                \ ['xo', 'iz'],
            \ ],
        \ })
    " }
    " kana/vim-textobj-indent - Text objects for indented blocks of lines {
        call dein#add('kana/vim-textobj-indent', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'aI'],
                \ ['xo', 'iI'],
            \ ]
        \ })
    " }
    " kana/vim-textobj-lastpat - Text objects for the last searched pattern {
        call dein#add('kana/vim-textobj-lastpat', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'a/'],
                \ ['xo', 'i/'],
            \ ],
        \ })
    " }
    " kana/vim-textobj-line - Text objects for the current line {
        call dein#add('kana/vim-textobj-line', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'al'],
                \ ['xo', 'il'],
            \ ],
        \ })
    " }
    " kana/vim-textobj-underscore - Underscore text-object for Vim {
        call dein#add('kana/vim-textobj-underscore', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'a_'],
                \ ['xo', 'i_'],
            \ ],
        \ })
    " }
    " kana/vim-textobj-syntax - Text objects for syntax highlighted items {
        call dein#add('kana/vim-textobj-syntax', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'ay'],
                \ ['xo', 'iy'],
            \ ],
        \ })
    " }
    " akiyan/vim-textobj-php - Vim text object plugin for PHP view template {
        call dein#add('akiyan/vim-textobj-php', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'ap'],
                \ ['xo', 'ip'],
            \ ],
        \ })
    " }
    " akiyan/vim-textobj-xml-attribute - Text objects for xml attribute {
        call dein#add('akiyan/vim-textobj-xml-attribute', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'axa'],
                \ ['xo', 'ixa'],
            \ ],
        \ })
    " }
    " fvictorio/vim-textobj-backticks - Text objects for regions inside backticks {
        call dein#add('fvictorio/vim-textobj-backticks', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'a`'],
                \ ['xo', 'i`'],
            \ ],
        \ })
    " }
    " h1mesuke/textobj-wiw - Text object to select a range of words for humans {
        call dein#add('h1mesuke/textobj-wiw', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'a,w'],
                \ ['xo', 'i,w'],
            \ ],
        \ })
    " }
    " mattn/vim-textobj-url - Text objects for url {
        call dein#add('mattn/vim-textobj-url', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'au'],
                \ ['xo', 'iu'],
            \ ],
        \ })
    " }
    " mjbrownie/html-textobjects - Some advanced vim html textobject mappings {
        call dein#add('mjbrownie/html-textobjects', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'ahf'],
                \ ['xo', 'ihf'],
            \ ],
        \ })
    " }
    " paulhybryant/vim-textobj-path - Text objects for file path {
        call dein#add('paulhybryant/vim-textobj-path', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'ap'],
                \ ['xo', 'aP'],
                \ ['xo', 'ip'],
                \ ['xo', 'iP'],
            \ ],
        \ })
    " }
    " reedes/vim-textobj-sentence  - Text objects for sentence {
        call dein#add('reedes/vim-textobj-sentence', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'as'],
                \ ['xo', 'is'],
            \ ],
        \ })
    " }
    " saihoooooooo/vim-textobj-space - Text objects for continuity space {
        call dein#add('saihoooooooo/vim-textobj-space', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'aS'],
                \ ['xo', 'iS'],
            \ ],
        \ })
    " }
    " sgur/vim-textobj-parameter - Text objects for parameter {
        call dein#add('sgur/vim-textobj-parameter', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'a,'],
                \ ['xo', 'i,'],
            \ ],
        \ })
    " }
    " thinca/vim-textobj-between - Text objects for a range between a character {
        call dein#add('thinca/vim-textobj-between', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'af'],
                \ ['xo', 'if'],
            \ ],
        \ })
    " }
    " thinca/vim-textobj-comment - Text objects for a comment {
        call dein#add('thinca/vim-textobj-comment', {
            \ 'depends': ['vim-textobj-user'],
            \ 'lazy': 1,
            \ 'on_map': [
                \ ['xo', 'ac'],
                \ ['xo', 'ic'],
            \ ],
        \ })
    " }
" }
" Plugins For CSS {
    " ap/vim-css-color - Highlight colors in css files {
        call dein#add('ap/vim-css-color', {
            \ 'lazy': 1,
            \ 'on_ft': ['css', 'htm', 'html', 'xhtml', 'phtml'],
        \ })
    " }
    " hail2u/vim-css3-syntax - Add CSS3 syntax support to vim's built-in `syntax/css.vim`{
        call dein#add('hail2u/vim-css3-syntax', {
            \ 'lazy': 1,
            \ 'on_ft': ['css', 'htm', 'html', 'xhtml', 'phtml'],
        \ })
    " }
" }
" Plugins For Jenkinsfile {
    " Jenkinsfile-vim-syntax - Jenkinsfile DSL vim syntax {
        call dein#add('martinda/Jenkinsfile-vim-syntax', {
            \ 'lazy': 1,
            \ 'on_ft': ['jenkinsfile', 'groovy'],
        \ })
    " }
" }
" Plugins For CSV {
    " chrisbra/csv.vim - A Filetype plugin for csv files {
        call dein#add('chrisbra/csv.vim', {
            \ 'depends': ['vim-airline'],
            \ 'lazy': 1,
            \ 'on_ft': ['csv', 'tsv'],
            \ 'hook_post_source': 'call SetupCsv()'
        \ })

        let g:csv_autocmd_arrange = 0
        let g:csv_autocmd_arrange_size = 512*512

        " Configure vim-airline extension
        let g:airline#extensions#csv#enabled = 1
        let g:airline#extensions#csv#column_display = 'Name'

        function! SetupCsv()
            nnoremap <Bslash>ac :%ArrangeColumn<CR>:Header 1<CR>
            nnoremap <Bslash>uac :%UnArrangeColumn<CR>:Header 1<CR>
        endfunction

        " autocmd BufReadPre *.csv setlocal filetype=csv
        " autocmd BufWritePre *.csv :%UnArrangeColumn
    " }
" }
" Plugins For Docker {
    " ekalinin/dockerfile.vim - Vim syntax file & snippets for Docker's Dockerfile {
        call dein#add('ekalinin/dockerfile.vim', {
            \ 'lazy': 1,
            \ 'on_ft': ['dockerfile', 'docker-compose', 'yaml.docker-compose'],
        \ })
    " }
" }
" Plugins For Git {
    " mhinz/vim-signify - Show a VCS diff using Vim's sign column {
        call dein#add('mhinz/vim-signify', {
            \ 'depends': ['vim-airline']
        \ })

        let g:signify_vcs_list = ['git']
        let g:signify_disable_by_default = 0
        let g:signify_line_highlight = 0
        let g:signify_mapping_toggle = '<leader>gt'
        let g:signify_mapping_prev_hunk = '<leader>gk'
        let g:signify_mapping_next_hunk = '<leader>gj'

        " Configure vim-airline extension
        let g:airline#extensions#hunks#enabled = 1
        let g:airline#extensions#hunks#non_zero_only = 1
        let g:airline#extensions#hunks#hunk_symbols = ['+', '~', '-']

        nnoremap <Bslash>gt :SignifyToggle<CR>
        nnoremap <Bslash>gh :SignifyToggleHighlight<CR>
        nnoremap <Bslash>gr :SignifyRefresh<CR>
        nnoremap <Bslash>gd :SignifyDebug<CR>
        nmap <Bslash>gj <plug>(signify-next-hunk)
        nmap <Bslash>gk <plug>(signify-prev-hunk)
    " }
    " tpope/vim-fugitive - A git wrapper so awesome {
        call dein#add('tpope/vim-fugitive', {
            \ 'depends': ['vim-airline'],
            \ 'lazy': 1,
            \ 'on_cmd': [
                \ 'Git', 'Gdiff', 'Gstatus', 'Gwrite', 'Gcd', 'Glcd',
                \ 'Ggrep', 'Glog', 'Gcommit', 'Gblame', 'Gbrowse',
            \ ],
        \ })

        " Configure vim-airline extension
        let g:airline#extensions#branch#enabled = 1
        let g:airline#extensions#branch#empty_message = ''
        let g:airline#extensions#branch#format = 0
    " }
" }
" Plugins For Golang {
    " fatih/vim-go - Go development plugin for Vim {
        if executable('go')
            call dein#add('fatih/vim-go', {
                \ 'depends': ['ctrlp.vim'],
                \ 'lazy': 1,
                \ 'on_ft': ['go'],
                \ 'hook_post_source': 'call SetupVimGo()',
                \ 'hook_post_update': ':GoUpdateBinaries',
            \ })
        endif

        let g:go_auto_type_info = 0
        let g:go_auto_sameids = 0
        let g:go_decls_includes = 'func,type'
        let g:go_fmt_autosave = 1
        let g:go_fmt_command = "goimports"
        " let g:go_fmt_experimental = 1
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
    " }
" }
" Plugins For HTML, XML {
    " mattn/emmet-vim - The essential toolkit for web-developers {
        call dein#add('mattn/emmet-vim', {
            \ 'lazy': 1,
            \ 'on_ft': ['xml', 'htm', 'html', 'css', 'markdown'],
        \ })
    " }
    " othree/html5.vim - HTML5 omnicomplete and syntax  {
        call dein#add('othree/html5.vim', {
            \ 'lazy': 1,
            \ 'on_ft': ['htm', 'html', 'css'],
        \ })

        let g:html5_event_handler_attributes_complete = 1
        let g:html5_rdfa_attributes_complete = 1
        let g:html5_microdata_attributes_complete = 1
        let g:html5_aria_attributes_complete = 1
    " }
    " othree/html5-syntax.vim - HTML5 syntax for Vim {
        call dein#add('othree/html5-syntax.vim', {
            \ 'lazy': 1,
            \ 'on_ft': ['htm', 'html'],
        \ })
    " }
    " othree/xml.vim - Helps editing XML (and [x]html, sgml, xslt) files {
        call dein#add('othree/xml.vim', {
            \ 'lazy': 1,
            \ 'on_ft': ['xml'],
        \ })
    " }
    " tpope/vim-ragtag - HTML/XML mappings {
        call dein#add('tpope/vim-ragtag', {
            \ 'lazy': 1,
            \ 'on_ft': ['xml', 'htm', 'html', 'xhtml', 'phtml'],
            \ 'on_map': ['<Plug>ragtag'],
        \ })
    " }
" }
" Plugins For JavaScript {
    " pangloss/vim-javascript - Vastly improved Javascript indentation and syntax support in Vim {
        call dein#add('pangloss/vim-javascript', {
            \ 'lazy': 1,
            \ 'on_ft': ['htm', 'html', 'javascript'],
        \ })

        let javascript_enable_domhtmlcss = 1
    " }
" }
" Plugins For JSON {
    " elzr/vim-json - Distinct highlighting of keywords vs values {
        call dein#add('elzr/vim-json', {
            \ 'lazy': 1,
            \ 'on_ft': ['json'],
        \ })

        let g:vim_json_syntax_conceal = 0
    " }
" }
" Plugins For Markdown {
    " tpope/vim-markdown - Markdown runtime files {
        call dein#add('tpope/vim-markdown', {
            \ 'lazy': 1,
            \ 'on_ft': ['markdown', 'md'],
        \ })

        autocmd BufNewFile,BufReadPost *.md setlocal filetype=markdown
    " }
" }
" Plugins For PHP {
    " 2072/php-indenting-for-vim - The official VIm indent script for PHP {
        call dein#add('2072/php-indenting-for-vim')

        let g:PHP_autoformatcomment = 0
        let g:PHP_BracesAtCodeLevel = 0
        let g:PHP_noArrowMatching = 1
    " }
    " rayburgemeestre/phpfolding.vim - Automatic folding of PHP {
        call dein#add('rayburgemeestre/phpfolding.vim', {
            \ 'hook_post_source': 'call SetupPHPFolding()',
        \ })

        let php_folding = 1

        function! SetupPHPFolding()
            nnoremap <Bslash>pf :EnableFastPHPFolds<CR>
        endfunction

        " " Refresh PHPFolds on insert leave
        " autocmd InsertLeave *.php if &modified && exists(":EnableFastPHPFolds") | :EnableFastPHPFolds
    " }
    " shawncplus/phpcomplete.vim - Improved PHP omnicompletion {
        call dein#add('shawncplus/phpcomplete.vim')

        let g:phpcomplete_relax_static_constraint = 1
        let g:phpcomplete_enhance_jump_to_definition = 1

    " }
    " " StanAngeloff/php.vim {
    "     call dein#add('StanAngeloff/php.vim', {
            " \ 'lazy': 1,
            " \ 'on_ft': ['php'],
    "     \ })
    " " }
" }
" Plugins For YAML, RAML {
    " stephpy/vim-yaml - Override vim syntax for yaml files {
        call dein#add('stephpy/vim-yaml', {
            \ 'lazy': 1,
            \ 'on_ft': ['yaml'],
        \ })
    " }
    " pedrohdz/vim-yaml-folds - YAML, RAML, EYAML & SaltStack SLS folding for Vim {
        call dein#add('pedrohdz/vim-yaml-folds', {
            \ 'lazy': 1,
            \ 'on_ft': ['yaml', 'raml'],
        \ })
    " }
    " IN3D/vim-raml - Vim syntax and language settings for RAML {
        call dein#add('IN3D/vim-raml', {
            \ 'lazy': 1,
            \ 'on_ft': ['raml'],
        \ })
    " }
" }
" Plugins For Terraform {
    " hashivim/vim-terraform - basic vim/terraform integration {
        call dein#add('hashivim/vim-terraform', {
            \ 'lazy': 1,
            \ 'on_ft': ['tf', 'terraform'],
        \ })

        let g:terraform_align=1
    " }
    " juliosueiras/vim-terraform-completion - A Vim Autocompletion and linter for Terraform, a HashiCorp tool {
        call dein#add('juliosueiras/vim-terraform-completion', {
            \ 'lazy': 1,
            \ 'on_ft': ['tf', 'terraform'],
        \ })
    " }
" }
" Plugins For Shell, Bash, TMUX {
    " " edkolev/promptline.vim - Generate a fast shell prompt with powerline symbols and airline colors {
    "     call dein#add('edkolev/promptline.vim', {
    "         \ 'depends': ['vim-airline'],
            " \ 'lazy': 1,
            " \ 'on_cmd': ['Promptline', 'PromptlineSnapshot'],
    "     \ })

    "     let g:promptline_powerline_symbols = 0
    "     let g:promptline_theme = 'airline'
    "     let g:promptline_preset = {
    "         \ 'a'     : ['\u@\H'],
    "         \ 'b'     : ['\w'],
    "         \ 'c'     : ['$(git_branch)', '$(git rev-parse --short HEAD 2>/dev/null)', '$(git_since_last_commit)'],
    "         \ 'warn'  : [promptline#slices#last_exit_code()],
    "         \ 'y'     : ['\n \t'],
    "         \'options': {
    "             \ 'left_sections'     : ['a', 'b', 'c', 'warn', 'y'],
    "             \ 'left_only_sections': ['a', 'b', 'c', 'warn', 'y'],
    "         \ },
    "     \ }
    "     let g:promptline_symbols = {
    "         \ 'left'      : '',
    "         \ 'left_alt'  : '>',
    "         \ 'dir_sep'   : ' / ',
    "         \ 'truncation': '...',
    "         \ 'vcs_branch': '',
    "         \ 'space'     : ' '
    "     \ }

    "     " Configure vim-airline extension
    "     let g:airline#extensions#promptline#enabled = 1
    "     let airline#extensions#promptline#color_template = 'replace'
    "     let airline#extensions#promptline#snapshot_file = '~/.bash/prompts/promptline.sh'
    " " }
    " " edkolev/tmuxline.vim - Simple tmux statusline generator with support for powerline symbols and airline integration {
    "     call dein#add('edkolev/tmuxline.vim', {
    "         \ 'depends': ['vim-airline'],
    "         \ 'lazy': 1,
            " \ 'on_cmd': ['Tmuxline'],
    "     \ })

    "     let g:tmuxline_powerline_separators = 0
    "     let g:tmuxline_theme = 'nightly_fox'
    "     let g:tmuxline_preset = {
    "         \ 'a'   : ['#(whoami)@#h'],
    "         \ 'b'   : ['❐ #S'],
    "         \ 'c'   : [''],
    "         \ 'win' : ['[#I] #W'],
    "         \ 'cwin': ['[#I] #W'],
    "         \ 'x'   : [''],
    "         \ 'y'   : ['%a', '%Y-%m-%d %H:%M:%S'],
    "         \ 'options': {
    "             \ 'status-justify': 'left'
    "         \ }
    "     \ }

    "     " Configure vim-airline extension
    "     let g:airline#extensions#tmuxline#enabled = 1
    "     let airline#extensions#tmuxline#color_template = 'replace'
    "     let airline#extensions#tmuxline#snapshot_file = '~/.tmux/colorschemes/tmuxlineSnapshot.conf'
    " " }
    " ericpruitt/tmux.vim - Vim syntax file for tmux configuration files {
        call dein#add('ericpruitt/tmux.vim', {
            \ 'lazy': 1,
            \ 'on_ft': ['conf', 'tmux'],
            \ 'rtp': 'vim/',
        \ })
    " }
    " vimez/vim-tmux - Vim syntax highlighting for tmux.conf {
        call dein#add('vimez/vim-tmux', {
            \ 'lazy': 1,
            \ 'on_ft': ['conf', 'tmux'],
        \ })
    " }
    " dag/vim-fish - Vim support for editing fish scripts {
        call dein#add('dag/vim-fish', {
            \ 'lazy': 1,
            \ 'on_ft': ['fish'],
        \ })
    " }
" }
" Plugins For Misc {
    " uarun/vim-protobuf - Vim syntax highlighting for Google's Protocol Buffers {
        call dein#add('uarun/vim-protobuf', {
            \ 'lazy': 1,
            \ 'on_ft': ['proto'],
        \ })
    " }
    " ludovicchabant/vim-gutentags - A Vim plugin that manages your tag files {
        " https://robertbasic.com/blog/current-vim-setup-for-php-development/
        call dein#add('ludovicchabant/vim-gutentags')

        let g:gutentags_ctags_executable="~/.vim/bin/ctags"
        let g:gutentags_cache_dir = '~/.vim/tmp/gutentags'
        let g:gutentags_exclude = [
            \ '*.css',
            \ '*.html', '*.js', '*.json', '*.xml',
            \ '*.phar', '*.ini', '*.rst', '*.md',
            \ '*vendor/*/test*', '*vendor/*/Test*',
            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
            \ '*var/cache*', '*var/log*'
        \ ]
    " }
" }
    call dein#end()
    " call dein#save_state()
" endif

autocmd VimEnter * call dein#call_hook('source') |
    \ call dein#call_hook('post_source')

filetype plugin indent on
syntax enable

if dein#check_install()
    set cmdheight=40
    call dein#install()
    set cmdheight=1
endif
