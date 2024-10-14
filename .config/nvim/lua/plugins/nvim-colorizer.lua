return {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    opts = {
        user_default_options = {
            tailwind = true,
        },
    },
    keys = {
        { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "Toggle colorizer" },
    },
}
