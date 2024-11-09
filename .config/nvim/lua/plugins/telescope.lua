return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end,                  desc = "Telescope: Find files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end,                   desc = "Telescope: Find in files" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end,                   desc = "Telescope: Find help tags" },
        { "<leader>fr", function() require("telescope.builtin").oldfiles({ only_cwd = true }) end, desc = "Telescope: Find recent files" },
    },
    opts = {
        pickers = {
            find_files = {
                find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
            },
            live_grep = {
                additional_args = { "--hidden", "--glob", "!**/.git/*" },
            },
        },
    },
    config = function()
        require("telescope").load_extension("fzf")
    end,
}
