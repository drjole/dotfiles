local function is_erb(filename)
    local endings = { ".html.erb", ".turbo_stream.erb" }
    for _, ending in ipairs(endings) do
        if string.sub(filename, - #ending) == ending then
            return true
        end
    end
end

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            css = { "prettier" },
            eruby = { "tailwindcss_class_sorter_erb", "erb_format", "erb_lint" },
            html = { "prettier" },
            javascript = { "prettier" },
            json = { "prettier" },
            markdown = { "prettier" },
            python = { "isort", "black" },
            query = { "topiary" },
            scss = { "prettier" },
            templ = { "prettier" },
            toml = { "topiary" },
            typescript = { "prettier" },
            yaml = { "prettier" },
        },
        formatters = {
            black = {
                prepend_args = { "--line-length", "120" },
            },
            erb_format = {
                command = "bundle",
                prepend_args = { "exec", "erb-format", "--print-width", "120" },
                condition = function(_, _)
                    return is_erb(vim.fn.expand("%:t"))
                end,
            },
            erb_lint = {
                command = "bundle",
                args = { "exec", "erb_lint", "--autocorrect", "$FILENAME" },
                stdin = false,
                condition = function(_, _)
                    return is_erb(vim.fn.expand("%:t"))
                end,
            },
            tailwindcss_class_sorter_erb = {
                command = "node_modules/.bin/tailwindcss-class-sorter-erb",
                condition = function(_, _)
                    return is_erb(vim.fn.expand("%:t"))
                end,
            },
            topiary = {
                command = "topiary",
                args = { "format", "$FILENAME" },
                stdin = false,
            },
        },
        format_on_save = {
            -- TODO: The default is 500 but our erb-formatters, especially erb-lint, are slow af.
            timeout_ms = 5000,
            lsp_format = "fallback",
        },
    },
}
