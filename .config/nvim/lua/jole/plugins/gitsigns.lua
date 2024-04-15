return {
    "lewis6991/gitsigns.nvim",
    config = function(_, opts)
        require("gitsigns").setup(opts)

        vim.keymap.set("n", "]h", "<cmd>Gitsigns next_hunk<cr>", { desc = "Gitsigns: Next hunk" })
        vim.keymap.set("n", "[h", "<cmd>Gitsigns prev_hunk<cr>", { desc = "Gitsigns: Previous hunk" })

        vim.keymap.set("n", "<leader>gsp", "<cmd>Gitsigns preview_hunk<cr>", { desc = "Gitsigns: Preview hunk" })
        vim.keymap.set("n", "<leader>gsl", "<cmd>Gitsigns preview_hunk_inline<cr>",
            { desc = "Gitsigns: Preview hunk inline" })

        vim.keymap.set("n", "<leader>gss", "<cmd>Gitsigns stage_hunk<cr>", { desc = "Gitsigns: Stage hunk" })
        vim.keymap.set("n", "<leader>gsu", "<cmd>Gitsigns undo_stage_hunk<cr>", { desc = "Gitsigns: Undo stage hunk" })
        vim.keymap.set("n", "<leader>gsr", "<cmd>Gitsigns reset_hunk<cr>", { desc = "Gitsigns: Reset hunk" })

        vim.keymap.set("n", "<leader>gsq", "<cmd>Gitsigns setqflist<cr>", { desc = "Gitsigns: Set quickfix list" })

        vim.keymap.set("n", "<leader>gsd", "<cmd>Gitsigns diffthis<cr>", { desc = "Gitsigns: Diff this" })
    end,
}
