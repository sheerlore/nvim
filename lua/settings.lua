vim.cmd('autocmd!')
vim.cmd [[colorscheme nightfox]]

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- gui --
vim.opt.title = true
vim.opt.number = true
vim.opt.autoindent = true
vim.opt.hlsearch = true
vim.opt.backup = false
vim.opt.showcmd = true
vim.opt.cmdheight = 1
vim.opt.laststatus = 2
vim.opt.expandtab = true
vim.opt.scrolloff = 10
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.inccommand = 'split'
vim.opt.ignorecase = true
vim.opt.smarttab = true
vim.opt.breakindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.backspace = 'start,eol,indent'
vim.opt.path:append { '**' } -- Finding files - Search down into subfolders
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.list = true

-- Undercurl
vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])

vim.opt.formatoptions:append { 'r' }

-- netrw
vim.api.nvim_set_var("netrw_liststyle", 3)
vim.api.nvim_set_var("netrw_keepdir", 0)
vim.api.nvim_set_var("netrw_winsize", 25)

vim.api.nvim_set_var("netrw_sizestyle", "H")
vim.api.nvim_set_var("netrw_timefmt", "%Y/%m/%d(%a) %H:%M:%S")
vim.api.nvim_set_var("netrw_preview", 1)
