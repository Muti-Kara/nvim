local configs = require("nvim-treesitter.configs")

configs.setup {
	ensure_installed = {'lua', 'vim', 'regex', 'markdown', 'markdown_inline', 'python', 'cpp'},
	sync_install = false, 
	ignore_install = { "" },
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled
		additional_vim_regex_highlighting = true,
	},
	indent = { enable = true, disable = { "yaml" } },
	matchup = {
		enable = true,
	},
}
