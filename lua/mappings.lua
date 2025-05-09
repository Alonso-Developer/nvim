local setkey = vim.api.nvim_set_keymap
local opts = {silent = true, noremap = true}

setkey('n', '<Leader>v', '<Cmd>CHADopen<CR>', opts)
setkey('n', '<Leader>cls', '<Cmd>nohlsearch<CR>', opts)
setkey('n', '<Leader>,', '<Cmd>BufferPrevious<CR>', opts)
setkey('n', '<Leader>.', '<Cmd>BufferNext<CR>', opts)
setkey('n', '<Leader>d', '<Cmd>BufferClose<CR>', opts)
setkey('n', '<Leader>t', '<Cmd>ToggleTerm<CR>', opts)
setkey('t', '<Esc>', '<C-\\><C-n>', opts)
setkey('t', '<Esc>', '<C-\\><C-n>', opts)
setkey('n', '<Leader>g', '<Cmd>Neogit<CR>', opts)



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
-- vim.api.nvim_set_keymap('i', '<Esc>', [[pumvisible() ? "\<C-e><Esc>" : "\<Esc>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<C-c>', [[pumvisible() ? "\<C-e><C-c>" : "\<C-c>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<BS>', [[pumvisible() ? "\<C-e><BS>" : "\<BS>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap(
--   "i",
--   "<Leader>c",
--   [[pumvisible() ? (complete_info().selected == -1 ? "\<C-e><CR>" : "\<C-y>") : "\<CR>"]],
--   { expr = true, silent = true }
-- )
-- vim.api.nvim_set_keymap('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], { expr = true, silent = true })
-- vim.api.nvim_set_keymap('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<BS>"]], { expr = true, silent = true })
-- --
vim.api.nvim_create_autocmd('LspAttach', {
  desc = 'LSP actions',
  callback = function()
    local bufmap = function(mode, lhs, rhs)
      local opts = {buffer = true}
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Displays hover information about the symbol under the cursor
    bufmap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>')

    -- Jump to the definition
    bufmap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')

    -- Jump to declaration
    bufmap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')

    -- Lists all the implementations for the symbol under the cursor
    bufmap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')

    -- Jumps to the definition of the type symbol
    bufmap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>')

    -- Lists all the references 
    bufmap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>')

    -- Displays a function's signature information
    bufmap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>')

    -- Renames all references to the symbol under the cursor
    bufmap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>')

    -- Selects a code action available at the current cursor position
    bufmap('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>')

    -- Show diagnostics in a floating window
    bufmap('n', 'gl', '<cmd>lua vim.diagnostic.open_float()<cr>')

    -- Move to the previous diagnostic
    bufmap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<cr>')

    -- Move to the next diagnostic
    bufmap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<cr>')
  end
})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require('cmp')
cmp.setup {
  -- ... Your other configuration ...

  mapping = {

    -- ... Your other configuration ...

    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        else
          cmp.select_next_item()
        end
      --[[ Replace with your snippet engine (see above sections on this page)
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance() ]]
      elseif has_words_before() then
        cmp.complete()
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        end
      else
        fallback()
      end
    end, { "i", "s" }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        if #cmp.get_entries() == 1 then
          cmp.confirm({ select = true })
        else
          cmp.select_prev_item()
        end
      --[[ Replace with your snippet engine (see above sections on this page)
      elseif snippy.can_expand_or_advance() then
        snippy.expand_or_advance() ]]
	  elseif has_words_before() then
	    cmp.complete()
	    if #cmp.get_entries() == 1 then
	      cmp.confirm({ select = true })
	    end
	  else
	    fallback()
	  end
	end, { "i", "s" }),
    },
    ["<CR>"] = cmp.mapping({
       i = function(fallback)
         if cmp.visible() and cmp.get_active_entry() then
           cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
         else
           fallback()
         end
       end,
       s = cmp.mapping.confirm({ select = true }),
       c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
    }),

  snippet = {
    -- We recommend using *actual* snippet engine.
    -- It's a simple implementation so it might not work in some of the cases.
    expand = function(args)
      unpack = unpack or table.unpack
      local line_num, col = unpack(vim.api.nvim_win_get_cursor(0))
      local line_text = vim.api.nvim_buf_get_lines(0, line_num - 1, line_num, true)[1]
      local indent = string.match(line_text, '^%s*')
      local replace = vim.split(args.body, '\n', true)
      local surround = string.match(line_text, '%S.*') or ''
      local surround_end = surround:sub(col)

      replace[1] = surround:sub(0, col - 1)..replace[1]
      replace[#replace] = replace[#replace]..(#surround_end > 1 and ' ' or '')..surround_end
      if indent ~= '' then
        for i, line in ipairs(replace) do
          replace[i] = indent..line
        end
      end

      vim.api.nvim_buf_set_lines(0, line_num - 1, line_num, true, replace)
    end,
  },

  -- ... Your other configuration ...
}
