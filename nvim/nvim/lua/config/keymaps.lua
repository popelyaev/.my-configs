vim.g.mapleader = " "

vim.keymap.set("n", "<leader>E", ":Ex <CR>", {})
-- neo-tree --
vim.keymap.set("n", "<leader>e", ":Neotree toggle <CR>", {})
vim.keymap.set("n", "<leader>a", ":Alpha<CR>", {})

vim.keymap.set("n", "<leader>dd", ":%bd|e#|bd# <CR>", {})

-- main --
-- vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>tw", ":set wrap! linebreak!<CR>", { noremap = true, silent = true })

local auto_save = false

function ToggleAutoSave()
	if auto_save then
		vim.api.nvim_del_augroup_by_name("AutoSaveGroup")
		auto_save = false
		print("🔴 Автосохранение выключено")
	else
		vim.api.nvim_create_augroup("AutoSaveGroup", { clear = true })
		vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
			group = "AutoSaveGroup",
			pattern = "*",
			command = "silent! write",
		})
		auto_save = true
		print("🟢 Автосохранение включено")
	end
end

vim.keymap.set("n", "<leader>as", ToggleAutoSave, { noremap = true, silent = true })
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Window management
vim.keymap.set('n', '<leader>v', '<C-w>v', opts) -- split window vertically
vim.keymap.set('n', '<leader>h', '<C-w>s', opts) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', opts) -- make split windows equal width & height
vim.keymap.set('n', '<leader>xs', ':close<CR>', opts) -- close current split window

-- Resize with arrows
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
