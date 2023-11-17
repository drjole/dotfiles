return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "folke/neodev.nvim",
            opts = {},
        },
        "hrsh7th/nvim-cmp",
    },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local on_attach = function(_, bufnr)
            local opts = { buffer = bufnr, }

            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v", }, "<leader>ca", vim.lsp.buf.code_action, opts)

            vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, opts)
            vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, opts)
            vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, opts)
            vim.keymap.set("n", "<leader>D", require("telescope.builtin").lsp_type_definitions, opts)
            vim.keymap.set("n", "<leader>sd", require("telescope.builtin").lsp_document_symbols, opts)
            vim.keymap.set("n", "<leader>ws", require("telescope.builtin").lsp_workspace_symbols,
                opts)

            vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)

            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format({ async = false, })
            end, opts)
        end

        local _augroups = {}
        local get_augroup = function(client)
            if not _augroups[client.id] then
                local group_name = "lsp-format-" .. client.name
                local id = vim.api.nvim_create_augroup(group_name, { clear = true, })
                _augroups[client.id] = id
            end

            return _augroups[client.id]
        end

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("lsp-attach-format", { clear = true, }),
            callback = function(args)
                local client_id = args.data.client_id
                local client = vim.lsp.get_client_by_id(client_id)
                local bufnr = args.buf

                if not client.server_capabilities.documentFormattingProvider then
                    return
                end

                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = get_augroup(client),
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format {
                            async = false,
                            filter = function(c)
                                return c.id == client.id
                            end,
                        }
                    end,
                })
            end,
        })

        lspconfig.dockerls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                analyses = {
                    unusedparams = true,
                },
                completeUnimported = true,
                templateExtensions = { "tmpl", },
                usePlaceholders = true,
            },
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false, },
                    telemetry = { enable = false, },
                    format = {
                        enable = true,
                        defaultConfig = {
                            call_arg_parentheses = "keep",
                            insert_final_newline = "true",
                            quote_style = "double",
                            trailing_table_separator = "always",
                        },
                    },
                },
            },
        })

        lspconfig.pylsp.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                ["rust-analyzer"] = {
                    cargo = {
                        features = "all",
                    },
                },
            },

        })

        lspconfig.solargraph.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
                -- solargraph does not use standardrb yet or at least the configuration is painful so I disable solargraph's formatting capabilty for now
                client.server_capabilities.documentFormattingProvider = false
                on_attach(client, bufnr)
            end,
        })

        lspconfig.standardrb.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.texlab.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                texlab = {
                    latexindent = {
                        modifyLineBreaks = true,
                    },
                },
            },
        })

        lspconfig.yamlls.setup({
            capabilities = capabilities,
            on_attach    = function(client, bufnr)
                -- Disable formatting for yamlls since I'm using vim-prettier
                client.server_capabilities.documentFormattingProvider = false
                on_attach(client, bufnr)
            end,
        })
    end,
}
