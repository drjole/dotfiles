return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    init = function()
        vim.keymap.set("n", "<leader>e", "<cmd>Neotree float reveal<CR>")
    end,
    opts = {
        git_status_async = false,
        filesystem = {
            filtered_items = {
                hide_dotfiles = false,
            },
            follow_current_file = { enabled = true },
            use_libuv_file_watcher = true,
        },
        window = {
            mappings = {
                ["<space>"] = { nowait = true },
            },
        },
    },
}
