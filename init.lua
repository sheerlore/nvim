---------------------- HELPERS -----------------------
local cmd = vim.cmd   -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn     -- to call Vim functions e.g. fn.bufnr()
local g = vim.g       -- a table to access global variables
local opt = vim.opt   -- to set options

---------------------- OPTIONS -----------------------
vim.cmd[[colorscheme nord]]
opt.showmatch = true
opt.ignorecase = true
opt.hlsearch = true
opt.incsearch = true
opt.wildmode = "list:longest"
opt.clipboard = 'unnamedplus'
opt.smartcase = true
opt.smartindent = true
opt.list = true
opt.number = true
opt.cursorline = true
opt.wrap = false
opt.tabstop = 2
opt.softtabstop = 2
opt.expandtab = true
opt.shiftwidth = 2
opt.swapfile = false
opt.syntax = 'on'
opt.termguicolors = true
opt.completeopt="menuone,noinsert,noselect"
vim.api.nvim_set_keymap('i', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<Tab>"', {expr = true})
vim.api.nvim_set_keymap('i', '<CR>',  'pumvisible() ? "\\<C-y>" : "\\<CR>"', {expr = true})
vim.api.nvim_set_keymap('i', '<C-n>', 'pumvisible() ? "\\<Down>" : "\\<C-n>"', {expr = true})
vim.api.nvim_set_keymap('i', '<C-p>', 'pumvisible() ? "\\<Up>" : "\\<C-p>"', {expr = true})


-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')

vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
vim.keymap.set('n', '<C-n>', ':NvimTreeToggle<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)

-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#A00000 guibg=#104040
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

---------------------- PLUGINS SETUP -----------------------
require('plugins')
require('lualine').setup({
  options = { theme = 'nord' }
})
require('nvim-tree').setup()
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').update_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end})

local luasnip = require('luasnip')

-- nvim-cmp setup
local cmp = require('cmp')
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item,
    ['<C-n>'] = cmp.mapping.select_next_item,
    ['<C-l>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }),
  experimental = {
    ghost_text = true,
  },
}

