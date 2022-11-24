local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  })
  print('Installing packer close and reopen Neovim...')
  vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init({
  display = {
    open_fn = function()
      return require('packer.util').float({ border = 'rounded' })
    end,
  },
})

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use('wbthomason/packer.nvim') -- Have packer manage itself
  use('nvim-lua/plenary.nvim')
  use('lewis6991/impatient.nvim')
  -- Colorschemes
  use('sainnhe/everforest')

  use('neovim/nvim-lspconfig')
  use('glepnir/lspsaga.nvim')
  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')

  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('hrsh7th/cmp-cmdline')
  use('saadparwaiz1/cmp_luasnip')
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  use('nvim-telescope/telescope.nvim')
  use({ 'nvim-telescope/telescope-file-browser.nvim' })

  use('kyazdani42/nvim-web-devicons')
  use('nvim-lualine/lualine.nvim')
  use('akinsho/bufferline.nvim')
  use('JoosepAlviste/nvim-ts-context-commentstring')
  use('norcalli/nvim-colorizer.lua')
  use('jose-elias-alvarez/null-ls.nvim')
  use('windwp/nvim-ts-autotag')
  use('MunifTanjim/prettier.nvim')
  use('lewis6991/gitsigns.nvim')
  use('dinhhuy258/git.nvim')
  use('joechrisellis/lsp-format-modifications.nvim')
  use('famiu/bufdelete.nvim')
  use('stevearc/dressing.nvim')
  use('numToStr/Comment.nvim')
  use('kylechui/nvim-surround')
  use('gennaro-tedesco/nvim-peekup')
  use('max397574/better-escape.nvim')
  use('windwp/nvim-autopairs')
  use('folke/lsp-colors.nvim')
  use('lukas-reineke/indent-blankline.nvim')
  use('folke/todo-comments.nvim')
  use('ggandor/leap.nvim')
  use('ggandor/flit.nvim')

  use({
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)
