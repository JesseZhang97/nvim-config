-- ENTRY OF ALL CONFIG FILES --

-- basic --
require('user.plugins')
require('user.options')
require('user.keymaps')
require('user.colorscheme')
-- require('user.autocmd')

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
-- UI --
require('user.colorizer')

-- edit tools --
require('user.surround')
require('user.indentline')
require('nvim-autopairs').setup({})
require('nvim-ts-autotag').setup({})
require('Comment').setup()

-- project management --
require('user.gitsigns')
require('user.git')

-- misc --
require('better_escape').setup({})
require('user.imselect')
