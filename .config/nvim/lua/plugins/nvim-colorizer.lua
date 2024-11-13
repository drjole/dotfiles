return {
    "NvChad/nvim-colorizer.lua",
    keys = {
        { "<leader>cc", "<cmd>ColorizerToggle<cr>", desc = "Toggle colorizer" },
    },
    ft = {
        "css",
        "eruby",
        "html",
        "scss",
    },
    opts = {
        filetypes = {
            css = {
                mode = "virtualtext",
                tailwind = true,
            },
            eruby = {
                mode = "background",
                tailwind = true,
            },
            html = {
                mode = "background",
                tailwind = true,
            },
            scss = {
                mode = "virtualtext",
                tailwind = true,
            },
        },
        user_default_options = {
            tailwind = true,
        },
    },
}
