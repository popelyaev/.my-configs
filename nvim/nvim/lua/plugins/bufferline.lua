return {
	"akinsho/bufferline.nvim",
	dependencies = {
		"moll/vim-bbye",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		icons = {
			cross = "󱎘",
			modified = "󰆓",
            left = "",
            right = "",
            separator = "│",
		}
		require("bufferline").setup({
			options = {
				mode = "buffers", -- set to "tabs" to only show tabpages instead
				themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
				numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
				close_command = "Bdelete! %d", -- can be a string | function, see "Mouse actions"
				buffer_close_icon = icons.cross,
				close_icon = icons.cross,
				path_components = 2, -- Show only the file name without the directory
				modified_icon = icons.modified,
				left_trunc_marker = icons.left,
				right_trunc_marker = icons.right,
				max_name_length = 30,
				max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
				tab_size = 25,
				diagnostics = false,
				diagnostics_update_in_insert = false,
				color_icons = true,
				show_buffer_icons = true,
				show_buffer_close_icons = true,
				show_close_icon = true,
				persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
				separator_style = { icons.separator, icons.separator }, -- | "thick" | "thin" | { 'any', 'any' },
				enforce_regular_tabs = true,
				always_show_bufferline = true,
				show_tab_indicators = false,
				indicator = {
					-- icon = '▎', -- this should be omitted if indicator style is not 'icon'
					style = "none", -- Options: 'icon', 'underline', 'none'
				},
				icon_pinned = "󰐃",
				minimum_padding = 1,
				maximum_padding = 5,
				maximum_length = 15,
				sort_by = "insert_at_end",
			},
			highlights = {
				fill = {
					fg = "",
					bg = "none", -- Убирает фон под всей полосой bufferline
				},
				-- Цвет неактивного таба
				background = {
					fg = "",
					bg = "",
				},
				buffer_selected = {
					fg = "",
					bg = "none",
					bold = true,
					italic = false,
				},
				tab = {
					fg = "",
					bg = "",
				},
				tab_close = {
					fg = "",
					bg = "",
				},
				separator = {
					fg = "#434C5E",
				},
				-- separator_selected = {},
				-- tab_selected = {},
				-- background = {},
				-- indicator_selected = {},
				-- fill = {},
			},
		})
	end,
}
