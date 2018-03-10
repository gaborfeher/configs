" set t_Co=256

" for native Ubuntu terminals:
colorscheme torte
" for WSL/Ubuntu terminals:
" colorscheme ron

" highlight torte ctermbg=none

syntax on

set guifont=Monospace\ 11

" Strip trainling spaces in files of certain types
autocmd FileType c,h,cc,java,json autocmd BufWritePre <buffer> :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))

" Make tab completion sane (bash-like instead of windows-like)
set wildmode=longest,list
set wildmenu

" F4 switches between cc and h files
map <F4> :e %:p:s,.h$,.X123X,:s,.cc$,.h,:s,.X123X$,.cc,<CR>

" Tab completion the way I like
set expandtab
set softtabstop=2
set shiftwidth=2

" Paint characters after column 80 red: \%>80v.\+
" Paint trailing whitespace: \s\+$'
match ErrorMsg '\%>80v.\+\|\s\+$'

" Disable beeping and screen flashing:
set visualbell
set t_vb=
