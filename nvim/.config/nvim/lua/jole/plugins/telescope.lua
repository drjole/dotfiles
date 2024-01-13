return {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-fzf-native.nvim",
        "folke/trouble.nvim",
    },
    config = function()
        local telescope = require("telescope")
        local builtin = require("telescope.builtin")
        local trouble = require("trouble.providers.telescope")

        telescope.setup {
            defaults = {
                mappings = {
                    i = { ["<C-q>"] = trouble.open_with_trouble },
                    n = { ["<C-q>"] = trouble.open_with_trouble },
                },
            },
            pickers = {
                find_files = {
                    follow = true,
                },
                live_grep = {
                    additional_args = {
                        "-L",
                    },
                },
            },
        }

        telescope.load_extension("fzf")

        vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, {})
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
        vim.keymap.set("n", "<leader>fh", builtin.grep_string, {})
        vim.keymap.set("n", "<leader>/", builtin.current_buffer_fuzzy_find, {})
        vim.keymap.set("n", "z=", builtin.spell_suggest)
    end,
}
