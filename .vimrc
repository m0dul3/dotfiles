""""""""""""""""
""""vim plugin""
""""""""""""""""

"""nerd tree
"let NERDTreeWinPos="right"
nmap <F2> :NERDTreeToggle  <CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"""tagbar
nmap <F8> :TagbarToggle<CR>

"""syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_args = " --load-plugins pylint_flask -r n "

"""plugin manager
execute pathogen#infect()

""""""""""""""""""""""""
""" non-Plugin stuff """
""""""""""""""""""""""""

"""line num, aotoindent, tab, space
set nu si sr et sw=4 ts=4 sts=4 

"""filetype detect, highlight
filetype on
filetype plugin indent on
syntax on

"""encoding
set enc=utf-8
set fenc=utf-8
set fencs=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"""set color
set bg=dark

"""let 256 color works in tmux
"if exists('$TMUX')
"    set term=screen-256color
"endif


