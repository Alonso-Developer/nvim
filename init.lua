require('base')
require('plugins')
require('mappings')

local lspconfig = require('lspconfig')
lspconfig.pyright.setup {}
