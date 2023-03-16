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
	use "wbthomason/packer.nvim"
	use {"goolord/alpha-nvim", config = function() require("config.alpha") end}
	use {"nvim-neo-tree/neo-tree.nvim", config = function() require("config.neotree") end, branch = "v2.x",
		requires = {"nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons", "MunifTanjim/nui.nvim"}
	}
	use {"rmehri01/onenord.nvim", config = function() vim.cmd "colorscheme onenord" end}
	use {"nvim-lualine/lualine.nvim", config = function() require("config.lualine") end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	}
	use {"akinsho/bufferline.nvim", config = function() require("config.bufferline") end, tag = "v3.*",
		requires = { "nvim-tree/nvim-web-devicons" },
	}
	use "tpope/vim-commentary"
	use {"windwp/nvim-autopairs", config = function() require("config.autopairs") end}
	use {"nvim-telescope/telescope.nvim", config = function() require("config.telescope") end}
	use {"nvim-treesitter/nvim-treesitter", config = function() require("config.treesitter") end, run = ":TSUpdate"}
	use {"akinsho/toggleterm.nvim", config = function() require("config.toggleterm") end}
	use {"folke/which-key.nvim", config = function() require("config.whichkey") end}


	use {"hrsh7th/nvim-cmp", config = function() require "config.cmp" end}
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "saadparwaiz1/cmp_luasnip"
	use "hrsh7th/cmp-nvim-lsp"
	use {"tzachar/cmp-tabnine", run = "./install.sh"}

	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"

	use {"neovim/nvim-lspconfig", config = function() require "lsp" end}
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use "gbrlsnchs/telescope-lsp-handlers.nvim"

	use {"tpope/vim-dadbod", config = function() require("db") end}
	use {"kristijanhusak/vim-dadbod-ui"}


	if packer_bootstrap then
		require('packer').sync()
	end
end)
