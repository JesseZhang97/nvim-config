local config_status_ok, nvim_tree = pcall(require, 'nvim-tree')

if not config_status_ok then
  return
end

nvim_tree.setup({
  view = {
    width = 30,
    side = 'right',
    float = {
      enable = true,
      open_win_config = {
        relative = 'editor',
        border = 'rounded',
        width = 30,
        height = 40,
        row = 1,
        col = 1,
      },
    },
  },
})

vim.keymap.set('n', 'sf', '<CMD>NvimTreeToggle<CR>')
