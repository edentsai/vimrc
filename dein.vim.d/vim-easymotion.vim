" https://github.com/easymotion/vim-easymotion
"
" Vim motions on speed!
"
" Key mappings in Normal mode {
"     <Leader><Leader> : To jump cursor fast
" }

call dein#add('easymotion/vim-easymotion', {
    \ 'lazy': 1,
    \ 'on_map': [
        \ '<Leader><Leader>',
        \ '<Plug>(easymotion-',
    \ ],
    \ 'hook_post_source': 'call SetupVimEasyMotionMappings()',
\ })

let g:EasyMotion_leader_key = '<Leader><Leader>'
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_upper = 1
let g:EasyMotion_do_special_mapping = 1
let g:EasyMotion_startofline = 0

function! SetupVimEasyMotionMappings()
    " Search.
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

    " Easy motion for bidirectional.
    map <Plug>(easymotion-prefix)af <Plug>(easymotion-bd-f)
    map <Plug>(easymotion-prefix)at <Plug>(easymotion-bd-t)
    map <Plug>(easymotion-prefix)aw <Plug>(easymotion-bd-w)
    map <Plug>(easymotion-prefix)aW <Plug>(easymotion-bd-W)
    map <Plug>(easymotion-prefix)ae <Plug>(easymotion-bd-e)
    map <Plug>(easymotion-prefix)aE <Plug>(easymotion-bd-E)
    map <Plug>(easymotion-prefix)al <Plug>(easymotion-bd-jk)
    map <Plug>(easymotion-prefix)an <Plug>(easymotion-bd-n)
endfunction
