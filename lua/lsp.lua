local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

local lsp = require "lspconfig"
local coq = require "coq"

mason.setup()
mason_lspconfig.setup()

require('mason.api.command').MasonUpdate()

local servers = {
     pylsp = {
	pylsp = {      
	    configurationSources = {'ruff'}, 
	    plugins = {        
		pycodestyle = {
		    enabled = true,
		    ignore = {"E501"},
		}, 
		flake8 = {enabled = false},
		pydocstyle = {
		    enabled = true,
		    ignore = {"D100", "D101", "D102", "D103", "D104", "D105", "D106", "D203"},
		},
		pylsp_mypy = {
		    enabled = false, 
		    live_mode=false, 
		    disallow_untyped_calls = false,
		}, 
		isort = {enabled = true},
		yapf = {enabled = true},
		pylint = {
		    enabled = false,
		},
		mccabe = {enabled = true},
		preload = {enabled = false},
		pyflakes = {enabled=false},
		rope_autoimport = {
		    enabled = true,
		    completions = {
			enabled = false,
		    },
		    code_actions = {
			enabled = true,
		    }
		},
		rope = {enabled=true},
		ruff = {
		  enabled = true,  -- Enable the plugin
		  formatEnabled = true,  -- Enable formatting using ruffs formatter
		  lineLength = 120,
		  format = {
		      quoteStyle = 'single',
		      indentStyle = 'tab',
		      docstringCodeFormat = true,
		  },
		  lint = {
		      preview = true,
		      isort = {
			  caseSensetive = true,
		      },
		      mccabe = {
			  maxComplexity = 5,
		      },
		      pycodestyle = {
			  ignoreOverLongTaskComments = true,
			  maxLineLength = 120,
		      },
		      pydocstyle = {
			  convention = 'numpy'
		      },
		  },
		  preview = true,
		  showFixes = true,

		},
	    },
	},
    },  
 }

local capabilities = vim.lsp.protocol.make_client_capabilities()
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
