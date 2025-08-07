return {
    "mfussenegger/nvim-lint",
    config = function()
        require("lint").linters_by_ft = {
            eruby = { "erb_lint" },
        }
        vim.api.nvim_create_autocmd({ "BufNewFile", "BufReadPost", "BufWritePost" }, {
            group = vim.api.nvim_create_augroup("my.lint", { clear = true }),
            pattern = "*.erb",
            callback = function()
                require("lint").try_lint()
            end,
        })
    end,
}
