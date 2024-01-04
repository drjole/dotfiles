return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        integrations = {
            fidget = true,
            lsp_trouble = true,
            mini = {
                enabled = false,
            },
            neotree = true,
            nvimtree = false,
            treesitter_context = false,
            which_key = true,
        },
    },
}
