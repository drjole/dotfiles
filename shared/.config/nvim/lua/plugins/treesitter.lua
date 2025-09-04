return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    dependencies = {
        {
            "nvim-treesitter/nvim-treesitter-context",
            opts = {
                multiline_threshold = 5,
            },
        },
    },
    opts = {
        ensure_installed = {
            "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
            "ruby", "embedded_template", "html", "css", "javascript", "dockerfile", "yaml",
        },
        sync_install = false,
        auto_install = true,
        incremental_selection = {
            enable = true,
        },
    },
}
