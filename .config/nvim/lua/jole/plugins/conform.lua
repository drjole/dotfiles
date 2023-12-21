return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            bash = { "shfmt" },
            css = { "prettier" },
            eruby = { "erb_format" },
            gohtmltmpl = { "prettier" },
            gotexttmpl = { "prettier" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            markdown = { "prettier" },
            ruby = { "standardrb" },
            scss = { "prettier" },
            sh = { "shfmt" },
            template = { "prettier" },
            typescript = { "prettier" },
            yaml = { "prettier" },
            ["_"] = { "trim_whitespace" },
        },
        formatters = {
            erb_format = {
                prepend_args = { "--print-width", "120" },
            },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
            timeout_ms = 5000,
        },
    },
}
