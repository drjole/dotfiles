return {
    "github/copilot.vim",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")',
            { desc = "Accept Copilot suggestion", expr = true, replace_keycodes = false })
    end,
}
