vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
vim.api.nvim_set_keymap("n", "<F12>", "<cmd>Neotree float toggle<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<F11>", "<cmd>Neotree float git_status<CR>", { noremap = true, silent = true })
require("neo-tree").setup({
	window = {
		mappings = {
			["<space>"] = { 
				"toggle_node", 
				nowait = false,
			},
			["h"] = "open_split",
			["v"] = "open_vsplit",
			["a"] = {
				"add",
				config = {
					show_path = "none"
				}
			},
			["A"] = "add_directory",
			["d"] = "delete",
			["r"] = "rename",
			["m"] = "move",
			["R"] = "refresh",
			["?"] = "show_help",
		}
	},
	filesystem = {
		filtered_items = {
			never_show = {
				"__pycache__",
			},
		},
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
				["H"] = "toggle_hidden",
				["f"] = "fuzzy_finder",
			}
		}
	},
	buffers = {
		window = {
			mappings = {
				["<bs>"] = "navigate_up",
				["."] = "set_root",
			}
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["<C-g>A"]  = "git_add_all",
				["<C-g>u"] = "git_unstage_file",
				["<C-g>a"] = "git_add_file",
				["<C-g>r"] = "git_revert_file",
				["<C-g>c"] = "git_commit",
				["<C-g>p"] = "git_push",
				["<C-g>g"] = "git_commit_and_push",
			}
		}
	}
})
