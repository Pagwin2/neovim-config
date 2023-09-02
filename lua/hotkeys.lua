vim.g.mapleader = ' '
--- example
--vim.api.nvim_set_keymap(mode, keys, mapping, options)

-- to make Y consistent with D and P
vim.api.nvim_set_keymap("n","Y","y$",{})

--- convenience hotkeys for diagnostics and generally figuring out what's gone wrong
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    -- variables setup for convenience
    local opts = {buffer = args.buf, remap = false}
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  end,
})

--- undotree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)

--- clipboard convenience
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])
vim.keymap.set({"n", "v"}, "<leader>p", [["_p]])

---- clear search highlight easily
vim.keymap.set("n", "<leader><ESC>", ":noh<CR>")
