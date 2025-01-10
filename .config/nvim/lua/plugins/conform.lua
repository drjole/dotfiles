return {
  "stevearc/conform.nvim",
  opts = {
    log_level = vim.log.levels.DEBUG,
    formatters_by_ft = {
      css = { "prettier" },
      eruby = { "erb_format", "erb_format_with_tailwindcss" },
      html = { "prettier" },
      javascript = { "prettier" },
      json = { "prettier" },
      markdown = { "prettier" },
      query = { "topiary" },
      scss = { "prettier" },
      toml = { "topiary" },
      typescript = { "prettier" },
      yaml = { "prettier" },
    },
    formatters = {
      erb_format = {
        command = "bundle",
        args = { "exec", "erb-formatter", "--stdin", "--print-width", "120" },
        condition = function(_, ctx)
          local filetype = vim.bo[ctx.buf].filetype
          if filetype ~= "eruby" and filetype ~= "eruby.html" then
            return false
          end
          if vim.system({ "bundle", "info", "tailwindcss-rails" }):wait().code == 0 then
            return false
          end
          return true
        end,
      },
      erb_format_with_tailwindcss = {
        command = "bundle",
        args = { "exec", "erb-formatter", "--stdin", "--print-width", "120", "--tailwind-output-path", "app/assets/builds/tailwind.css" },
        condition = function(_, ctx)
          local filetype = vim.bo[ctx.buf].filetype
          if filetype ~= "eruby" and filetype ~= "eruby.html" then
            return false
          end
          if vim.system({ "bundle", "info", "tailwindcss-rails" }):wait().code ~= 0 then
            return false
          end
          return true
        end,
      },
      topiary = {
        command = "topiary",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    },
    format_on_save = {
      timeout_ms = 2000,
      lsp_format = "fallback",
    },
  },
}
