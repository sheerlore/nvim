-- init.lua

require('000-options')
require('001-keymaps')

-- plugins ===============
require('plugins')
require('101-lualine')
require('102-telescope')


vim.cmd [[colorscheme tokyonight-night]]
