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
" Automatically install packer and plugins if missing
lua << EOF
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'
  use {
	  'neoclide/coc.nvim',
	  branch = 'release'}
  use 'vim-airline/vim-airline'
  use 'vim-airline/vim-airline-themes'
  use 'preservim/nerdtree'
  use 'wellle/context.vim'
  use 'ryanoasis/vim-devicons'
  use {
	  'nvim-treesitter/nvim-treesitter',
	  run = function()
	    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	    ts_update()
	  end,
  }
  use 'tomasiser/vim-code-dark'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
EOF

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
