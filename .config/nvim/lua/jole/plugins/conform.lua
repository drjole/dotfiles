return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                bash = { "shfmt" },
                css = { "prettier" },
                eruby = { "prettier" },
                go = { "gofumpt", "goimports", "golines" },
                gohtmltmpl = { "prettier" },
                gotexttmpl = { "prettier" },
                html = { "prettier" },
                javascript = { "prettier" },
                json = { "prettier" },
                lua = { "stylua" },
                markdown = { "prettier" },
                python = { "isort", "black" },
                ruby = { "standardrb" },
                scss = { "prettier" },
                sql = { "sql-formatter" },
                tex = { "latexindent" },
                typescript = { "prettier" },
                yaml = { "prettier" },
                ["_"] = { "trim_whitespace" },
            },
            formatters = {
                latexindent = {
                    prepend_args = { "-m", "-l", "latexindent.yaml" },
                },
            },
            format_on_save = {
                lsp_fallback = true,
                async = false,
                timeout_ms = 2000,
            },
        })

        vim.keymap.set({ "n", "v" }, "<leader>f", function()
            conform.format({
                lsp_fallback = true,
                async = false,
                timeout_ms = 2000,
            })
        end, { desc = "Format buffer" })
    end,
}
