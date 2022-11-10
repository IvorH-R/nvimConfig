local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require('ivor.lsp.mason')
require('ivor.lsp.handlers').setup()
require('ivor.lsp.null-ls')
