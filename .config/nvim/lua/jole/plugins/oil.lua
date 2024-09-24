return {
    "stevearc/oil.nvim",
    dependencies = {
        {
            "nvim-tree/nvim-web-devicons",
            opts = {},
        },
    },
    opts = {
        view_options = {
            show_hidden = true,
        },
    },
    config = function(_, opts)
        require("oil").setup(opts)

        vim.keymap.set("n", "<leader>n", "<cmd>Oil<cr>", { desc = "Open Oil" })
    end,
}
