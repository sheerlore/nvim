require("mason").setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

require("mason-lspconfig").setup()
require("mason-lspconfig").setup_handlers({
  function(server_name)
    local opt = {
      on_attach = function(client, bufnr)
        local opts = { noremap = true, silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
        vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
      end,

      capabilities = require('cmp_nvim_lsp').default_capabilities()
    }
    require('lspconfig')[server_name].setup(opt)
  end
})
