return {
    "github/copilot.vim",
    keys = {
        { "<c-j>", 'copilot#Accept("\\<CR>")', mode = "i", expr = true, replace_keycodes = false },
    },
    cmd = { "Copilot" },
    init = function()
        vim.g.copilot_no_tab_map = true
    end,
}
