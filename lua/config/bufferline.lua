require("bufferline").setup{
	options = {
		offsets = {
			{ filetype = "neo-tree", text = "", padding = 1 },
		},
		indicator = {
			icon = '',
			style = 'highlight',
		},
		separator_style = 'slope',
		diagnostics = "nvim_lsp",
		always_show_bufferline = true,
		color_icons = true,
		truncate_names = true,
		show_buffer_close_icons = false,
		show_close_icon = false,
		max_name_length = 14,
		max_prefix_length = 13,
		tab_size = 20,
	},
}
