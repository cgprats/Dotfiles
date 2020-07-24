" Neovim Configuration
set cursorline
set showcmd
set showmatch
set wildmenu
set incsearch
set hlsearch
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
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif 
" Plugins
" Run :PlugInstall to Install and :PlugUpdate to Update
call plug#begin()
Plug 'neomake/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'airodactyl/neovim-ranger'
Plug 'ayu-theme/ayu-vim'
Plug 'junegunn/fzf'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'sheerun/vim-polyglot'
Plug 'wellle/context.vim'
call plug#end()
" Plugin Configuration
" neomake
call neomake#configure#automake('nrwi', 500)
let g:neomake_open_list = 2
" deoplete
" deoplete requires installation of pynvim using pip3. Run "pip3 install --user pynvim"
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tmuxline#enabled = 1
" vim-airline && vim-airline-themes
let g:airline_powerline_fonts = 1
" neovim-ranger
nnoremap <f9> :tabe %:p:h<cr>
" ctrlpvim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
" vim-moonfly-colors
colorscheme ayu
let ayucolor="dark"
