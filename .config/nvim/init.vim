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
set colorcolumn=80
set list listchars=tab:\│\ ,trail:-,extends:>,precedes:<,nbsp:+
let &showbreak = '↪'
syntax on
filetype indent on
set number
set termguicolors
set background=dark
set clipboard=unnamedplus
set encoding=UTF-8
set inccommand=nosplit
set signcolumn=yes
set updatetime=500
nnoremap <C-t>     :tabnew<CR>
inoremap <C-t>     <Esc>:tabnew<CR>
nnoremap <F5>      :make<CR>
inoremap <F5>      <Esc>:make<CR>
nnoremap <C-n>     :NERDTreeToggle<CR>
map <F7> =G
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Plugins
" Automatically install vim-plug if missing
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Automatically install missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" Run :PlugInstall to Install and :PlugUpdate to Update
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'wellle/context.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'tomasiser/vim-code-dark'
call plug#end()

" coc
let g:coc_global_extensions=[ 'coc-clangd', 'coc-git', 'coc-highlight', 'coc-java', 'coc-json', 'coc-omnisharp', 'coc-pyright', 'coc-sh', 'coc-spell-checker', 'coc-tsserver', 'coc-yank' ]
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" nvim-treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	highlight = {
		enable = true,
	},
}
EOF

" vim-airline && vim-airline-themes
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#coc#enabled = 1
let g:airline_theme = 'codedark'

" color scheme
colorscheme codedark
