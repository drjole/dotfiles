return {
    "catppuccin/nvim",
    version = "v1.10.0",
    name = "catppuccin",
    priority = 1000,
    init = function()
        vim.cmd.colorscheme("catppuccin")
    end,
}
