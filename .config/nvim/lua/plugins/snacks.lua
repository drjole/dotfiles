return {
    "folke/snacks.nvim",
    priority = 1000,
    keys = {
        { "<leader>bd", function() Snacks.bufdelete() end,        desc = "Delete Buffer" },
        { "<leader>gg", function() Snacks.lazygit() end,          desc = "Lazygit" },
        { "<leader>gb", function() Snacks.git.blame_line() end,   desc = "Git Blame Line" },
        { "<leader>gB", function() Snacks.gitbrowse() end,        desc = "Git Browse" },
        { "<leader>gf", function() Snacks.lazygit.log_file() end, desc = "Lazygit Current File History" },
        { "<leader>gl", function() Snacks.lazygit.log() end,      desc = "Lazygit Log (cwd)" },
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
