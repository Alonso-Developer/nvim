require('base')
require('plugins')
require('mappings')

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {
    on_attach=on_attach,
    root_dir = function()
      return vim.fn.getcwd()
    end,
}
