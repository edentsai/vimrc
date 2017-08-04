" vim: set filetype=vim

" Skip initialization for vim-tiny or vim-small. {
if 0 | endif
" }

" Functions {
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
    " MakeDirIfNoExists() - Make directory if no exists. {
        function! MakeDirIfNoExists(path)
            if !isdirectory(expand(a:path))
                call mkdir(expand(a:path), "p")
            endif
        endfunction
    " }
    " Preserve() - save last search, and cursor position. {
        function! Preserve(command)
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
    " Restore cursor to file position in previous editing session {
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
    " }
" }

" Settings {
    " Compatible, Filetype, Syntax {
        set nocompatible                " Do not compatible with the old-fashion vi mode.
        filetype off                    " Necessary tip to make filetype detect work on Linux.
        filetype on                     " Enable filetype detection.
        filetype indent on              " Enable filetype-specific plugin.
        filetype plugin on              " Enable filetype-specific indent.
        syntax on                       " Enable syntax highlight.
    " }
    " Encodings {
        scriptencoding utf-8            " Specify the character encoding used in the script.
        set encoding=utf-8              " Encoding used inside Vim.
        set termencoding=utf-8          " Encoding used for the terminal.
        set fileencoding=utf-8          " Encoding used for the file of current buffer.
        " A list of encodings considered when starting to edit an existing file.
        set fileencodings=utf-8,ucs-bom,ig5,gb2312,latin1
    " }
    " Terminal Options {
        set t_Co=256                    " Number of colors in terminal
        set ttyfast                     " Indicates a fast terminal connection
    " }
    " Interfaces {
        set colorcolumn=120             " Highlight the screen column.
        set cursorcolumn                " Highlight the screen column of the cursor.
        set cursorline                  " Highlight the screen line of the cursor.
        set hidden                      " Hidden a buffer when it is abandoned.
        set laststatus=2                " Always show the status line.
        set lazyredraw                  " Enable lazy redraw.
        set number                      " Show number line.
        set numberwidth=5               " Speficy the width of number line.
        set ruler                       " Show the line and column number of the cursor position.
        set scrolloff=4                 " Minimal number of screen lines to keep above and below the cursor.
        set showcmd                     " Show command in the last line of the screen.
        set showmode                    " Show the mode line.
        set showtabline=2               " Always show the tab line.
        set title                       " Set the terminal title to the current file.
        set fillchars+=vert:│           " Characters to fill the statuslines and vertical separators.

        " Strings to use in 'list' mode and for the :list command.
        set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
    " }
    " History {
        set history=500                 " How many commands be stored in history.
    " }
    " Directory, File {
        set autochdir                   " Auto change to the directory containing the file which was opened file.
        set nobackup                    " Do not make a backup before overwriting a file.
        set noswapfile                  " Do not use a swapfile for the buffer.

        " List of directory names for the backup/swap/undo files,
        " And make the directories if no exists.
        set backupdir=$HOME/.vim/tmp/backup/
        set directory=$HOME/.vim/tmp/swap/
        set undodir=$HOME/.vim/tmp/undo/
    " }
    " Text Editor {
        set backspace=indent,eol,start  " Allow backspacing over everything in insert mode.
        set virtualedit=all             " Allow virtual editing in all modes.

        " Indent
        set autoindent                  " Copy indent from current line when starting a new line.
        set copyindent                  " Copy the existing lines indent when autoindenting a new line.
        set smartindent                 " Do smart autoindenting when starting a new line.
        set shiftwidth=4                " Number of spaces to use for each step of (auto)indent.

        " <Tab>
        set expandtab                   " Use the appropriate number of spaces to insert a <Tab>.
        set tabstop=4                   " Number of spaces that a <Tab> in the file counts for.
        set softtabstop=4               " Number of spaces that a <Tab> counts for while performing editing operations.

        " Folding
        set foldenable                  " Enable folding
        set foldlevel=2                 " Folds with a higher level will be closed.
        set foldlevelstart=1            " Sets 'foldlevel' when starting to edit another buffer in a window
        set foldmarker={,}              " The start and end marker used when the 'foldmethod' is 'marker'
        set foldmethod=syntax           " Folding by syntax highlight for the current window
        set foldnestmax=2               " The maximum nesting of oflds for the 'foldmethod' is 'indent' and 'syntax'
    " }
    " Search {
        set hlsearch                   " Highlight all matches of search pattern.
        set incsearch                  " Enable incremental search.
        set ignorecase                 " Ignore case in search patterns.
        set smartcase                  " Disable 'ignorecase' if the search pattern contains upper case characters.
        set showmatch                  " When a bracket is inserted, briefly jump to the matching one.
        set matchtime=3                " Tenths of a second to show the matching paren when 'showmatch' is set.
    " }
    " Wildmenu {
        set completeopt=longest,menu    " A list of options for insert mode completion.
        set pumheight=10                " Maximum number of items to show in the popup menu for Insert mode completion.
        set wildchar=<Tab>              " Character you have to type to start wildcard expansion in the command-line.
        set wildmenu                    " Enable command-line completion operates in an enhanced mode.
        set wildmode=list:longest,full  " Completion mode is used for the character specified with 'wildchar'.

        " A list of file patterns is ignored when expanding wildcards.
        set wildignore+=*.sw?                       " Vim swap files
        set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~ " Backup files
        set wildignore+=*.luac                      " Lua byte code
        set wildignore+=*.jar                       " Java archives
        set wildignore+=*.pyc                       " Python byte code
        set wildignore+=*.stats                     " Pylint stats
        set wildignore+=*.class,*.o
        set wildignore+=*.zip
        set wildignore+=*.exe

        " Files with these suffixes get a lower priority when multiple files match a wildcard
        set suffixes=.bak,~,.o,.info,.swp,.obj
    " }
    " Mouse, Keyboard {
        set mouse=                      " Disable the use of the mouse.
        set selection=exclusive         " Defines the behavior of the selection.
        set selectmode=key,mouse        " Start a selection by mouse or shifted special keys
        set timeoutlen=1000             " The time in milliseconds that is waited for a key code or mapped key sequence to complete.
    " }
    " Sound {
        set t_vb=
        set novisualbell                " Disable the visual bell.
        set noerrorbells                " Disable the error bells.
    " }
