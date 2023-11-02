return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                bash = { "shfmt" },
                css = { "prettier" },
                eruby = { "erb_format" },
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
                erb_format = {
                    command = "bundle",
                    prepend_args = { "exec", "erb-format", "--print-width", "120" },
                },
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
    end,
}
