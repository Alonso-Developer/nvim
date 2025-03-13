require('nvim-treesitter.configs').setup{
	ensure_installed = {
		'python',
		'lua',
		'java',
		'c_sharp'
	},
	auto_install = true,
	highlight = {
		enable = true
	}
}
