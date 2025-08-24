return {
    "folke/todo-comments.nvim",
    dependencies = {
        "ibhagwan/fzf-lua",
    },
    lazy = false,
    keys = {
        { "<leader>ft", "<cmd>TodoFzfLua<cr>" },
    },
    opts = {},
}
