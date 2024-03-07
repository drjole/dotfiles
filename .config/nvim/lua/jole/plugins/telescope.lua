return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        "folke/trouble.nvim",
    },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end,                desc = "Find files" },
        { "<leader>fr", function() require("telescope.builtin").oldfiles() end,                  desc = "Find recent files" },
        { "<leader>fg", function() require("telescope.builtin").live_grep() end,                 desc = "Find in files" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end,                   desc = "Find buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end,                 desc = "Find help tags" },
        { "<leader>/",  function() require("telescope.builtin").current_buffer_fuzzy_find() end, desc = "Find in buffer" },
        { "z=",         function() require("telescope.builtin").spell_suggest() end,             desc = "Spell suggest" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup {
            defaults = {
                mappings = {
                    i = { ["<C-q>"] = require("trouble.providers.telescope").open_with_trouble },
                    n = { ["<C-q>"] = require("trouble.providers.telescope").open_with_trouble },
                },
            },
            pickers = {
                find_files = {
                    find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
                },
                live_grep = {
                    additional_args = { "--hidden", "--glob", "!**/.git/*" },
                },
            },
        }
        telescope.load_extension("fzf")
    end,
}
