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
  'sainnhe/everforest',
  -- lsp
  'neovim/nvim-lspconfig',
  'glepnir/lspsaga.nvim',
  'williamboman/mason.nvim',
  'williamboman/mason-lspconfig.nvim',

  -- cmp
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
    dependencies = {
      'JoosepAlviste/nvim-ts-context-commentstring',
    },
  },

  'nvim-telescope/telescope.nvim',
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  },

  'debugloop/telescope-undo.nvim',
  'kyazdani42/nvim-web-devicons',
  'nvim-lualine/lualine.nvim',
  'norcalli/nvim-colorizer.lua',
  'jose-elias-alvarez/null-ls.nvim',
  'MunifTanjim/prettier.nvim',
  'joechrisellis/lsp-format-modifications.nvim',
  'kylechui/nvim-surround',
  'max397574/better-escape.nvim',
  'windwp/nvim-ts-autotag',
  'windwp/nvim-autopairs',
  'lukas-reineke/indent-blankline.nvim',
  'lewis6991/gitsigns.nvim',
  'dinhhuy258/git.nvim',
  'numToStr/Comment.nvim',
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
  -- stylua: ignore
  keys = {
    { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
    { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  },

  -- switch input method
  'keaising/im-select.nvim',

  -- misc
  {
    'rmagatti/alternate-toggler',
    config = function()
      require('alternate-toggler').setup({
        alternates = {
          ['=='] = '!=',
        },
      })
      vim.keymap.set(
        'n',
        '<leader><space>', -- <space><space>
        "<cmd>lua require('alternate-toggler').toggleAlternate()<CR>"
      )
    end,
    event = { 'BufReadPost' }, -- lazy load after reading a buffer
  },
  -- copilot
  -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   enent = 'InsertEnter',
  --   config = function()
  --     require('copilot').setup({
  --       suggestion = { enabled = false },
  --       panel = { enabled = false },
  --     })
  --   end,
  -- },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   dependencies = { 'copilot.lua' },
  --   config = function()
  --     require('copilot_cmp').setup()
  --   end,
  -- },
})
