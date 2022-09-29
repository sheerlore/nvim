return function()
  require('mason-lspconfig').setup_handlers({ function(server)
    local opt = {
      capabilities = require('cmp_nvim_lsp').update_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
      on_attach = function(client, bufnr)
        local bufopts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', bufopts)
        vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>', bufopts)
        vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', bufopts)
        vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', bufopts)
        vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', bufopts)
        vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', bufopts)
        vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', bufopts)
        vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>', bufopts)
        vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>', bufopts)

        vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>', bufopts)
        vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>', bufopts)
        vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>', bufopts)

        vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
          vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
        )

        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_command [[augroup Format]]
          vim.api.nvim_command [[autocmd! * <buffer>]]
          vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
          vim.api.nvim_command [[augroup END]]
        end
      end
    }

    if server == "sumneko_lua" then
      require('lspconfig').sumneko_lua.setup({
        on_attach = opt.on_attach,
        capabilities = opt.capabilities,
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true)
            }
          }
        }
      })
    else
      require('lspconfig')[server].setup(opt)
    end
  end })
end
