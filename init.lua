local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

return require('lazy').setup({
	{"goolord/alpha-nvim", config = function() require("config.alpha") end},
	{"nvim-neo-tree/neo-tree.nvim", config = function() require("config.neotree") end, branch = "v2.x",
		dependencies = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"},
	},
	{"rmehri01/onenord.nvim", config = function() vim.cmd "colorscheme onenord" end},
	{"nvim-lualine/lualine.nvim", config = function() require("config.lualine") end,
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{"akinsho/bufferline.nvim", config = function() require("config.bufferline") end,
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	"tpope/vim-commentary",
	{"windwp/nvim-autopairs", config = function() require("config.autopairs") end},
	{"nvim-telescope/telescope.nvim", config = function() require("config.telescope") end},
	{"nvim-treesitter/nvim-treesitter", config = function() require("config.treesitter") end, build = ":TSUpdate"},
	{"akinsho/toggleterm.nvim", config = function() require("config.toggleterm") end},
	{"folke/which-key.nvim", config = function() require("config.whichkey") end},
	{"folke/noice.nvim", config = function() require("config.noice") end,
		dependencies = {"MunifTanjim/nui.nvim", "rcarriga/nvim-notify"},
	},

	{"hrsh7th/nvim-cmp", config = function() require "config.cmp" end},
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"saadparwaiz1/cmp_luasnip",
	"hrsh7th/cmp-nvim-lsp",

	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",

	{"neovim/nvim-lspconfig", config = function() require "lsp" end},
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"gbrlsnchs/telescope-lsp-handlers.nvim",

	{"tpope/vim-dadbod", config = function() require("db") end},
	{"kristijanhusak/vim-dadbod-ui"},
})
