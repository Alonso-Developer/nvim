local setkey = vim.api.nvim_set_keymap
local opts = {silent = true, noremap = true}

setkey('n', '<Leader>v', '<Cmd>CHADopen<CR>', opts)
setkey('n', '<Leader>cls', '<Cmd>nohlsearch<CR>', opts)
setkey('n', '<Leader>,', '<Cmd>BufferPrevious<CR>', opts)
setkey('n', '<Leader>.', '<Cmd>BufferNext<CR>', opts)
setkey('n', '<Leader>d', '<Cmd>BufferClose<CR>', opts)
setkey('t', '<Esc>', '<C-\\><C-n>', opts)


local setkey = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- setkey("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
-- setkey("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
-- setkey("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
-- setkey("i", "<Leader>s", "<Plug>(coc-snippets-expand-jump)")
-- setkey("i", "<Leader>q", "coc#refresh()", {silent = true, expr = true})
-- setkey("n", "gd", "<Plug>(coc-definition)", {silent = true})
-- setkey("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
-- setkey("n", "gi", "<Plug>(coc-implementation)", {silent = true})
-- setkey("n", "gr", "<Plug>(coc-references)", {silent = true})
-- setkey("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
-- setkey("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
-- setkey("n", "<Leader>f", "<Plug>(coc-format-selected)", {silent = true})
--
--

-- coq.nvim Keybindings
vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap(
  "i",
  "<Leader>c",
  [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
  { expr = true, silent = true }
)
vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
--
