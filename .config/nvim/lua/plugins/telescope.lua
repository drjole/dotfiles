return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      config = function()
        require("telescope").load_extension("fzf")
      end,
    },
  },
  keys = {
    { "<leader>ff", function() require("telescope.builtin").find_files() end },
    { "<leader>fn", function() require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") }) end },
    { "<leader>fg", function() require("telescope.builtin").live_grep() end },
    { "<leader>fh", function() require("telescope.builtin").help_tags() end },
    { "<leader>fr", function() require("telescope.builtin").oldfiles({ only_cwd = true }) end },
  },
  opts = {
    extensions = {
      fzf = {},
    },
    pickers = {
      find_files = {
        find_command = { "rg", "--files", "--color", "never", "--hidden", "--glob", "!**/.git/*" },
      },
      live_grep = {
        additional_args = { "--hidden", "--glob", "!**/.git/*" },
      },
    },
  },
}
