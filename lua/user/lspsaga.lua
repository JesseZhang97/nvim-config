local status, saga = pcall(require, 'lspsaga')
if not status then
  return
end

saga.setup({
  server_filetype_map = {},
  symbol_in_winbar = {
    enable = true,
    separator = '▸ ',
    hide_keyword = true,
    show_file = true,
    folder_level = 2,
    respect_root = false,
    color_mode = false,
  },
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<CMD>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<C-k>', function()
  require('lspsaga.diagnostic'):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set('n', 'K', '<CMD>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<CMD>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<CMD>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<CMD>Lspsaga rename<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)

vim.keymap.set('n', '[e', function()
  require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })

-- Show line diagnostics
vim.keymap.set('n', 'gl', '<cmd>Lspsaga show_line_diagnostics<CR>')

-- Show cursor diagnostics
vim.keymap.set('n', '<leader>sc', '<cmd>Lspsaga show_cursor_diagnostics<CR>')
-- Show buffer diagnostics
vim.keymap.set('n', '<leader>sb', '<cmd>Lspsaga show_buf_diagnostics<CR>')

-- vim.keymap.set('n', ']e', function()
--   require('lspsaga.diagnostic'):goto_next({ severity = vim.diagnostic.severity.ERROR })
-- end, { silent = true })
