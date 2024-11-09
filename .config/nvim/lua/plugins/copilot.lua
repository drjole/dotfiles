return {
    "github/copilot.vim",
    cmd = "Copilot",
    keys = {
        { "<C-j>", 'copilot#Accept("<cr>")', mode = "i", desc = "Accept Copilot suggestion", expr = true, replace_keycodes = false },
    },
    config = function()
        vim.g.copilot_no_tab_map = true
    end,
}
