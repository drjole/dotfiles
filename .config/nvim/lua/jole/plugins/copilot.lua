return {
    "github/copilot.vim",
    event = "InsertEnter",
    keys = {
        { "<C-j>", 'copilot#Accept("<CR>")', mode = "i", desc = "Accept Copilot suggestion", expr = true, replace_keycodes = false },
    },
    init = function()
        vim.g.copilot_no_tab_map = true
    end,
}
