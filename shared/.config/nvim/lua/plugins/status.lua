return {
    "j-hui/fidget.nvim",
    lazy = false,
    keys = {
        { "<leader>n", "<cmd>Fidget history<cr>" },
    },
    opts = {
        notification = {
            override_vim_notify = true,
        },
    },
}
