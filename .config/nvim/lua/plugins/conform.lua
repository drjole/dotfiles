return {
  "stevearc/conform.nvim",
  opts = {
    formatters = {
      tailwindcss_class_sorter_erb = {
        command = "npx",
        args = { "tailwindcss-class-sorter-erb" },
      },
    },
    formatters_by_ft = {
      eruby = { "tailwindcss_class_sorter_erb", "erb_format" },
    },
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = "fallback",
    },
  },
}
