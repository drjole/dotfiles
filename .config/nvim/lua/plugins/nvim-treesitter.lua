return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            -- Default parsers
            "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline",
            -- Additional parsers
            "bash",
            "bibtex",
            "cpp",
            "css",
            "dockerfile",
            "embedded_template",
            "git_config",
            "gitignore",
            "go",
            "gomod",
            "gosum",
            "html",
            "java",
            "javascript",
            "json",
            "json5",
            "python",
            "regex",
            "ruby",
            "rust",
            "scss",
            "sql",
            "templ",
            "toml",
            "typescript",
            "xml",
            "yaml",
        },
        sync_install = false,
        auto_install = true,
        ignore_install = { "latex" },
        highlight = {
            enable = true,
            disable = {
                "latex",
            },
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
        },
    },
}
