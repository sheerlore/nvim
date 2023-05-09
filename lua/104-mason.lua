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
require("mason-lspconfig").setup_handlers({ function(server_name)
  local opts = {}

  if server_name == "sumneko_lua" then
    opts.settings = {
      Lua = {
        diagnostics = { globals = { 'vim' }}
      }
    }
  end

  opts.capabilities = require('cmp_nvim_lsp').default_capabilities()
  require('lspconfig')[server_name].setup(opts)
end
})
