return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      tailwindcss_class_sorter_erb = {
        command = "npx",
        args = { "tailwindcss-class-sorter-erb" },
      },
      topiary = {
        command = "topiary",
        args = { "format", "$FILENAME" },
        stdin = false,
      },
    },
    formatters_by_ft = {
      eruby = { "tailwindcss_class_sorter_erb", "erb_format" },
      html = { "topiary" },
      query = { "topiary" },
      toml = { "topiary" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },
  },
}
