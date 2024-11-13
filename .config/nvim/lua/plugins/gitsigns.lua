return {
    "lewis6991/gitsigns.nvim",
    keys = {
        { "]h",          "<cmd>Gitsigns next_hunk<cr>",           desc = "Gitsigns: Next hunk" },
        { "[h",          "<cmd>Gitsigns prev_hunk<cr>",           desc = "Gitsigns: Previous hunk" },
        { "<leader>gsp", "<cmd>Gitsigns preview_hunk<cr>",        desc = "Gitsigns: Preview hunk" },
        { "<leader>gsl", "<cmd>Gitsigns preview_hunk_inline<cr>", desc = "Gitsigns: Preview hunk inline" },
        { "<leader>gss", "<cmd>Gitsigns stage_hunk<cr>",          desc = "Gitsigns: Stage hunk" },
        { "<leader>gsu", "<cmd>Gitsigns undo_stage_hunk<cr>",     desc = "Gitsigns: Undo stage hunk" },
        { "<leader>gsr", "<cmd>Gitsigns reset_hunk<cr>",          desc = "Gitsigns: Reset hunk" },
        { "<leader>gsq", "<cmd>Gitsigns setqflist<cr>",           desc = "Gitsigns: Set quickfix list" },
        { "<leader>gsd", "<cmd>Gitsigns diffthis<cr>",            desc = "Gitsigns: Diff this" },
    },
    event = "VeryLazy",
    opts = {},
}
