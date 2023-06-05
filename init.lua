-- init.lua

require('000-options')
require('001-keymaps')

-- plugins ===============
require('plugins')
require('101-lualine')
require('102-telescope')
require('103-nvim-lspconfig')
require('104-mason')
require('105-nvim-cmp')
require('106-nvim-notify')
require('107-bufferline')
require('108-nvim-treesitter')


vim.cmd [[colorscheme tokyonight-night]]
