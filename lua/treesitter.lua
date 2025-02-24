require('nvim-treesitter.configs').setup{
	ensure_installed = {
		'python',
		'lua',
	},
	auto_install = false,
	highlight = {
		enable = true
	},
	ignore_install = {'csv'}
}
