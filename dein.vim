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
    call dein#begin(expand($HOME . '/.vim/dein'), [expand($HOME . '/.vim/dein.vim')])

    " Shougo/dein.vim - Dark powered Vim/Neovim plugin manager {
        call dein#add('Shougo/dein.vim')

        let g:dein#install_message_type='echo'
    " }

    call SourceVimFilesInDirectoryByGlob($HOME . '/.vim/dein.vim.d', '*.vim')

" Plugins For Text Editing {
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
        let g:phpcomplete_mappings = {
            \ 'jump_to_def': '<C-]>',
            \ 'jump_to_def_split': '<C-Q><C-]>',
            \ 'jump_to_def_vsplit': '<C-Q><C-\>',
            \ 'jump_to_def_tabnew': '<C-Q><C-[>',
        \ }

    " }
    " " StanAngeloff/php.vim {
    "     call dein#add('StanAngeloff/php.vim', {
    "         \ 'lazy': 1,
    "         \ 'on_ft': ['php'],
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

        let g:gutentags_enabled = 1
        let g:gutentags_ctags_executable='~/.vim/bin/ctags'
        let g:gutentags_cache_dir = '~/.vim/tmp/gutentags'
        let g:gutentags_ctags_exclude = [
            \ '*.css',
            \ '*.html', '*.js', '*.json', '*.xml',
            \ '*.phar', '*.ini', '*.rst', '*.md',
            \ '*vendor/*/test*', '*vendor/*/Test*',
            \ '*vendor/*/fixture*', '*vendor/*/Fixture*',
            \ '*var/cache*', '*var/log*'
        \ ]
        let g:gutentags_exclude_filetypes = []
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
