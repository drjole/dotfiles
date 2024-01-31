return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
    opts = {
        integrations = {
            lsp_trouble = true,
            neotree = true,
            treesitter_context = true,
            which_key = true,
        },
    },
}
