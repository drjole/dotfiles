return {
  "ibhagwan/fzf-lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>ff", function() require("fzf-lua").files() end },
    { "<leader>fg", function() require("fzf-lua").live_grep() end },
    { "<leader>fh", function() require("fzf-lua").helptags() end },
    { "<leader>fr", function() require("fzf-lua").oldfiles({ cwd_only = true }) end },
    { "z=",         function() require("fzf-lua").spell_suggest() end },
  },
  opts = function()
    return {
      fzf_opts = {
        ["--cycle"] = true,
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
    }
  end,
}
