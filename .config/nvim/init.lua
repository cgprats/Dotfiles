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
-- Automatically install Lazy and Plugins if missing --
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
	-- My plugins here
	'akinsho/bufferline.nvim',
	'Mofiqul/vscode.nvim',
	'nvim-lualine/lualine.nvim',
	'nvim-tree/nvim-tree.lua',
	'nvim-tree/nvim-web-devicons',
	{
		'nvim-treesitter/nvim-treesitter', build = ":TSUpdate"
	},
	'nvim-treesitter/nvim-treesitter-context',
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
})
-- LSP-Zero --
local lsp_zero = require('lsp-zero')

lsp_zero.on_attach(function(client, bufnr)
	-- see :help lsp-zero-keybindings
	-- to learn the available actions
	lsp_zero.default_keymaps({buffer = bufnr})
end)

-- to learn how to use mason.nvim
-- read this: https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/guide/integrate-with-mason-nvim.md
require('mason').setup({})
require('mason-lspconfig').setup({
	-- Set list of LSP servers to be installed. More can also be installed using :LspInstall --
	ensure_installed = { "lua_ls", "rust_analyzer", "clangd" },
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({})
		end,
	},
	automatic_installation = true,
})

-- Nvim Treesitter --
require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	auto_install = true;
	highlight = {
		enable = true
	}
}

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
	}
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
