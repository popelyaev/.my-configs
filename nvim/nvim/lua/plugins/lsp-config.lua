return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		opts = {
			auto_install = true,
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"ts_ls",
					"emmet_language_server",
					"cssls",
					"somesass_ls",
					"html",
					"jsonls",
					"powershell_es",
					"intelephense",
					"basedpyright",
					"tailwindcss",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local servers = {
				lua_ls = {},
				ts_ls = {},
				emmet_language_server = {},
				cssls = {},
				somesass_ls = {},
				html = {},
				jsonls = {},
				powershell_es = {},
				intelephense = {},
				basedpyright = {},
				tailwindcss = {},
			}

			for name, config in pairs(servers) do
				config.capabilities = capabilities
				vim.lsp.config(name, config)
				vim.lsp.enable(name)
			end

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
			vim.keymap.set("n", "<leader>K", vim.diagnostic.open_float, { desc = "Show error" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
			vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Find References" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		end,
	},
}
