return {
    "github/copilot.vim",
    keys = {
        { "<C-j>", 'copilot#Accept("<cr>")', mode = "i", desc = "Accept Copilot suggestion", expr = true, replace_keycodes = false },
    },
    cmd = "Copilot",
    config = function()
        vim.g.copilot_no_tab_map = true
        vim.cmd([[Copilot disable]])
    end,
}
