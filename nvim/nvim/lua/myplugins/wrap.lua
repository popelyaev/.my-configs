local M = {}
-- Функция обертывания выделенного HTML-блока с реальным таб-отступом
function M.wrap_html()
  local input_tag = vim.fn.input("Enter tag (например div.wrapper, div#id, div#id.wrapper): ")
  if input_tag == "" then return end

  -- Разбор ввода
  local tag, id, class = input_tag:match("^([%w%-]+)#([%w%-%_]+)%.([%w%-%_]+)$")   -- div#id.class
  if not tag then
    tag, id = input_tag:match("^([%w%-]+)#([%w%-%_]+)$")                          -- div#id
  end
  if not tag then
    tag, class = input_tag:match("^([%w%-]+)%.([%w%-%_]+)$")                     -- div.class
  end
  if not tag then
    tag = input_tag                                                           -- просто тег
  end

  -- Получаем позиции визуального выделения
  local start_pos = vim.fn.getpos("'<")
  local end_pos   = vim.fn.getpos("'>")
  local start_line = start_pos[2]
  local end_line   = end_pos[2]

  -- Получаем выделенные строки
  local lines = vim.api.nvim_buf_get_lines(0, start_line-1, end_line, false)

  -- Определяем отступ (по первой строке)
  local indent = lines[1]:match("^%s*") or ""

  -- Получаем реальный таб отступ из настроек Neovim
  local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
  local expandtab  = vim.api.nvim_buf_get_option(0, "expandtab")
  local tab_str
  if expandtab then
    tab_str = string.rep(" ", shiftwidth)
  else
    tab_str = "\t"
  end

  -- Сдвигаем все внутренние строки на один уровень внутрь
  for i = 1, #lines do
    lines[i] = tab_str .. lines[i]
  end

  -- Формируем открывающий тег
  local open_tag = "<" .. tag
  if id then
    open_tag = open_tag .. ' id="' .. id .. '"'
  end
  if class then
    open_tag = open_tag .. ' class="' .. class .. '"'
  end
  open_tag = open_tag .. ">"

  -- Добавляем открывающий и закрывающий тег
  table.insert(lines, 1, indent .. open_tag)
  table.insert(lines, indent .. "</" .. tag .. ">")

  -- Вставляем обратно в буфер
  vim.api.nvim_buf_set_lines(0, start_line-1, end_line, false, lines)

  -- Перемещаем курсор на начало блока
  vim.api.nvim_win_set_cursor(0, {start_line, 0})
end

return M
