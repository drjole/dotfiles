return {
  "folke/todo-comments.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
  keys = {
    { "]t",         function() require("todo-comments").jump_next() end },
    { "[t",         function() require("todo-comments").jump_prev() end },
    { "<leader>ft", "<cmd>TodoFzfLua<cr>" },
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
