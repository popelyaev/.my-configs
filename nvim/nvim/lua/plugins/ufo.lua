return {
	"kevinhwang91/nvim-ufo",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		-- Включаем фолдинг
		-- vim.o.foldcolumn = "1" -- Показывать колонку фолдов
		vim.o.foldlevel = 99 -- Открывать файлы полностью развернутыми
		vim.o.foldlevelstart = 99 -- То же самое
		vim.o.foldenable = true -- Включить фолдинг

		-- Настройка nvim-ufo
		local ufo = require("ufo")
		ufo.setup({
			provider_selector = function(_, _, _)
				return { "indent" } -- Использует LSP и отступы
			end,
		})
	end,
}
