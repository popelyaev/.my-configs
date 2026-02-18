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
		-- lazy = false,
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
				},
			})
		end,
	},
{
    "neovim/nvim-lspconfig",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- Список серверов и их параметры
        local servers = {
            basedpyright = {},
            lua_ls = {},
            powershell_es = {},
            intelephense = {},
            ts_ls = {},
            eslint = {},
            cssls = {},
            jsonls = {},
            html = {
                filetypes = { "html", "php" },
            },
            emmet_language_server = {
                filetypes = { "html", "php", "somesass_ls" },
            },
        }

        -- Регистрируем конфигурации
        for name, config in pairs(servers) do
            config.capabilities = capabilities
            vim.lsp.config[name] = config
        end

        -- Включаем все LSP
        for name, _ in pairs(servers) do
            vim.lsp.enable(name)
        end

        -- Горячие клавиши
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover info" })
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
    end,
}
}
