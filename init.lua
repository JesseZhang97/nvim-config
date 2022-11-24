require('dressing')
require('impatient')
require('bufdelete')

require('better_escape').setup({})
require('nvim-autopairs').setup({})
require('flit').setup({})
require('leap').add_default_mappings()

require('user.options')
require('user.colorscheme')
require('user.keymaps')
require('user.plugins')
require('user.lsp')
require('user.cmp')
require('user.snip')
require('user.telescope')
require('user.treesitter')
-- require('user.dashboard')
require('user.lualine')
-- require('user.bufferline')
require('user.colorizer')
require('user.lspsaga')
require('user.null-ls')
require('user.prettier')
require('user.gitsigns')
require('user.git')
require('user.mason')
require('user.comment')
require('user.surround')
require('user.lsp-colors')
require('user.indentline')
require('user.todo-comments')
