local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
vim.api.nvim_create_autocmd("BufWritePre", {
    group = augroup,
    buffer = bufnr,
    callback = function()
        vim.lsp.buf.format()
        if vim.bo.filetype == "python" then
            vim.system({ "ruff", "format", vim.api.nvim_buf_get_name(0) })
        end
    end,
})
