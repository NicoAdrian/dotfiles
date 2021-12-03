call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-sensible'
Plug 'saltstack/salt-vim'
Plug 'sheerun/vim-polyglot'
"Plug 'fatih/vim-go'
" install with: python3* install.py --ts-completer for js support (python
" support built-in) only works with a compiled version of vim with the flag --enable-python3interp=yes
Plug 'ycm-core/YouCompleteMe'
Plug 'NicoAdrian/vim-monokai-pro'
call plug#end()
set nocompatible
set mouse-=a
nnoremap n nzzzv
nnoremap N Nzzzv
set nu
set encoding=utf-8
set history=1000
set noswapfile
syntax on
set background=dark
set termguicolors
colors monokai_pro
"map <C-n> :NERDTreeToggle<CR>
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nnoremap <C-a>     :tabnext<CR>
set expandtab
set tabstop=2
set shiftwidth=2
inoremap {<CR> {<CR>}<C-o>O
inoremap (<CR> (<CR>)<C-o>O
inoremap [<CR> [<CR>]<C-o>O
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:black_linelength = 120
"nnoremap <F1> :Black<CR>
" wsl only, not needed in windows terminal
"set t_ut=""
"if (&term =~ '^xterm' && &t_Co == 256)
"  set t_ut= | set ttyscroll=1
"endif
" needed to change cursor in vim wsl
let &t_SI.="\e[5 q"
let &t_SR.="\e[4 q"
let &t_EI.="\e[1 q"
"let g:go_highlight_structs = 1
"let g:go_highlight_methods = 1
"let g:go_highlight_functions = 1
"let g:go_highlight_operators = 1
"let g:go_highlight_build_constraints = 1
set visualbell
set t_vb=
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0
