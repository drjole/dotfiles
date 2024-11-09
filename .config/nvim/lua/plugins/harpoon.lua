return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        { "<leader>a", function() require("harpoon"):list():add() end,                                    desc = "Add a new harpoon mark" },
        { "<C-e>",     function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end, desc = "Toggle harpoon menu" },
        { "<leader>j", function() require("harpoon"):list():select(1) end,                                desc = "Select harpoon mark 1" },
        { "<leader>k", function() require("harpoon"):list():select(2) end,                                desc = "Select harpoon mark 2" },
        { "<leader>l", function() require("harpoon"):list():select(3) end,                                desc = "Select harpoon mark 3" },
        { "<leader>;", function() require("harpoon"):list():select(4) end,                                desc = "Select harpoon mark 4" },
    },
}
