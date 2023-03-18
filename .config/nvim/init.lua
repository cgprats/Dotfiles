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
vim.opt.spell = true
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
	use 'akinsho/bufferline.nvim'
	use 'Mofiqul/vscode.nvim'
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},
			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'}
		}
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

-- Nvim Treesitter --
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	auto_install = true;
	highlight = {
		enable = true
	}
}

-- LSP-Zero --
local lsp = require('lsp-zero').preset({'recommended'})
lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)
require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
lsp.setup()

-- CMP --
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
	mapping = {
		-- confirm selection
		['<CR>'] = cmp.mapping.confirm({select = false}),
		['<C-y>'] = cmp.mapping.confirm({select = false}),
    
		-- navigate items on the list
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),
    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

		-- scroll up and down in the completion documentation
    ['<C-f>'] = cmp.mapping.scroll_docs(5),
    ['<C-u>'] = cmp.mapping.scroll_docs(-5),

})

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
local c = require('vscode.colors').get_colors()
require('vscode').setup({
	change_style = "dark",
	italic_comments = true,
	disable_nvimtree_bg = true
})
require('vscode').load()

-- Lualine --
require('lualine').setup({
	options = {
		theme = 'vscode',
		extensions = {'nvim-tree'},
		sources = {'nvim_diagnostic', 'nvim_lsp'}
	}
})

-- Bufferline --
require("bufferline").setup({
	options = {
		mode = "buffers",
		diagnostics = "nvim_lsp"
	}
})
