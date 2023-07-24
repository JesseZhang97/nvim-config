local status, ts = pcall(require, 'nvim-treesitter.configs')
if not status then
  return
end

ts.setup({
  ensure_installed = {
    'markdown',
    'markdown_inline',
    'tsx',
    'typescript',
    'lua',
    'json',
    'graphql',
    'rust',
    'javascript',
    'html',
    'css',
  },
  autotag = {
    enable = true,
  },
  cotext_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  sync_install = true,
  auto_install = true,
  highlight = {
    enable = true,
    disable = {},
  },
})
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript.tsx' }
