-- ENTRY OF ALL CONFIG FILES --

-- basic --
require('user.plugins')
require('user.options')
require('user.keymaps')
require('user.colorscheme')

-- lsp & cmp --
require('user.lsp')
require('user.cmp')
require('user.snip')
require('user.treesitter')
require('user.mason')
require('user.lualine')
require('user.lspsaga')
require('user.null-ls')
require('user.prettier')
require('user.telescope')
--
-- require('user.nvim-tree')
-- UI --
require('user.colorizer')
require('dressing')
require('bufdelete')
require('user.bufferline')

-- edit tools --
require('user.comment')
require('user.surround')
require('user.indentline')
require('nvim-autopairs').setup({})

-- project management --
require('user.autosession')
require('user.todo-comments')
require('user.gitsigns')
require('user.git')
-- require('user.neo-tree')

-- misc --
require('impatient')
require('better_escape').setup({})
require('flit').setup({})
require('leap').add_default_mappings()
