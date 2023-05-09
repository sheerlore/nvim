-- lua/options.lua

-- ファイル
vim.opt.fileencoding = "utf-8"
vim.opt.swapfile = false
vim.opt.hidden = true

-- カーソル＆表示
-- vim.opt.cursorline = true
-- vim.opt.cursorcolumn = true

-- メニューとコマンド
vim.opt.wildmenu = true
vim.opt.cmdheight = 2
vim.opt.laststatus = 2
vim.opt.showcmd = true

-- カラースキーム
vim.opt.termguicolors = true
vim.opt.background = "dark"

-- インデント
vim.opt.shiftwidth = 0
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- 表示
vim.opt.number = true
vim.opt.relativenumber = true -- ex) 10j 5yk
vim.opt.wrap = false
vim.opt.showtabline = 2
vim.opt.showmatch = true

-- インターフェース
vim.opt.winblend = 20
vim.opt.pumblend = 20
vim.opt.showtabline = 2
vim.opt.signcolumn = "yes"

-- 検索
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true


-- その他
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.mouse = "i"
vim.opt.completeopt = { "menu", "menuone", "noselect", "noinsert" }
vim.opt.showmode = false
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")
vim.opt.encoding = "utf-8"
