return {
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.configs",
  build = ":TSUpdate",
  dependencies = {
    {
      "nvim-treesitter/nvim-treesitter-context",
      opts = {
        mode = "cursor",
        max_lines = 3,
      },
    },
    "nvim-treesitter/nvim-treesitter-textobjects",
  },
  opts = {
    ensure_installed = {
      -- Default languages
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "markdown",
      "markdown_inline",
      -- Additional languages
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
      "latex",
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
      "toml",
      "typescript",
      "xml",
      "yaml",
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = true,
    },
    -- indent = {
    --   enable = true,
    -- },
    incremental_selection = {
      enable = true,
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
