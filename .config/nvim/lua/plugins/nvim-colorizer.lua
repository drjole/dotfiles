return {
    "NvChad/nvim-colorizer.lua",
    main = "colorizer",
    keys = {
        { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "Toggle colorizer" },
    },
    opts = {
        user_default_options = {
            tailwind = true,
        },
    },
}
