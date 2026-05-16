return {
	"brenoprata10/nvim-highlight-colors",

	config = function()
		vim.opt.termguicolors = true
		require("nvim-highlight-colors").setup({
			render = "background", -- 'background'|'foreground'|'virtual'
			virtual_symbol = "■",
			enable_tailwind = true,
			enable_named_colors = true,
		})
	end,
}
