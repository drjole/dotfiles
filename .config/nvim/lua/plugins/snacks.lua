return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    keys = {
        { "<leader>gg", function() Snacks.lazygit() end },
    },
    ---@type snacks.Config
    opts = {
        input = {},
        lazygit = {},
        words = {},
    },
    init = function()
        -- LSP Rename via Oil
        vim.api.nvim_create_autocmd("User", {
            pattern = "OilActionsPost",
            callback = function(event)
                if event.data.actions.type == "move" then
                    require("snacks")
                    Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
                end
            end,
        })
    end,
}
