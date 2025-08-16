return {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    keys = {
        { "<C-w>h",     ":TmuxNavigateLeft<CR>",  silent = true },
        { "<C-w>j",     ":TmuxNavigateDown<CR>",  silent = true },
        { "<C-w>k",     ":TmuxNavigateUp<CR>",    silent = true },
        { "<C-w>l",     ":TmuxNavigateRight<CR>", silent = true },

        { "<C-w><C-h>", ":TmuxNavigateLeft<CR>",  silent = true },
        { "<C-w><C-j>", ":TmuxNavigateDown<CR>",  silent = true },
        { "<C-w><C-k>", ":TmuxNavigateUp<CR>",    silent = true },
        { "<C-w><C-l>", ":TmuxNavigateRight<CR>", silent = true },
    },
    init = function()
        vim.g.tmux_navigator_no_mappings = 1
    end,
}
