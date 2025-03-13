local setkey = vim.api.nvim_set_keymap
local opts = {silent = true, noremap = true}

setkey('n', '<Leader>v', '<Cmd>CHADopen<CR>', opts)
setkey('n', '<Leader>cls', '<Cmd>nohlsearch<CR>', opts)
setkey('n', '<Leader>,', '<Cmd>BufferPrevious<CR>', opts)
setkey('n', '<Leader>.', '<Cmd>BufferNext<CR>', opts)
setkey('n', '<Leader>d', '<Cmd>BufferClose<CR>', opts)
