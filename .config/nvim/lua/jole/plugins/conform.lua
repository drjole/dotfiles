return {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                bash = { "shfmt" },
                css = { "prettier" },
                -- eruby = { "erb_format" },
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
                tex = { "latexindent" },
                typescript = { "prettier" },
                yaml = { "prettier" },
                ["_"] = { "trim_whitespace" },
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
