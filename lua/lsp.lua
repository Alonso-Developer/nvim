local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

local lsp = require "lspconfig"

mason.setup()

-- disabling basedpyright semantic highlight
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
})


require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()

lsp.ruff.setup{
  cmd = {"/home/alonso/.local/share/nvim/mason/bin/ruff", "server",},
  filetypes = {'python', 'py'},
  capabilities=capabilities,
  on_attach = on_attach,
  init_options = {
      settings = {
	enabled = true,  -- Enable the plugin
	formatEnabled = true,  -- Enable formatting using ruffs formatter
	lineLength = 120,
	format = {
	    preview = true,
	    quoteStyle = 'preserve',
	    indentStyle = 'space',
	    docstringCodeFormat = true,
	},
	lint = {
	  preview = false,
	  -- select = {"ALL"},
	  ignore = {
	    "D100",
	    "CPY001",
	    "D103",
	    "PLR0914",
	    "PLR0915",
	    "C408",
	    "COM819",
	    "COM812",
	    "G004",
	    "ANN204",
	    "D107",
	    "D105",
	    "ERA001",
	    "PLR0913",
	    "PLR0917",
	    "T201",
	    "Q000",
	    "RET508",
	    "G201",
	    "C901",
	    "PLR0912",
	    "D101",
	  },
	  isort = {
	      caseSensetive = true,
	      combineAsImports = true,
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
      }
    }
}

lsp.pylsp.setup{
    cmd = {"/home/alonso/.local/share/nvim/mason/bin/pylsp"},
    filetypes = {'python', 'py'},
    capabilities=capabilities,
    on_attach = on_attach,
    settings = {
	pylsp = {
	    plugins = {
		pylsp_mypy = {enabled = false, live_mode = false},
		rope_autoimport = {enabled = true},
		rope_completion = {enabled = false, eager = false},
		rope_rename = {enabled = true},
		jedi_rename = {enabled = true},
		ruff = {enabled = false},
		jedi_hover = { enabled = true },
		jedi_signature_help = { enabled = true },
		jedi_references = { enabled = true },
		jedi_symbols = { enabled = true },
		jedi_completion = {
		    enabled = true,
		    eager = true,
		    include_function_objects = true,
		    include_class_objects = true,
		    cache_for = {"pandas", "numpy", 'tensorflow', 'matplotlib', 'pytorch', 'albumentations'}
		},
		pydocstyle = {
		    convention = 'numpy',
		},
		pylsp_rope = {
		    rename = {
			enabled = false,
		    }
		}
	    }
	}
    }
}

require'lspconfig'.basedpyright.setup{
    cmd = { "basedpyright-langserver", "--stdio" },
    filetypes = {'python', 'py'},
    capabilities=capabilities,
    on_attach = on_attach,
    settings = {
	basedpyright = {
	    analysis = {
		autoSearchPaths = true,
		diagnosticMode = "openFilesOnly",
		useLibraryCodeForTypes = true,
		autoImportCompletions = true,
		autoSearchPaths = true,
		inlayHints = {
		    variableTypes = true,
		    callArgumentNames = true,
		    functionReturnTypes = true,
		    genericTypes = true,
		    useTypingExtensions = true
		},
		diagnosticSeverityOverrides = {
		    reportMissingTypeStubs = false,
		    reportAny = false,
		    reportUnusedCallResult = false,
		    reportMissingParameterType = false,
		    reportUnknownArgumentType = false,
		    reportUnknownLambdaType = false,
		    reportUnknownMemberType = false,
		    reportUnknownParameterType = false,
		    reportUnknownVariableType = false,
		    reportIgnoreCommentWithoutRule = 'warning',
		    reportUnreachable = 'error',
		    reportPrivateLocalImportUsage = 'error',
		    reportImplicitRelativeImport = 'error',
		    reportInvalidCast = 'error',
		    reportMissingSuperCall = false,
		    reportImportCycles = 'error',
		    reportUnusedImport = 'information',
		    reportUnusedClass = 'information',
		    reportUnusedFunction = 'information',
		    reportUnusedVariable = 'information',
		    reportDuplicateImport = 'information',
		    reportWildcardImportFromLibrary = 'warning',
		    reportPrivateUsage = 'warning',
		    reportDeprecated = 'warning',
		    reportUnnecessaryIsInstance = 'information',
		    reportAssertAlwaysTrue = 'warning',
		    reportPrivateLocalImportUsage = false,
		    reportUnusedParameter = 'information',
		    reportUnannotatedClassAttribute = false,
		    reportMissingTypeArgument = false,
		},

	    }
	}
    }
}

lsp.clangd.setup{}

