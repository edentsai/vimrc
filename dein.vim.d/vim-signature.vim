" https://github.com/kshenoy/vim-signature
"
" Plugin to toggle, display and navigate marks
"
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
