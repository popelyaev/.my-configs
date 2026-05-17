-- Функция удаления внешнего тега (unwrap)
function unwrap_html()
  -- Получаем позиции визуального выделения
  local start_pos = vim.fn.getpos("'<")
  local end_pos   = vim.fn.getpos("'>")
  local start_line = start_pos[2]
  local end_line   = end_pos[2]

  -- Получаем выделенные строки
  local lines = vim.api.nvim_buf_get_lines(0, start_line-1, end_line, false)

  if #lines < 2 then
    print("Выделенный блок слишком маленький для unwrap")
    return
  end

  -- Удаляем первый и последний тег (открывающий и закрывающий)
  table.remove(lines, 1)
  table.remove(lines, #lines)

  -- Убираем один уровень таба/пробела у внутренних строк
  local shiftwidth = vim.api.nvim_buf_get_option(0, "shiftwidth")
  local expandtab  = vim.api.nvim_buf_get_option(0, "expandtab")
  local tab_str
  if expandtab then
    tab_str = string.rep(" ", shiftwidth)
  else
    tab_str = "\t"
  end

  for i = 1, #lines do
    if lines[i]:sub(1, #tab_str) == tab_str then
      lines[i] = lines[i]:sub(#tab_str+1)
    end
  end

  -- Вставляем обратно в буфер
  vim.api.nvim_buf_set_lines(0, start_line-1, end_line, false, lines)

  -- Перемещаем курсор на начало блока
  vim.api.nvim_win_set_cursor(0, {start_line, 0})
end

vim.api.nvim_create_user_command("UnwrapTag", unwrap_html, { range = true })

