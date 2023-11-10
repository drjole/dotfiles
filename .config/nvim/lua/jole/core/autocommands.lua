vim.api.nvim_create_autocmd("TextYankPost", {
    group = vim.api.nvim_create_augroup("highlight_yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "tex" },
    callback = function()
        vim.cmd.setlocal({ "spell", "spelllang=en_us" })
    end,
})
