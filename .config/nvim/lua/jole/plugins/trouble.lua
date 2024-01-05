return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.keymap.set("n", "]t", function()
            require("trouble").next({ skip_groups = true, jump = true })
        end)
        vim.keymap.set("n", "[t", function()
            require("trouble").previous({ skip_groups = true, jump = true })
        end)
    end,
    opts = {},
}
