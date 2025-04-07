return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", function() require("fzf-lua").files() end },
    { "<leader>fg", function() require("fzf-lua").live_grep() end },
    { "<leader>fh", function() require("fzf-lua").helptags() end },
    { "<leader>fr", function() require("fzf-lua").oldfiles({ cwd_only = true }) end },
    { "z=",         function() require("fzf-lua").spell_suggest() end },
  },
  opts = {
    fzf_opts = { ["--layout"] = "default", ["--cycle"] = true },
    keymap   = {
      fzf = {
        ["ctrl-q"] = "select-all+accept",
      },
    },
    files    = {
      rg_opts = [[--color=never --hidden --files -g '!{.git,node_modules}/*']],
    },
    grep     = {
      rg_opts =
      "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 -g '!{.git,node_modules}/*' -e",
      hidden = true,
    },
  },
}
