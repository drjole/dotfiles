-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- LaTeX specific settings
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex" },
    callback = function()
        vim.cmd.setlocal({ "spell", "spelllang=en_us" })
        vim.o.wrap = true
    end,
})
