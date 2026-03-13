return {
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
    },
    config = function()
      require('mason').setup()
      require('mason-lspconfig').setup({
        ensure_installed = { 'lua_ls', 'clangd' },
        automatic_installation = true,
      })

      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- native vim.lsp.config instead of lspconfig[server].setup()
      local servers = { 'lua_ls', 'clangd' }
      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
        vim.lsp.enable(server)
      end

      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(e)
          local map = function(keys, func)
            vim.keymap.set('n', keys, func, { buffer = e.buf })
          end
          map('gd', vim.lsp.buf.definition)
          map('K',  vim.lsp.buf.hover)
          map('<leader>rn', vim.lsp.buf.rename)
          map('<leader>ca', vim.lsp.buf.code_action)
          map('[d', vim.diagnostic.goto_prev)
          map(']d', vim.diagnostic.goto_next)
        end
      })
    end,
  }
}
