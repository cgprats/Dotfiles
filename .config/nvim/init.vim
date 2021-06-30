" Neovim Configuration
set cursorline
set showcmd
set showmatch
set wildmenu
set incsearch
set nohlsearch
set smartcase
set lazyredraw
set ttyfast
set linebreak
set scrolloff=3
set mouse=a
set autoread
set history=1000
set list listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
let &showbreak = '↪'
syntax on
filetype indent on
set number
set termguicolors
set background=dark
set clipboard=unnamedplus
set encoding=UTF-8
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <F5>      :make<CR>
inoremap <F5>      <Esc>:make<CR>
nnoremap <C-n>     :NERDTreeToggle<CR>
map <F7> =G
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Plugins
" Run :PlugInstall to Install and :PlugUpdate to Update
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'artur-shaik/vim-javacomplete2'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'wellle/context.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'chrisbra/changesPlugin'
Plug 'machakann/vim-highlightedyank'
Plug 'ayu-theme/ayu-vim'
call plug#end()

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" vim-javacomplete2
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" vim-airline && vim-airline-themes
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_theme = 'ayu_dark'

" color scheme
let ayucolor="dark"
colorscheme ayu
