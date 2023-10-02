return {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local lint = require("lint")

        lint.linters_by_ft = {
            css = { "stylelint" },
            eruby = { "erb_lint" },
            html = { "erb_lint" },
            javascript = { "eslint_d" },
            json = { "jsonlint" },
            markdown = { "markdownlint" },
            python = { "mypy", "pylint", "flake8" },
            ruby = { "rubocop" },
            scss = { "stylelint" },
            typescript = { "eslint_d" },
            yaml = { "yamllint" },
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        vim.keymap.set("n", "<leader>l", function()
            lint.try_lint()
        end)
    end,
}
