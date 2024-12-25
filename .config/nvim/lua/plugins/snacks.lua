return {
  "folke/snacks.nvim",
  priority = 1000,
  keys = {
    { "<leader>bd", function() Snacks.bufdelete() end },
    { "<leader>gg", function() Snacks.lazygit() end },
    { "<leader>gb", function() Snacks.git.blame_line() end },
    { "<leader>gB", function() Snacks.gitbrowse() end },
    { "<leader>gf", function() Snacks.lazygit.log_file() end },
    { "<leader>gl", function() Snacks.lazygit.log() end },
  },
  opts = {
    bigfile = {
      enabled = false,
    },
    notifier = {
      enabled = false,
    },
    quickfile = {
      enabled = false,
    },
    statuscolumn = {
      enabled = false,
    },
    words = {
      enabled = false,
    },
  },
}
