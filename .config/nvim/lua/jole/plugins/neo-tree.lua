return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
    },
    config = function()
        local neotree = require("neo-tree")

        neotree.setup({
            close_if_last_window = true,
            git_status_async = false,
            filesystem = {
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            window = {
                mappings = {
                    ["<space>"] = "none",
                    ["h"] = function(state)
                        local node = state.tree:get_node()
                        if node:is_expanded() then
                            node:collapse(node:get_id())
                            require("neo-tree.ui.renderer").redraw(state)
                        else
                            require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
                        end
                    end,
                    ["l"] = "open",
                },
            },
        })

        vim.keymap.set("n", "<leader>e", "<cmd>Neotree float toggle<CR>", { desc = "Toggle Neotree" })
    end,
}
