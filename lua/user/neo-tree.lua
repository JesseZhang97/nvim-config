local status_ok, neotree = pcall(require, 'neo-tree')
if not status_ok then
  return
end

neotree.setup({})
vim.keymap.set('n', ';F', '<CMD>Neotree filesystem reveal right<CR>')
