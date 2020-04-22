call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sensible'
Plug 'saltstack/salt-vim'
Plug 'sheerun/vim-polyglot'
" install with: python3* install.py --ts-completer for js support (python
" support built-in) only works with a compiled version of vim with the flag --enable-python3interp=yes
Plug 'ycm-core/YouCompleteMe'
call plug#end()
set mouse-=a
nnoremap n nzzzv
nnoremap N Nzzzv
set nu
set encoding=utf-8
set history=100
set noswapfile
syntax on
set background=dark
colorscheme gruvbox
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('md', 'white', 'none', 'white', '#afaf87')
call NERDTreeHighlightFile('spec', 'white', 'none', 'white', '#afaf87')
call NERDTreeHighlightFile('txt', 'white', 'none', 'white', '#afaf87')
call NERDTreeHighlightFile('py', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('lua', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('go', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('rb', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('sh', 'green', 'none', '#afd75f', '#151515')
nnoremap <C-a>     :tabprevious<CR>
nnoremap <C-p>     :tabnext<CR>
set expandtab
set tabstop=2
set shiftwidth=2
inoremap {<CR> {<CR>}<C-o>O
set termguicolors
let g:ycm_autoclose_preview_window_after_completion = 1
