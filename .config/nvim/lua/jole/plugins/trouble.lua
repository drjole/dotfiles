return {
    "folke/trouble.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    keys = {
        { "]t", function() require("trouble").next({ skip_groups = true, jump = true }) end,     desc = "Next trouble item" },
        { "[t", function() require("trouble").previous({ skip_groups = true, jump = true }) end, desc = "Previous trouble item" },
    },
    opts = {},
}
