return {
    "tpope/vim-rails",
    lazy = false,
    keys = {
        { "<leader>rc", "<cmd>Econtroller<cr>" },
        { "<leader>rh", "<cmd>Ehelper<cr>" },
        { "<leader>rm", "<cmd>Emodel<cr>" },
        { "<leader>rv", "<cmd>Eview<cr>" },
    },
    config = function()
        -- NOTE: Don't use the eruby.yaml filetype as it breaks treesitter highlighting
        vim.api.nvim_create_autocmd("FileType", {
            pattern = "eruby.yaml",
            callback = function()
                vim.bo.filetype = "yaml"
            end,
        })
    end,
}
