return {
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',      -- LSP completions
      'hrsh7th/cmp-buffer',         -- words from current buffer
      'hrsh7th/cmp-path',           -- filesystem paths
      'L3MON4D3/LuaSnip',           -- snippet engine
      'saadparwaiz1/cmp_luasnip',   -- snippet completions
    },
    config = function()
      local cmp = require('cmp')
      local luasnip = require('luasnip')

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-Space>'] = cmp.mapping.complete(),       -- trigger completion
          ['<C-e>']     = cmp.mapping.abort(),          -- close completion
          ['<CR>']      = cmp.mapping.confirm({ select = true }), -- confirm
          ['<Tab>']     = cmp.mapping(function(fallback) -- next item
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>']   = cmp.mapping(function(fallback) -- prev item
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        }),
      })
    end,
  }
}
