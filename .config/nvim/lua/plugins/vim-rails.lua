return {
    "tpope/vim-rails",
    lazy = false,
    keys = {
        { "<leader>rc", "<cmd>Econtroller<cr>", desc = "rails.vim: Go to controller" },
        { "<leader>rh", "<cmd>Ehelper<cr>",     desc = "rails.vim: Go to helper" },
        { "<leader>rm", "<cmd>Emodel<cr>",      desc = "rails.vim: Go to model" },
        { "<leader>rv", "<cmd>Eview<cr>",       desc = "rails.vim: Go to view" },
    },
    config = function()
        vim.api.nvim_create_autocmd(
            { "BufNewFile", "BufReadPost" },
            {
                pattern = { "*.yml" },
                callback = function()
                    vim.bo.filetype = "yaml"
                end,
            }
        )
    end,
}
