_G.vim = vim

require("config.keymaps")
require("config.options")
require("config.lazy")

vim.cmd("colorscheme catppuccin-mocha")
-- vim.cmd("colorscheme tokyonight-night")

vim.api.nvim_create_user_command("HighlightNone", function()
	vim.cmd([[
    highlight Normal guibg=NONE ctermbg=NONE
    highlight NonText guibg=NONE ctermbg=NONE
    highlight EndOfBuffer guibg=NONE ctermbg=NONE
    highlight NormalNC guibg=NONE ctermbg=NONE
    highlight VertSplit guibg=NONE ctermbg=NONE
    highlight SignColumn guibg=NONE ctermbg=NONE
    highlight StatusLine guibg=NONE ctermbg=NONE
    highlight StatusLineNC guibg=NONE ctermbg=NONE
    highlight TabLine guibg=NONE ctermbg=NONE
    highlight TabLineFill guibg=NONE ctermbg=NONE
    highlight TabLineSel guibg=NONE ctermbg=NONE
    highlight WinSeparator guibg=NONE ctermbg=NONE
    autocmd ColorScheme * highlight Normal guibg=NONE ctermbg=NONE
    highlight NeoTreeNormal guibg=NONE ctermbg=NONE
    highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE
  ]])
end, {})

-- Глобальная переменная для отслеживания состояния
local is_transparent = true

-- Функция переключения
function ToggleTransparent()
	is_transparent = not is_transparent
	require("onedark").setup({
		style = "dark",
		transparent = is_transparent,
	})
	require("onedark").load()
end

-- Горячая клавиша (например, <leader>tt)
vim.keymap.set("n", "<leader>u", ToggleTransparent, { desc = "Toggle transparency" })

vim.cmd("HighlightNone")

-- local ts = vim.treesitter
--
-- local function extract_classes_ids()
-- 	local bufnr = vim.api.nvim_get_current_buf()
--
-- 	if vim.bo.filetype ~= "html" then
-- 		vim.notify("Not an HTML file", vim.log.levels.ERROR)
-- 		return
-- 	end
--
-- 	local parser = ts.get_parser(bufnr, "html")
-- 	local tree = parser:parse()[1]
-- 	local root = tree:root()
--
-- 	local query = ts.query.parse(
-- 		"html",
-- 		[[
-- 	   (attribute
-- 	     (attribute_name) @name
-- 	     (quoted_attribute_value (attribute_value) @value))
-- 	 ]]
-- 	)
--
-- 	local classes, ids = {}, {}
--
-- 	for id, node in query:iter_captures(root, bufnr, 0, -1) do
-- 		local capture = query.captures[id]
-- 		local text = ts.get_node_text(node, bufnr)
--
-- 		if capture == "name" then
-- 			last_name = text
-- 		elseif capture == "value" and last_name then
-- 			text = text:gsub('"', "")
--
-- 			if last_name == "class" then
-- 				for cls in text:gmatch("%S+") do
-- 					classes[cls] = true
-- 				end
-- 			elseif last_name == "id" then
-- 				ids[text] = true
-- 			end
--
-- 			last_name = nil
-- 		end
-- 	end
--
-- 	return classes, ids
-- end
--
-- local function generate_scss()
-- 	local classes, ids = extract_classes_ids()
-- 	if not classes then
-- 		return
-- 	end
--
-- 	local out = {}
--
-- 	table.insert(out, "// === IDs ===")
-- 	for id in pairs(ids) do
-- 		table.insert(out, "#" .. id .. " {")
-- 		table.insert(out, "}")
-- 		table.insert(out, "")
-- 	end
--
-- 	table.insert(out, "// === Classes ===")
-- 	for cls in pairs(classes) do
-- 		table.insert(out, "." .. cls .. " {")
-- 		table.insert(out, "}")
-- 		table.insert(out, "")
-- 	end
--
-- 	local text = table.concat(out, "\n")
--
-- 	-- Копируем в системный буфер
-- 	vim.fn.setreg("+", text)
--
-- 	vim.notify("SCSS copied to clipboard", vim.log.levels.INFO)
-- end
--
-- local function parse_bem(classes)
-- 	local blocks = {}
--
-- 	for class in pairs(classes) do
-- 		local block, element, modifier = class:match("^([%w%-]+)__([%w%-]+)%-%-([%w%-]+)$")
--
-- 		if block then
-- 			blocks[block] = blocks[block] or { elements = {}, modifiers = {} }
-- 			blocks[block].elements[element] = blocks[block].elements[element] or {}
-- 			blocks[block].elements[element][modifier] = true
-- 		else
-- 			block, element = class:match("^([%w%-]+)__([%w%-]+)$")
-- 			if block then
-- 				blocks[block] = blocks[block] or { elements = {}, modifiers = {} }
-- 				blocks[block].elements[element] = blocks[block].elements[element] or {}
-- 			else
-- 				block, modifier = class:match("^([%w%-]+)%-%-([%w%-]+)$")
-- 				if block then
-- 					blocks[block] = blocks[block] or { elements = {}, modifiers = {} }
-- 					blocks[block].modifiers[modifier] = true
-- 				else
-- 					blocks[class] = blocks[class] or { elements = {}, modifiers = {} }
-- 				end
-- 			end
-- 		end
-- 	end
--
-- 	return blocks
-- end
--
-- local function generate_bem_scss()
-- 	local classes = extract_classes_ids()
-- 	if not classes then
-- 		return
-- 	end
--
-- 	local bem = parse_bem(classes)
-- 	local out = {}
--
-- 	for block, data in pairs(bem) do
-- 		table.insert(out, "." .. block .. " {")
--
-- 		-- elements
-- 		for element, modifiers in pairs(data.elements) do
-- 			table.insert(out, "  &__" .. element .. " {")
--
-- 			for modifier in pairs(modifiers) do
-- 				table.insert(out, "    &--" .. modifier .. " {}")
-- 			end
--
-- 			table.insert(out, "  }")
-- 		end
--
-- 		-- block modifiers
-- 		for modifier in pairs(data.modifiers) do
-- 			table.insert(out, "  &--" .. modifier .. " {}")
-- 		end
--
-- 		table.insert(out, "}")
-- 		table.insert(out, "")
-- 	end
--
-- 	local text = table.concat(out, "\n")
-- 	vim.fn.setreg("+", text)
-- 	vim.notify("BEM SCSS copied to clipboard", vim.log.levels.INFO)
-- end
--
-- local wrap = require("myplugins.wrap")
-- local unwrap = require("myplugins.unwrap")
--
-- vim.api.nvim_create_user_command("ExtractScss", generate_scss, {})
-- vim.api.nvim_create_user_command("ExtractBemScss", generate_bem_scss, {})
--
-- vim.api.nvim_create_user_command("WrapTag", wrap.wrap_html, { range = true })
-- vim.api.nvim_create_user_command("UnwrapTag", unwrap.unwrap_html, { range = true })
--
-- vim.keymap.set("v", "<leader>w", ":WrapTag<CR>", { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>u", ":UnwrapTag<CR>", { noremap = true, silent = true })
--
-- vim.keymap.set("n", "<leader>cc", ":ExtractScss<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>cb", ":ExtractBemScss<CR>", { noremap = true, silent = true })
