return {
    "lervag/vimtex",
    ft = { "tex" },
    init = function()
        vim.g.vimtex_view_method = "zathura"
        vim.g.vimtex_quickfix_mode = 0
    end,
}
