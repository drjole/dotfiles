return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup()

        vim.keymap.set("n", "<leader>a", function()
            harpoon:list():add()
        end, { desc = "Add a new harpoon mark" })
        vim.keymap.set("n", "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end, { desc = "Toggle harpoon menu" })

        vim.keymap.set("n", "<leader>j", function()
            harpoon:list():select(1)
        end, { desc = "Select harpoon mark 1" })
        vim.keymap.set("n", "<leader>k", function()
            harpoon:list():select(2)
        end, { desc = "Select harpoon mark 2" })
        vim.keymap.set("n", "<leader>l", function()
            harpoon:list():select(3)
        end, { desc = "Select harpoon mark 3" })
        vim.keymap.set("n", "<leader>;", function()
            harpoon:list():select(4)
        end, { desc = "Select harpoon mark 4" })
    end,
}
