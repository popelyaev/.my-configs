local f = require("functions.functions")

vim.keymap.set("n", "<leader>gf", function()
	require("conform").format({ async = true })
end)
-- Вызов explore
vim.keymap.set("n", "<leader>E", ":Explore <CR>", {})

vim.keymap.set("n", "<leader>e", ":Neotree toggle <CR>", {})

vim.keymap.set("n", "<leader>a", ":Alpha<CR>", {})

vim.keymap.set("n", "<leader>dd", ":%bd|e#|bd# <CR>", {})

-- изменяет пенеос строк если они выходят за пределы nvim
vim.keymap.set("n", "<leader>tw", ":set wrap! linebreak!<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>as", f.toggleAutoSave, { noremap = true, silent = true })

-- telescope открыть окно с последними файлами
vim.keymap.set("n", "<leader>fr", require("telescope.builtin").oldfiles)
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").live_grep)
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers)
vim.keymap.set("n", "<leader>fh", require("telescope.builtin").help_tags)
vim.keymap.set("n", "<leader>fc", require("telescope.builtin").registers)
vim.keymap.set("n", "<leader>fm", require("telescope.builtin").marks)

-- Отключение выделения текста после поиска
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", { noremap = true, silent = true })

-- Переключение между окнами
vim.keymap.set("n", "<leader>v", "<C-w>v", opts) -- split window vertically
vim.keymap.set("n", "<leader>h", "<C-w>s", opts) -- split window horizontally
vim.keymap.set("n", "<leader>se", "<C-w>=", opts) -- make split windows equal width & height
vim.keymap.set("n", "<leader>xs", ":close<CR>", opts) -- close current split window

-- Изменение размера окна
vim.keymap.set("n", "<Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<Right>", ":vertical resize +2<CR>", opts)

--Переключение табов
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { noremap = true, silent = true })

-- Закрытие таба
vim.keymap.set("n", "<leader>bd", ":bd<CR>", { noremap = true, silent = true })

--  Перемещение выделенной строки вверх \ вниз
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
