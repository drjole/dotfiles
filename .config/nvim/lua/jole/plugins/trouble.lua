return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        vim.keymap.set("n", "<leader>xx", function()
            require("trouble").open()
        end, { desc = "Trouble open" })
        vim.keymap.set("n", "<leader>xw", function()
            require("trouble").open("workspace_diagnostics")
        end, { desc = "Trouble workspace diagnostics" })
        vim.keymap.set("n", "<leader>xd", function()
            require("trouble").open("document_diagnostics")
        end, { desc = "Trouble document diagnostics" })
        vim.keymap.set("n", "<leader>xq", function()
            require("trouble").open("quickfix")
        end, { desc = "Trouble quickfix" })
        vim.keymap.set("n", "<leader>xl", function()
            require("trouble").open("loclist")
        end, { desc = "Trouble loclist" })
        vim.keymap.set("n", "gR", function()
            require("trouble").open("lsp_references")
        end, { desc = "Trouble lsp references" })
    end,
}
