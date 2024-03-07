return {
    "kdheepak/lazygit.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>gg", vim.cmd.LazyGit, desc = "Open LazyGit" },
    },
}
