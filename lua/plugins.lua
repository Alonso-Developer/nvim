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
		'jiangmiao/auto-pairs'	
	},
	{
		'sainnhe/sonokai',
		config = function()
			require('colorscheme')
		end
	},
	{
		'ms-jpq/chadtree',
		builds = 'chad',
	},
	{
		'neoclide/coc.nvim',
		branch = 'release',


		config = function()
		    require('pyright')
		end
	},
	{
		'neovim/nvim-lspconfig'
	},
	{
		'nvim-lualine/lualine.nvim',
		config = function()
			require('statusline')
		end
	},
	{
		'nvim-tree/nvim-web-devicons'
	},
	{
		'nvim-treesitter/nvim-treesitter',
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
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
		opts = {
		},
		version = '^1.0.0', -- optional: only update when a new 1.x version is released
	  },
})
