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
            "html",
            "latex",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "php",
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
            -- VimTex handles highlighting for LaTeX
            disable = { "latex" },
            additional_vim_regex_highlighting = false,
        },
        indent = {
            enable = true,
            -- YAML is broken in treesitter
            disable = {
                "yaml",
            },
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
        textobjects = {
            lsp_interop = {
                enable = true,
                border = "none",
                floating_preview_opts = {},
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer",
                },
            },
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
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
            swap = {
                enable = true,
                swap_next = {
                    ["<leader>a"] = "@parameter.inner",
                },
                swap_previous = {
                    ["<leader>A"] = "@parameter.inner",
                },
            },
        },
    },
}