" }

" Auto Commands {
    " File & Directory {
        " Restore cursor to file position in previous editing session {
            autocmd BufReadPost * :call RestoreCursorFromPreviousSession()
        " }
        " Auto remove all trailing whitespace when save file {
            autocmd BufWritePre * :call Preserve("%s/\\s\\+$//ec")
        " }
        " Resize the divsions if the Vim window size changes {
            autocmd VimResized * exe "normal! \<c-w>="
        " }
    " }
    " Vim, Tmux, Conf {
        autocmd FileType vim,tmux,conf
            \ setlocal foldmethod=marker |
            \ setlocal foldlevel=1
    " }
    " PHP {
        autocmd FileType php
            \ setlocal syntax=php |
            \ setlocal omnifunc=phpcomplete#CompletePHP
    " }
    " Golang {
        autocmd FileType go
            \ setlocal noexpandtab |
            \ setlocal syntax=go |
            \ setlocal omnifunc=go#complete#Complete
    " }
    " HTML, PHTML {
        autocmd FileType htm,html,phtml
            \ setlocal syntax=html |
            \ setlocal omnifunc=htmlcomplete#CompleteTags |
            \ setlocal foldmethod=manual |
            \ nnoremap <Bslash>f zfat |
            \ vnoremap <Bslash>f zfat
        autocmd BufNewFile,BufRead *.phtml setlocal filetype=html
    " }
    " XML {
        autocmd FileType xml
            \ setlocal syntax=xml |
            \ setlocal omnifunc=xmlcomplete#CompleteTags
    " }
    " CSS, SCSS, SASS {
        autocmd FileType css,scss,sass
            \ setlocal syntax=css |
            \ setlocal omnifunc=csscomplete#CompleteCSS |
            \ setlocal foldmethod=marker |
            \ setlocal foldmarker={,} |
            \ setlocal foldlevel=1
    " }
    " Javascript {
        autocmd Filetype javascript,js
            \ setlocal syntax=javascript |
            \ setlocal omnifunc=javascriptcomplete#CompleteJS |
            \ setlocal foldmethod=marker |
            \ setlocal foldlevel=1 |
            \ setlocal foldnestmax=3
    " }
    " JSON {
        autocmd Filetype json
            \ setlocal foldmethod=syntax |
            \ setlocal foldlevel=1 |
            \ setlocal tabstop=4 |
            \ setlocal softtabstop=4 |
            \ setlocal shiftwidth=4
    " }
    " YAML, RAML {
        autocmd Filetype yml,yaml,raml
            \ setlocal syntax=yaml |
            \ setlocal tabstop=2 |
            \ setlocal softtabstop=2 |
            \ setlocal shiftwidth=2
    " }
    " Omni Completion {
        autocmd FileType c setlocal omnifunc=ccomplete#Complete
        autocmd FileType java setlocal omnifunc=javacomplete#Complet
        autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

        " Use syntax complete if nothing else available {
            if has("autocmd") && exists("+omnifunc")
                autocmd Filetype *
                    \ if &omnifunc == "" |
                    \     setlocal omnifunc=syntaxcomplete#Complete |
                    \ endif
            endif
        " }
    " }
