return {
  "folke/todo-comments.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
  },
  keys = {
    { "]t",         function() require("todo-comments").jump_next() end },
    { "[t",         function() require("todo-comments").jump_prev() end },
    { "<leader>ft", "<cmd>TodoTelescope<cr>" },
  },
  opts = {
    search = {
      args = {
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        -- HACK: Can we set the `--hidden` flag without copying the other default flags?
        "--hidden",
        "--glob",
        "!**/.git/*",
      },
    },
  },
}
