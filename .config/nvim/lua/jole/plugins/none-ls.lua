return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.diagnostics.erb_lint,
                null_ls.builtins.formatting.erb_format,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.formatting.shfmt.with({
                    extra_args = { "-i", "2" },
                }),
            },
        })
    end,
}
