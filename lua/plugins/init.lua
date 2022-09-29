local status, packer = pcall(require, 'packer')
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'shaunsingh/nord.nvim'
  use 'EdenEast/nightfox.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = require('plugins.lualine'),
  }
  use {
    'windwp/nvim-autopairs',
    config = function() require('nvim-autopairs').setup() end
  }
  -- LSP --
  use {
    'williamboman/mason.nvim',
    config = function() require('mason').setup() end
  }
  use {
    'williamboman/mason-lspconfig.nvim',
    config = require('plugins.lspconfig'),
  }
  use 'neovim/nvim-lspconfig'

  -- CMP --
  use {
    'hrsh7th/nvim-cmp',
    config = require('plugins.completion'),
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use {
    'akinsho/bufferline.nvim', tag = "v2.*",
    config = function() require('bufferline').setup() end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
end)
