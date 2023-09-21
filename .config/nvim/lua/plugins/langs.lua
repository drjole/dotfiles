return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-Space>",
          node_incremental = "<C-Space>",
          scope_incremental = false,
          node_decremental = "<A-Space>",
        },
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rubocop = {},
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              checkOnSave = {
                overrideCommand = {
                  "cargo",
                  "clippy",
                  "--message-format=json",
                  "--",
                  "--warn=clippy::pedantic",
                  "--warn=clippy::nursery",
                  "--warn=clippy::unwrap_used",
                  "--warn=clippy::expect_used",
                },
              },
            },
          },
        },
      },
      format = {
        timeout_ms = 2000,
      },
    },
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    opts = function(_, opts)
      local nls = require("null-ls")
      table.insert(opts.sources, nls.builtins.diagnostics.erb_lint)
      table.insert(opts.sources, nls.builtins.diagnostics.rubocop)
      table.insert(opts.sources, nls.builtins.formatting.black)
      table.insert(opts.sources, nls.builtins.formatting.erb_lint)
      table.insert(opts.sources, nls.builtins.formatting.rubocop)
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "erb-lint",
        "rubocop",
      },
    },
  },
}
