return {
    "github/copilot.vim",
    build = function()
        vim.cmd [[Copilot setup]]
    end,
    init = function()
        vim.keymap.set("i", "<C-J>", 'copilot#Accept("<CR>")', {
            expr = true,
            replace_keycodes = false,
        })
        vim.g.copilot_no_tab_map = true
    end,
}
