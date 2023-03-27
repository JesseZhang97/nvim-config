-- Automatically install lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  return
end

-- Install your plugins here
lazy.setup({
  -- My plugins here
  'nvim-lua/plenary.nvim',
  'lewis6991/impatient.nvim',
  -- Colorschemes
  'sainnhe/everforest',
  'shaunsingh/moonlight.nvim',

  'neovim/nvim-lspconfig',

  {
    'glepnir/lspsaga.nvim',
  },

  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  'hrsh7th/nvim-cmp',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },

  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },

  'kyazdani42/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'JoosepAlviste/nvim-ts-context-commentstring',
  'norcalli/nvim-colorizer.lua',
  'jose-elias-alvarez/null-ls.nvim',
  'windwp/nvim-ts-autotag',
  'MunifTanjim/prettier.nvim',
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  'joechrisellis/lsp-format-modifications.nvim',
  'famiu/bufdelete.nvim',
  'stevearc/dressing.nvim',
  'numToStr/Comment.nvim',
  'kylechui/nvim-surround',
  'gennaro-tedesco/nvim-peekup',
  'max397574/better-escape.nvim',
  'windwp/nvim-autopairs',
  'lukas-reineke/indent-blankline.nvim',
  'folke/todo-comments.nvim',
  'ggandor/leap.nvim',
  'ggandor/flit.nvim',
  'rmagatti/auto-session',

  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
  },

  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    enent = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    dependencies = { 'copilot.lua' },
    config = function()
      require('copilot_cmp').setup()
    end,
  },
})
