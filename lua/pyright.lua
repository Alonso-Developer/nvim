local setkey = vim.keymap.set
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}


setkey("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()', opts)
setkey("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
setkey("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)
setkey("i", "<Leader>s", "<Plug>(coc-snippets-expand-jump)")
setkey("i", "<Leader>q", "coc#refresh()", {silent = true, expr = true})
setkey("n", "gd", "<Plug>(coc-definition)", {silent = true})
setkey("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
setkey("n", "gi", "<Plug>(coc-implementation)", {silent = true})
setkey("n", "gr", "<Plug>(coc-references)", {silent = true})
setkey("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})
setkey("x", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})
setkey("n", "<leader>f", "<Plug>(coc-format-selected)", {silent = true})

function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
