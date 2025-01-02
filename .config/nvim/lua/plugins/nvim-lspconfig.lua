return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "b0o/schemastore.nvim",
    "saghen/blink.cmp",
    {
      "folke/lazydev.nvim",
      ft = "lua",
      opts = {
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
  },
  config = function()
    local capabilities = require("blink.cmp").get_lsp_capabilities()

    local servers = {
      bashls = {},
      clangd = {},
      dockerls = {},
      gopls = {},
      html = {
        filetypes = vim.list_extend(require("lspconfig.configs.html").default_config.filetypes, {
          "eruby",
        }),
        init_options = {
          provideFormatter = false,
        },
      },
      jdtls = {},
      jsonls = {
        settings = {
          json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
          },
        },
      },
      lua_ls = {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            format = {
              enable = true,
              defaultConfig = {
                call_arg_parentheses = "remove",
                indent_style = "space",
                indent_size = "2",
                quote_style = "double",
                trailing_table_separator = "smart",
              },
            },
          },
        },
      },
      pylsp = {},
      ruby_lsp = {
        init_options = {
          formatter = "standard",
          linters = {
            "standard",
          },
        },
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              features = "all",
            },
            check = {
              command = "clippy",
              -- extraArgs = { "--", "-W", "clippy::pedantic", "-W", "clippy::nursery", "-W", "clippy::unwrap_used", "-W", "clippy::expect_used" },
            },
            procMacro = {
              ignored = {
                leptos_macro = {
                  "server",
                },
              },
            },
          },
        },
      },
      sqls = {},
      tailwindcss = {
        filetypes = vim.list_extend(require("lspconfig.configs.tailwindcss").default_config.filetypes, {
          "rust",
        }),
        settings = {
          tailwindCSS = vim.tbl_extend("force",
            require("lspconfig.configs.tailwindcss").default_config.settings.tailwindCSS, {
              includeLanguages = {
                rust = "html",
              },
            }),
        },
      },
      texlab = {
        settings = {
          texlab = {
            latexindent = {
              modifyLineBreaks = true,
            },
          },
        },
      },
      ts_ls = {},
      yamlls = {
        settings = {
          yaml = {
            format = {
              enable = true,
            },
            schemaStore = {
              enable = false,
              url = "",
            },
            schemas = require("schemastore").yaml.schemas(),
            validate = true,
          },
        },
      },
    }

    for server, config in pairs(servers) do
      require("lspconfig")[server].setup(vim.tbl_extend("force", { capabilities = capabilities }, config))
    end

    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, { buffer = args.buf })
        vim.keymap.set("n", "g0", require("telescope.builtin").lsp_document_symbols, { buffer = args.buf })
        vim.keymap.set("n", "gri", require("telescope.builtin").lsp_implementations, { buffer = args.buf })
        vim.keymap.set("n", "grr", require("telescope.builtin").lsp_references, { buffer = args.buf })

        local client = vim.lsp.get_client_by_id(args.data.client_id)
        if not client then return end

        if client:supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = args.buf,
            callback = function()
              vim.lsp.buf.format({ bufnr = args.buf, id = client.id, formatting_options = { insertSpaces = true } })
            end,
          })
        end
      end,
    })
  end,
}
