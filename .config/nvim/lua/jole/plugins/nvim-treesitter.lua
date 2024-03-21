return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-context",
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    main = "nvim-treesitter.configs",
    opts = {
        ensure_installed = {
            "bash",
            "bibtex",
            "c",
            "css",
            "dockerfile",
            "embedded_template",
            "git_config",
            "gitignore",
            "go",
            "gomod",
            "gosum",
            "groovy",
            "html",
            "latex",
            "java",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "php",
            "proto",
            "python",
            "query",
            "regex",
            "ruby",
            "rust",
            "scss",
            "sql",
            "toml",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
        auto_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = {
                "latex", -- VimTex handles highlighting for LaTeX
            },
        },
        indent = {
            enable = true,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                },
            },
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>sa"] = "@parameter.inner",
                    ["<leader>sf"] = "@function.outer",
                },
                swap_previous = {
                    ["<leader>sA"] = "@parameter.inner",
                    ["<leader>sF"] = "@function.outer",
                },
            },
            move = {
                enable = true,
                set_jumps = true,
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = "@class.outer",
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },
            lsp_interop = {
                enable = true,
                border = "none",
                floating_preview_opts = {},
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer",
                },
            },
        },
    },
}
