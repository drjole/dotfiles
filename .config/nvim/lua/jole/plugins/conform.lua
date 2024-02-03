return {
    "stevearc/conform.nvim",
    config = function()
        local slow_format_filetypes = {}

        require("conform").setup({
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
                    command = "bundle",
                    args = { "exec", "erb-format", "--stdin", "--print-width", "120" },
                },
                shfmt = {
                    prepend_args = { "-i", "2" },
                },
                standardrb = {
                    command = "bundle",
                    args = { "exec", "standardrb", "--fix", "-f", "quiet", "--stderr", "--stdin", "$FILENAME" },
                },
            },
            format_on_save = function(bufnr)
                if slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end
                local function on_format(err)
                    if err and err:match("timeout$") then
                        slow_format_filetypes[vim.bo[bufnr].filetype] = true
                    end
                end

                return { timeout_ms = 200, lsp_fallback = true }, on_format
            end,
            format_after_save = function(bufnr)
                if not slow_format_filetypes[vim.bo[bufnr].filetype] then
                    return
                end
                return { lsp_fallback = true }
            end,
        })
    end,
}
