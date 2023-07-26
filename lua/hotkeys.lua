vim.g.mapleader = ' '
--- example
--vim.api.nvim_set_keymap(mode, keys, mapping, options)

-- to make Y consistent with D and P
vim.api.nvim_set_keymap("n","Y","y$",{})

--- convenience hotkeys for diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

--- undotree
vim.keymap.set("n", "<leader><F5>", vim.cmd.UndotreeToggle)
