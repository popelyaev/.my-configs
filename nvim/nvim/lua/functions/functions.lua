local state = require("config.state")
local icons = require("config.icons")

M = {}
-- Функция включения автосохранения файлов

function M.toggleAutoSave()
	if state.auto_save then
	vim.api.nvim_del_augroup_by_name("AutoSaveGroup")
		state.auto_save = false
		print(icons.unsave .. " Автосохранение выключено.")
	else
		vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true })
		vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
			group = "AutoSaveGroup",
			pattern = "*",
			command = "silent! write",
		})
		state.auto_save = true
		print(icons.save .. " Автосохранение включено.")
	end
end

return M
