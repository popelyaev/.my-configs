return {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,                 -- обязательно отключаем ленивую загрузку
    build = ':TSUpdate',
    config = function()
        -- 1. Устанавливаем парсеры (добавьте 'tsx')
        require('nvim-treesitter').install({
            "javascript",
            "typescript",
            "tsx",      -- необходим для JSX/TSX
            "html",
            "css",
            "json"
        })

        -- 2. ВКЛЮЧАЕМ ПОДСВЕТКУ: эта автокоманда включает treesitter для всех буферов
        vim.api.nvim_create_autocmd('FileType', {
            callback = function(args)
                -- Определяем язык парсера (например, 'tsx' для файлов .tsx/.jsx)
                local lang = vim.treesitter.language.get_lang(args.match)
                if lang then
                    -- Запускаем Treesitter для буфера
                    pcall(vim.treesitter.start, args.buf, lang)
                end
            end,
        })

        -- 3. ОПЦИОНАЛЬНО: Регистрируем 'jsx' как алиас для 'tsx', если нужно
        -- (обычно не требуется, но на всякий случай)
        -- vim.treesitter.language.register('tsx', 'jsx')
    end,
}

