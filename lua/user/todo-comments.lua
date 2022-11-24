local status_ok, todo = pcall(require, 'todo-comments')
if not status_ok then
  return
end

todo.setup({
  colors = {
    error = { 'DiagnosticError', 'ErrorMsg', '#eb9191' },
    warning = { 'DiagnosticWarning', 'WarningMsg', '#FBBF24' },
    info = { 'DiagnosticInfo', '#72eef2' },
    hint = { 'DiagnosticHint', '#daebe7' },
    default = { 'Identifier', '#7C3AED' },
    test = { 'Identifier', '#87f5b3' },
  },
})

vim.keymap.set('n', ']t', function()
  todo.jump_next()
end, { desc = 'Next todo comment' })

vim.keymap.set('n', '[t', function()
  todo.jump_prev()
end, { desc = 'Previous todo comment' })

-- You can also specify a list of valid jump keywords

vim.keymap.set('n', ']t', function()
  todo.jump_next({ keywords = { 'ERROR', 'WARNING' } })
end, { desc = 'Next error/warning todo comment' })
