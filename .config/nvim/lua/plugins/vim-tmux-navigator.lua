return {
    "christoomey/vim-tmux-navigator",
    init = function()
        vim.g.tmux_navigator_no_mappings = 1

        vim.keymap.set("n", "<C-w>h", ":TmuxNavigateLeft<CR>", { silent = true })
        vim.keymap.set("n", "<C-w>j", ":TmuxNavigateDown<CR>", { silent = true })
        vim.keymap.set("n", "<C-w>k", ":TmuxNavigateUp<CR>", { silent = true })
        vim.keymap.set("n", "<C-w>l", ":TmuxNavigateRight<CR>", { silent = true })
        vim.keymap.set("n", "<C-w><C-h>", ":TmuxNavigateLeft<CR>", { silent = true })
        vim.keymap.set("n", "<C-w><C-j>", ":TmuxNavigateDown<CR>", { silent = true })
        vim.keymap.set("n", "<C-w><C-k>", ":TmuxNavigateUp<CR>", { silent = true })
        vim.keymap.set("n", "<C-w><C-l>", ":TmuxNavigateRight<CR>", { silent = true })
    end,
}
