return {
    "folke/todo-comments.nvim",
    dependencies = {
        "nvim-telescope/telescope.nvim",
    },
    event = "VeryLazy",
    keys = {
        { "]t",         function() require("todo-comments").jump_next() end, desc = "Next TODO Comment" },
        { "[t",         function() require("todo-comments").jump_prev() end, desc = "Previous TODO Comment" },
        { "<leader>ft", "<cmd>TodoTelescope<cr>",                            desc = "Telescope: TODOs" },
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
            },
        },
    },
}
