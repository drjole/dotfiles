return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            bash = { "shfmt", },
            css = { "prettier", },
            eruby = { "erb_format", },
            gohtmltmpl = { "prettier", },
            gotexttmpl = { "prettier", },
            html = { "prettier", },
            javascript = { "prettier", },
            json = { "prettier", },
            markdown = { "prettier", },
            scss = { "prettier", },
            sh = { "shfmt", },
            template = { "prettier", },
            typescript = { "prettier", },
            yaml = { "prettier", },
            ["_"] = { "trim_whitespace", },
        },
        formatters = {
            erb_format = {
                command = "bundle",
                prepend_args = { "exec", "erb-format", "--print-width", "120", },
            },
        },
        format_on_save = {
            lsp_fallback = true,
            async = false,
        },
    },
}
