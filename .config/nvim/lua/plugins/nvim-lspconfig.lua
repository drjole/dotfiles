return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "ibhagwan/fzf-lua",
        "b0o/schemastore.nvim",
    },
    init = function()
        local servers = {
            bashls = {},
            clangd = {},
            dockerls = {},
            gopls = {},
            jdtls = {},
            jsonls = {
                init_options = {
                    provideFormatter = false,
                },
                settings = {
                    json = {
                        schemas = require("schemastore").json.schemas(),
                        validate = {
                            enable = true,
                        },
                    },
                },
            },
            lua_ls = {
                settings = {
                    Lua = {
                        format = {
                            defaultConfig = {
                                call_arg_parentheses = "keep",
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
                    formatter = "rubocop",
                    linters = {
                        "rubocop",
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
                    },
                },
            },
            sqls = {},
            tailwindcss = {
                settings = {
                    tailwindCSS = {
                        experimental = {
                            -- For `class:` attributes in .erb files
                            classRegex = {
                                [=["([^"]*)"]=],
                                [=['([^']*)']=],
                            },
                        },
                    },
                },
                root_dir = function(_, on_dir)
                    on_dir(vim.fn.getcwd())
                end,
            },
            templ = {},
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
            vim.lsp.config(server, config)
            vim.lsp.enable(server)
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("my.lsp", {}),
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

                if client:supports_method("textDocument/codeAction") then
                    vim.keymap.set("n", "gra", require("fzf-lua").lsp_code_actions)
                end
                if client:supports_method("textDocument/references") then
                    vim.keymap.set("n", "grr", require("fzf-lua").lsp_references)
                end
                if client:supports_method("textDocument/implementation") then
                    vim.keymap.set("n", "gri", require("fzf-lua").lsp_implementations)
                end
                if client:supports_method("textDocument/documentSymbol") then
                    vim.keymap.set("n", "gO", require("fzf-lua").lsp_document_symbols)
                end
                if client:supports_method("textDocument/inlayHint") then
                    -- vim.lsp.inlay_hint.enable()
                    vim.keymap.set("n", "<leader>ih",
                        function()
                            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                        end)
                end

                if not client:supports_method("textDocument/willSaveWaitUntil")
                    and client:supports_method("textDocument/formatting") then
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = vim.api.nvim_create_augroup("my.lsp", { clear = false }),
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
                        end,
                    })
                end
            end,
        })
    end,
}
