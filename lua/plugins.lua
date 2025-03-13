local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    {
	'jiangmiao/auto-pairs',
    },
    {
	'sainnhe/sonokai',
	config = function()
	    require('colorscheme')
	end
    },
    {
	'ms-jpq/chadtree',
	cmd = 'CHADopen',
    },
 --    {
	-- 'ms-jpq/coq_nvim',
	-- dependencies = {
	--     'ms-jpq/coq.artifacts'
	-- },
	-- init = function()
	--     vim.g.coq_settings = {
	-- 	auto_start = 'shut-up'
	--     }
	-- end,
	-- config = function()
	--     require('coq_config')
	--     require('lsp')
	-- end,
 --    },
    {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	'neovim/nvim-lspconfig',
	opts = {
	    inlay_hints = {
		enabled = true,
	    }
	}
    },
    {
	'nvim-lualine/lualine.nvim',
	event = 'VimEnter',
	config = function()
	    require('statusline')
	end
    },
    {
	'nvim-tree/nvim-web-devicons',
	event = 'VimEnter',
    },
    {
	'nvim-treesitter/nvim-treesitter',
	event = 'BufReadPost',
	config = function()
	    require('treesitter')
	end
    },
    {
	'numToStr/Comment.nvim',
	config = function()
	    require('comment')
	end
    },
    {
	'romgrk/barbar.nvim',
	dependencies = {
	    'lewis6991/gitsigns.nvim',
	    'nvim-tree/nvim-web-devicons',
	},
	init = function()
	    vim.g.barbar_auto_setup = true
	end,
	version = '^1.0.0',
    },
    {
	'toppair/peek.nvim',
	cmd = 'PeekOpen',
	event = { 'VeryLazy' },
	build = 'deno task --quiet build:fast',
	config = function()
	    require('peek').setup()
	    vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
	    vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
	end,
    },
    {	
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
    },
})

