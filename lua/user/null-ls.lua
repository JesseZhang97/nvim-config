local null_ls = require('null-ls')

local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  })
end

null_ls.setup({
  sources = {
    -- null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.prettier.with({ extra_args = { '--single-quote', '--jsx-singl-quote' } }),
    null_ls.builtins.formatting.stylua.with({
      extra_args = { '--config-path', vim.fn.expand('~/.config/nvim/lua/user/settings/stylua.toml') },
    }),
  },

  on_attach = function(client, bufnr)
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd('BufWritePre', {
        group = augroup,
        buffer = bufnr,
        callback = function()
          lsp_formatting(bufnr)
        end,
      })
    end
  end,
})

vim.api.nvim_create_user_command('DisableLspFormatting', function()
  vim.api.nvim_clear_autocmds({ group = augroup, buffer = 0 })
end, { nargs = 0 })
