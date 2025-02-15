return {
  "nvim-treesitter/nvim-treesitter",
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
  config = function(_, opts)
    local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    parser_config.d2 = {
      install_info = {
        url = "https://github.com/ravsii/tree-sitter-d2",
        files = { "src/parser.c" },
        branch = "main",
      },
      filetype = "d2",
    }

    require("nvim-treesitter.configs").setup(opts)
  end,
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
      "d2",
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
      disable = function(lang, buf)
        -- Disable highlighting for large files
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
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
