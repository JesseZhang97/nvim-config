local status, nvim_lsp = pcall(require, 'lspconfig')
if not status then
  return
end

local protocol = require('vim.lsp.protocol')

-- local augroup_format = vim.api.nvim_create_augroup('Format', { clear = true })
-- local enable_format_on_save = function(_, bufnr)
--   vim.api.nvim_clear_autocmds({ group = augroup_format, buffer = bufnr })
--   vim.api.nvim_create_autocmd('BufWritePre', {
--     group = augroup_format,
--     buffer = bufnr,
--     callback = function()
--       vim.lsp.buf.formatting_sync()
--     end,
--   })
-- end

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr) end

protocol.CompletionItemKind = {
  '', -- Text
  '', -- Method
  '', -- Function
  '', -- Constructor
  '', -- Field
  '', -- Variable
  '', -- Class
  'ﰮ', -- Interface
  '', -- Module
  '', -- Property
  '', -- Unit
  '', -- Value
  '', -- Enum
  '', -- Keyword
  '﬌', -- Snippet
  '', -- Color
  '', -- File
  '', -- Reference
  '', -- Folder
  '', -- EnumMember
  '', -- Constant
  '', -- Struct
  '', -- Event
  'ﬦ', -- Operator
  '', -- TypeParameter
}

-- Set up completion using nvim_cmp with LSP source
local capabilities = require('cmp_nvim_lsp').default_capabilities()

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'typescript.tsx' },
  cmd = { 'typescript-language-server', '--stdio' },
  capabilities = capabilities,
})

nvim_lsp.lua_ls.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
    enable_format_on_save(client, bufnr)
  end,
  settings = {
    Lua = {
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = vim.api.nvim_get_runtime_file('', true),
        checkThirdParty = false,
      },
    },
  },
})

nvim_lsp.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
})

nvim_lsp.pyright.setup({
  on_attach = on_attach,
  flags = lsp_flags,
})

nvim_lsp.rust_analyzer.setup({
  on_attach = on_attach,
  flags = lsp_flags,
  -- Server-specific settings...
  settings = {
    ['rust-analyzer'] = {},
  },
})

nvim_lsp.lemminx.setup({
  filetypes = { 'xml', 'xsd', 'xsl', 'xslt', 'svg' },
  cmd = { 'lemminx' },
  single_file_support = true,
})

nvim_lsp.jsonls.setup({
  cmd = { 'vscode-json-language-server', '--stdio' },
  filetypes = { 'json', 'jsonc' },
  init_options = { provideFormatter = true },
  single_file_support = true,
})
-- Diagnostic symbols in the sign column (gutter)
local signs = { Error = ' ', Warn = ' ', Info = ' ', Hint = ' ' }
for type, icon in pairs(signs) do
  local hl = 'DiagnosticSign' .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = '' })
end

vim.diagnostic.config({
  -- virtual_text = {
  --   prefix = '●',
  -- },
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
})
