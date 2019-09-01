" <leader> & <Localleader> {
    let mapleader = "\<Space>"
    let maplocalleader = "\<Space>"
" }

" Copy & Paste {
    " Copy & Paste with system clipboard. {
        map <Leader>Y "+y$
        map <Leader>y "+y
        map <Leader>P "+P
        map <Leader>p "+p
        map <Leader>d "+d
    " }
    " Paste multiple lines multiple time with simple ppp. {
        nnoremap <silent> p p`]
        vnoremap <silent> p p`]
    " }
    " Quickly select text you just pasted. {
        nnoremap gV `[v`]
    " }
" }

" Cursor {
    " Move cursor in insert mode by <M-hjkl>. {
        inoremap <M-h> <Left>
        inoremap <M-j> <Down>
        inoremap <M-k> <Up>
        inoremap <M-l> <Right>

        " For iTerm2 in MacOS when the option key acts as Normal.
        inoremap ˙ <Left>
        inoremap ∆ <Down>
        inoremap ˚ <Up>
        inoremap ¬ <Right>
    " }
    " Move cursor by display lines when wrapping. {
        nnoremap j gj
        nnoremap k gk
        nnoremap $ g$
        nnoremap ^ g^
        nnoremap 0 g0
    " }
    " Use <Leader><CR> as G. {
        nnoremap <Leader><CR> G
    " }
" }

" File, Directory {
    " File operations. {
        nnoremap <Leader>w :update<CR>
        nnoremap <Leader>q :quit<CR>
        nnoremap <Leader>wq :update<CR>:quit<CR>
        nnoremap <Leader>qa :quitall<CR>
    " }
    " `<Leader>cd` to the directory containing the file in the buffer. {
        nnoremap <Leader>cd :lcd %:h<CR>
    " }
" }

" Toggle Modes {
    " Toggle list chars mode. {
        nnoremap <Bslash>lc :setlocal invlist<CR> :echo 'Set list =' &list<CR>
    " }
    " Toggle paste mode. {
        nnoremap <Bslash>p :setlocal invpaste<CR> :echo 'Set paste =' &paste<CR>
    " }
    " Toggle highlight search mode. {
        nnoremap <Bslash>hs :nohlsearch<CR>
        nnoremap <Bslash>hS :setlocal invhlsearch<CR> :echo 'Set hlsearch =' &hlsearch<CR>
    " }
    " Toggle wrap mode. {
        nnoremap <Bslash>wp :setlocal invwrap<CR> :echo 'Set wrap =' &wrap<CR>
    " }
    " Toggle line number mode. {
        nnoremap <Bslash>n :setlocal invnumber<CR> :echo 'Set number =' &number<CR>
        nnoremap <Bslash>rn :setlocal invrelativenumber<CR> :echo 'Set relativenumber =' &relativenumber<CR>
    " }
    " Toggle spell checking with english. {
        nnoremap <Bslash>se :setlocal invspell spelllang=en<CR> :echo 'Set spell =' &spell<CR>
    " }
" }

" Switch Windows {
    " Moving cursor to other windows. {
        nnoremap <C-k> <C-w>k
        nnoremap <C-j> <C-w>j
        nnoremap <C-l> <C-w>l
        nnoremap <C-h> <C-w>h

        nnoremap <C-w>OA <C-w>k
        nnoremap <C-w>OB <C-w>j
        nnoremap <C-w>OC <C-w>l
        nnoremap <C-w>OD <C-w>h
    "}
" }

" Tabs {
    " Continuous moving cursor to other tabs. {
        nmap <C-t><C-p> gT<C-t>
        nmap <C-t><C-n> gt<C-t>
    " }
    " Mapping <C-t># switch to the #number tab. {
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
    " Continuous indent. {
        nnoremap > >>
        nnoremap < <<
        vnoremap < <gv
        vnoremap > >gv
        nnoremap <TAB> >>
        vnoremap <TAB> >gv

        if system('echo $TMUX_PANE') == ''
            nnoremap <S-TAB> <<
            inoremap <S-TAB> <C-O><<
            vnoremap <S-TAB> <gv
        else
            nnoremap [Z <<
            inoremap [Z <C-O><<
            vnoremap [Z <gv
        endif
    " }
    " Convert the current word to uppercase / lowercase. {
        nnoremap <Leader>uc viwU
        nnoremap <Leader>lc viwu
    " }
    " Move lines to up / down. {
        nnoremap <M-j> :m .+1<CR>==
        nnoremap <M-k> :m .-2<CR>==
        vnoremap <M-j> :m '>+1<CR>gv=gv
        vnoremap <M-k> :m '<-2<CR>gv=gv

        " For iTerm2 on MacOS if the option key acts as Normal.
        nnoremap ∆ :m .+1<CR>==
        nnoremap ˚ :m .-2<CR>==
        vnoremap ∆ :m '>+1<CR>gv=gv
        vnoremap ˚ :m '<-2<CR>gv=gv
    " }
    " Easier increment / decrement. {
        nmap <silent> + <C-a>
        nmap <silent> - <C-x>
    " }
" }

" Search {
    " Keep search pattern at the center of the screen. {
        nnoremap <silent> n nzz
        nnoremap <silent> N Nzz
        nnoremap <silent> * *zz
        nnoremap <silent> # #zz
    " }
    " Continuous replacing all search matches. {
        " 1. I search things usual way using `/something`
        " 2. I hit `cw`, replace first match, and hit <Esc>
        " 3. I hit `n.n.n.n.n.` reviewing and replacing all matches
        vnoremap <silent> s //e<C-r>=&selection=='exclusive'?'+1':''<CR><CR>
            \:<C-u>call histdel('search',-1)<Bar>let @/=histget('search',-1)<CR>gv
        omap s :normal vs<CR>
    " }
" }
