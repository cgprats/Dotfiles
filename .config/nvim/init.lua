-- Vim Options --
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.cursorline = true
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.wildmenu = true
vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.smartcase = true
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.linebreak = true
vim.opt.scrolloff = 3
vim.opt.mouse = "a"
vim.opt.autoread = true
vim.opt.history = 1000
vim.opt.colorcolumn = "80"
vim.opt.listchars.tab = "|"
vim.opt.listchars.trail = "-"
vim.opt.listchars.extends = ">"
vim.opt.listchars.precedes = "<"
vim.opt.listchars.nbsp = "+"
vim.opt.showbreak = "↪"
vim.opt.syntax = "on"
vim.filetype.indent = true
vim.opt.number = true
vim.opt.termguicolors = on
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.encoding = "UTF-8"
vim.opt.inccommand = "nosplit"
vim.opt.signcolumn = "auto"
vim.opt.updatetime = 100
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = false
vim.api.nvim_set_keymap("n", "<C-t>", ":tabnew<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<C-t>", "<Esc>:tabnew<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F5>", ":make<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("i", "<F5>", "<Esc>:make<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<C-n>", ":NvimTreeToggle<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<F7>", "=G", {silent = true})

-- Plugins --
-- Automatically install Packer and Plugins if missing --
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

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- My plugins here
	use 'Mofiqul/vscode.nvim'
	use {
		'neoclide/coc.nvim',
		branch = 'release'
	}
	use 'nvim-lualine/lualine.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({with_sync = true})
			ts_update()
		end,
	}
	use 'nvim-treesitter/nvim-treesitter-context'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)

-- COC --
vim.g.coc_global_extensions = {
	'coc-clangd',
	'coc-git',
	'coc-highlight',
	'coc-java',
	'coc-json',
	'coc-omnisharp',
	'coc-pyright',
	'coc-sh',
	'coc-spell-checker',
	'coc-sumneko-lua',
	'coc-tsserver',
	'coc-yank'
}

local keyset = vim.keymap.set
-- COC Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
keyset("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
keyset("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- <C-g>u breaks current undo, please make your own choice
keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Nvim Tree --
require("nvim-tree").setup({
	diagnostics = {
		enable = true
	},
	git = {
		enable = true
	},
	renderer = {
		icons = {
			show = {
				git = true
			}
		}
	}
})

-- VSCode.nvim --
require('vscode').setup({
	change_style = "dark",
	disable_nvimtree_bg = true
})

-- Lualine --
require('lualine').setup({
	options = {
		theme = 'vscode',
		sources = {'nvim_diagnostic', 'coc'}
	}
})
