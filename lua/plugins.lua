local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- color theme
  use 'folke/tokyonight.nvim'
  -- icon
  use { 'nvim-tree/nvim-web-devicons' }
  -- status line
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  -- tabline
  use {
    'akinsho/bufferline.nvim',
    tag = "*",
    requires = { 'nvim-tree/nvim-web-devicons' },
  }
  -- fuzzy finder
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',
    requires = { 'nvim-lua/plenary.nvim' }
  }
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }
  -- treesitter
  --use {
  --  'nvim-treesitter/nvim-treesitter',
  --  run = function()
  --    local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
  --    ts_update()
  --  end,
  -- }

  -- lsp & server
  use 'neovim/nvim-lspconfig'
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  -- cmp
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/vim-vsnip"
  use "hrsh7th/cmp-vsnip"
  use "onsails/lspkind.nvim"

  -- other
  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }
  use {
    "j-hui/fidget.nvim",
    tag = 'legacy',
    config = function() require("fidget").setup {} end
  }
  use "rcarriga/nvim-notify"

  if packer_bootstrap then
    require('packer').sync()
  end
end)
