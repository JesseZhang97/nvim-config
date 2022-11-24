local status, mason = pcall(require, 'mason')
if not status then
  return
end

local status2, lspconfig = pcall(require, 'mason-lspconfig')
if not status2 then
  return
end

mason.setup({})
lspconfig.setup({
  ensure_installed = {
    'cssls',
    'emmet_ls',
    'html',
  },
})

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').cssls.setup({
  capabilities = capabilities,
})
require('lspconfig').html.setup({
  capabilities = capabilities,
})
require('lspconfig').emmet_ls.setup({})
