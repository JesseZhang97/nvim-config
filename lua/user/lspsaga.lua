local status, saga = pcall(require, 'lspsaga')
if not status then
  return
end

saga.init_lsp_saga({
  server_filetype_map = {},
})

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<C-j>', '<CMD>Lspsaga diagnostic_jump_next<CR>', opts)
vim.keymap.set('n', '<C-k>', function()
  require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set('n', 'gh', '<CMD>Lspsaga hover_doc<CR>', opts)
vim.keymap.set('n', 'gd', '<CMD>Lspsaga lsp_finder<CR>', opts)
vim.keymap.set('n', 'gp', '<CMD>Lspsaga peek_definition<CR>', opts)
vim.keymap.set('n', 'gr', '<CMD>Lspsaga rename<CR>', opts)
vim.keymap.set({ 'n', 'v' }, '<leader>ca', '<cmd>Lspsaga code_action<CR>', opts)

vim.keymap.set('n', '[e', function()
  require('lspsaga.diagnostic').goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set('n', ']e', function()
  require('lspsaga.diagnostic').goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
