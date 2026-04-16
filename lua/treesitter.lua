-- so I don't need to handle every langauge
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("TSAutoStart", { clear = true }),
    callback = function(args)
        local buf = args.buf
        local lang = vim.treesitter.language.get_lang(vim.bo[buf].filetype)

        -- Only start if we actually have a parser installed for this language
        if lang and vim.treesitter.language.add(lang) then
            vim.treesitter.start(buf, lang)
        end
    end,
})
