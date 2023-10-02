return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        opts = {
            highlight = { enabled = true },
            indent = { enabled = true },
            ensure_installed = {
                "c",
                "css",
                "dockerfile",
                "embedded_template",
                "lua",
                "gitignore",
                "html",
                "javascript",
                "json",
                "markdown",
                "markdown_inline",
                "python",
                "query",
                "ruby",
                "rust",
                "scss",
                "sql",
                "toml",
                "typescript",
                "vim",
                "vimdoc",
                "yaml",
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<A-space>",
                },
            },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },
    "nvim-treesitter/nvim-treesitter-context",
}
