return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "hrsh7th/nvim-cmp",
        {
            "folke/neodev.nvim",
            opts = {
                library = {
                    plugins = {
                        "nvim-dap-ui",
                    },
                },
            },
        },
    },
    config = function()
        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        local formatting_augroup = vim.api.nvim_create_augroup("LspFormatting", {})

        local on_attach = function(client, bufnr)
            -- Enable completion triggered by <c-x><c-o>
            vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

            -- Buffer local mappings.
            -- See `:help vim.lsp.*` for documentation on any of the below functions
            local telescope_builtin = require("telescope.builtin")
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
                { desc = "LSP: Go to declaration", buffer = bufnr })

            vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions,
                { desc = "LSP: Go to definitions", buffer = bufnr })

            vim.keymap.set("n", "K", vim.lsp.buf.hover,
                { desc = "LSP: Hover", buffer = bufnr })

            vim.keymap.set("n", "gi", telescope_builtin.lsp_implementations,
                { desc = "LSP: Go to implementations", buffer = bufnr })

            vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help,
                { desc = "LSP: Signature Help", buffer = bufnr })

            vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder,
                { desc = "LSP: Add workspace folder", buffer = bufnr })

            vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder,
                { desc = "LSP: Remove workspace folder", buffer = bufnr })

            vim.keymap.set("n", "<leader>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, { desc = "LSP: List workspace folders", buffer = bufnr })

            vim.keymap.set("n", "<leader>D", telescope_builtin.lsp_type_definitions,
                { desc = "LSP: Go to type definitions", buffer = bufnr })

            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename,
                { desc = "LSP: Rename", buffer = bufnr })

            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action,
                { desc = "LSP: Code Action", buffer = bufnr })

            vim.keymap.set("n", "gr", telescope_builtin.lsp_references,
                { desc = "LSP: Go to references", buffer = bufnr })

            vim.keymap.set("n", "<leader>f", function()
                vim.lsp.buf.format { async = false }
            end, { desc = "LSP: Format", buffer = bufnr })

            vim.keymap.set("n", "<leader>sd", telescope_builtin.lsp_document_symbols,
                { desc = "LSP: Document symbols", buffer = bufnr })

            vim.keymap.set("n", "<leader>ws", telescope_builtin.lsp_dynamic_workspace_symbols,
                { desc = "LSP: Workspace symbols", buffer = bufnr })

            -- Format on save
            if client.server_capabilities.documentFormattingProvider then
                vim.api.nvim_clear_autocmds({ group = formatting_augroup, buffer = bufnr })
                vim.api.nvim_create_autocmd("BufWritePre", {
                    group = formatting_augroup,
                    buffer = bufnr,
                    callback = function()
                        vim.lsp.buf.format({
                            async = false,
                            filter = function(c)
                                return c.id == client.id
                            end,
                        })
                    end,
                })
            end
        end

        lspconfig.ansiblels.setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig.dockerls.setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = { "go", "gomod", "gowork", "gotmpl", "gohtmltmpl" },
            settings = {
                gopls = {
                    analyses = {
                        composites = false,
                        unusedparams = true,
                    },
                    completeUnimported = true,
                    gofumpt = true,
                    templateExtensions = { "tmpl" },
                    usePlaceholders = true,
                },
            },
        })
        lspconfig.jdtls.setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    format = {
                        enable = true,
                        defaultConfig = {
                            call_arg_parentheses = "keep",
                            insert_final_newline = "true",
                            quote_style = "double",
                            trailing_table_separator = "smart",
                        },
                    },
                },
            },
        })
        lspconfig.pylsp.setup({ capabilities = capabilities, on_attach = on_attach })
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
        lspconfig.solargraph.setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig.stimulus_ls.setup({ capabilities = capabilities, on_attach = on_attach })
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
        lspconfig.tsserver.setup({ capabilities = capabilities, on_attach = on_attach })
        lspconfig.yamlls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                yaml = {
                    schemaStore = {
                        enable = true,
                    },
                },
            },
        })
    end,
}