" }

" Mapping Keys {
    " <leader> & <Localleader> {
        let mapleader = "\<Space>"
        let maplocalleader = "\<Space>"
    " }
    " Copy, Paste {
        " Copy & Paste with system clipboard {
            map <Leader>Y "+y$
            map <Leader>y "+y
            map <Leader>P "+P
            map <Leader>p "+p
            map <Leader>d "+d
        " }
        " Paste mutiple lines multiple time with simple ppp {
            nnoremap <silent> p p`]
            vnoremap <silent> p p`]
        " }
        " Quickly select text you just pasted {
            nnoremap gV `[v`]
        " }
    " }
    " Cursor {
        " Move cursor in insert mode by <M-hjkl> {
            inoremap <M-h> <Left>
            inoremap <M-j> <Down>
            inoremap <M-k> <Up>
            inoremap <M-l> <Right>

            " For iTerm2/Mac OSX if the option key acts as Normal
            inoremap ˙ <Left>
            inoremap ∆ <Down>
            inoremap ˚ <Up>
            inoremap ¬ <Right>
        " }
        " Move cursor by display lines when wrapping {
            nnoremap j gj
            nnoremap k gk
            nnoremap $ g$
            nnoremap ^ g^
            nnoremap 0 g0
        " }
        " Use <Leader><CR> as G {
            nnoremap <Leader><CR> G
        " }
    " }
    " File, Directory {
        " File operations {
            nnoremap <Leader>w :update<CR>
            nnoremap <Leader>q :quit<CR>
            nnoremap <Leader>wq :update<CR>:q<CR>
            nnoremap <Leader>qa :qa<CR>
        " }
        " `<Leader>cd` to the directory containing the file in the buffer {
            nnoremap <Leader>cd :lcd %:h<CR>
        " }
    " }
    " Toggle Modes {
        " Toggle list chars mode {
            nnoremap <Bslash>lc :set invlist<CR> :echo 'Set list =' &list<CR>
        " }
        " Toggle paste mode {
            nnoremap <Bslash>p :set invpaste<CR> :echo 'Set paste =' &paste<CR>
        " }
        " Toggle highlight search Mode {
            nnoremap <Bslash>s :nohlsearch<CR>
        " }
        " Toggle Wrap mode {
            nnoremap <Bslash>wp :set invwrap<CR> :echo 'Set wrap =' &invwrap<CR>
        " }
        " Toggle folding {
            nnoremap <Bslash>f za
            vnoremap <Bslash>f za
        " }
        " Toggle number line {
            nnoremap <Bslash>n :set invnumber<CR> :echo 'Set number =' &number<CR>
            nnoremap <Bslash>rn :set invrelativenumber<CR> :echo 'Set relativenumber =' &relativenumber<CR>
        " }
        " Toggle spell checking with english {
            nnoremap <Bslash>se :setlocal invspell spelllang=en<CR> :echo 'Set spell =' &spell<CR>
        " }
    " }
    " Windows {
        " Moving cursor to other windows {
            nnoremap <C-h> <C-w>h
            nnoremap <C-j> <C-w>j
            nnoremap <C-k> <C-w>k
            nnoremap <C-l> <C-w>l
        "}
    " }
    " Tabs {
        " Continuous moving cursor to other tabs {
            nmap <C-t><C-p> gT<C-t>
            nmap <C-t><C-n> gt<C-t>
        " }
        " Mapping <C-t># switch to the #number tab {
            nnoremap <C-t>1 1gt
            nnoremap <C-t>2 2gt
            nnoremap <C-t>3 3gt
            nnoremap <C-t>4 4gt
            nnoremap <C-t>5 5gt
            nnoremap <C-t>6 6gt
            nnoremap <C-t>7 7gt
            nnoremap <C-t>8 8gt
            nnoremap <C-t>9 9gt
        " }
    " }
    " Text Editor {
        " Continuous indent {
            nnoremap > >>
            nnoremap < <<
            vnoremap < <gv
            vnoremap > >gv
            nnoremap <TAB> >>
            vnoremap <TAB> >gv
            if system('echo $TMUX') == ''
                nnoremap <S-TAB> <<
                inoremap <S-TAB> <C-O><<
                vnoremap <S-TAB> <gv
            else
                nnoremap [Z <<
                inoremap [Z <C-O><<
                vnoremap [Z <gv
            endif
        " }
        " Convert the current word to uppercase / lowercase {
            nnoremap <Leader>uc viwU
            nnoremap <Leader>lc viwu
        " }
        " Move lines to up / down {
            nnoremap <M-j> :m .+1<CR>==
            nnoremap <M-k> :m .-2<CR>==
            vnoremap <M-j> :m '>+1<CR>gv=gv
            vnoremap <M-k> :m '<-2<CR>gv=gv

            " For iTerm2/Mac OSX if the option key acts as Normal
            nnoremap ∆ :m .+1<CR>==
            nnoremap ˚ :m .-2<CR>==
            vnoremap ∆ :m '>+1<CR>gv=gv
            vnoremap ˚ :m '<-2<CR>gv=gv
        " }
        " Easier increment / decrement {
            nmap <silent> + <C-a>
            nmap <silent> - <C-x>
        " }
    " }
    " Search {
        " Keep search pattern at the center of the screen {
            nnoremap <silent> n nzz
            nnoremap <silent> N Nzz
            nnoremap <silent> * *zz
            nnoremap <silent> # #zz
        " }
        " Continuous replacing all search matches {
            " 1. I search things usual way using `/something`
            " 2. I hit `cw`, replace first match, and hit <Esc>
            " 3. I hit `n.n.n.n.n.` reviewing and replacing all matches
            vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
                \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
            omap s :normal vs<CR>
        " }
    " }
" }

" Bundles (Plugins) {
    if filereadable($HOME . '/.vim/vimrc_neobundle.vim')
        source $HOME/.vim/vimrc_neobundle.vim
    endif
" }

" Colorscheme {
    try
        colorscheme molokai
    catch /^Vim\%((\a\+)\)\=:E185/
        colorscheme elflord
    endtry
" }

" Local settings {
    " Include .vimrc_local if it exists {
        if filereadable($HOME . '/.vimrc_local')
            source $HOME/.vimrc_local
        endif
    " }
" }
