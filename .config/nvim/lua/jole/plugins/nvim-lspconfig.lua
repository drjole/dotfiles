return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "folke/neodev.nvim",
            opts = {},
        },
    },
    config = function()
        -- Setup
        local lspconfig = require("lspconfig")

        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

        -- Custom on_attach callback that includes an autocommand to format on save
        local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
        local on_attach = function(_, bufnr)
            -- Format on save
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, async = false })
                end,
            })
        end

        -- LSP servers
        lspconfig.clangd.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.dockerls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.gopls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.jdtls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
                Lua = {
                    workspace = { checkThirdParty = false },
                    telemetry = { enable = false },
                    format = {
                        defaultConfig = {
                            call_arg_parentheses = "keep",
                            quote_style = "double",
                            trailing_table_separator = "smart",
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
        })

        lspconfig.solargraph.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        lspconfig.stimulus_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

        local tailwindcss_default_config = require("lspconfig.server_configurations.tailwindcss").default_config
        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = vim.tbl_extend("force", tailwindcss_default_config.filetypes, {
                "rust",
            }),
            settings = {
                tailwindCSS = vim.tbl_extend("force", tailwindcss_default_config.settings.tailwindCSS, {
                    includeLanguages = {
                        rust = "html",
                    },
                }),
            },
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

        lspconfig.tsserver.setup({
            capabilities = capabilities,
            on_attach = on_attach,
        })

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

        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open diagnostics float" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
        vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Set location list" })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                local builtin = require("telescope.builtin")

                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local opts = { desc = "LSP: Go to declaration", buffer = ev.buf }
                vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

                opts = { desc = "LSP: Go to definition", buffer = ev.buf }
                vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)

                opts = { desc = "LSP: Hover", buffer = ev.buf }
                vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

                opts = { desc = "LSP: Go to implementations", buffer = ev.buf }
                vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)

                opts = { desc = "LSP: Signature help", buffer = ev.buf }
                vim.keymap.set("n", "<C-s>", vim.lsp.buf.signature_help, opts)

                opts = { desc = "LSP: Add workspace folder", buffer = ev.buf }
                vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)

                opts = { desc = "LSP: Remove workspace folder", buffer = ev.buf }
                vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)

                opts = { desc = "LSP: List workspace folders", buffer = ev.buf }
                vim.keymap.set("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)

                opts = { desc = "LSP: Go to type definitions", buffer = ev.buf }
                vim.keymap.set("n", "<leader>D", builtin.lsp_type_definitions, opts)

                opts = { desc = "LSP: Rename", buffer = ev.buf }
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

                opts = { desc = "LSP: Code actions", buffer = ev.buf }
                vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

                opts = { desc = "LSP: Go to references", buffer = ev.buf }
                vim.keymap.set("n", "gr", builtin.lsp_references, opts)

                opts = { desc = "LSP: Format", buffer = ev.buf }
                vim.keymap.set("n", "<leader>f", function()
                    vim.lsp.buf.format({ async = false })
                end, opts)

                opts = { desc = "LSP: Document symbols", buffer = ev.buf }
                vim.keymap.set("n", "<leader>ds", builtin.lsp_document_symbols, opts)

                opts = { desc = "LSP: Workspace symbols", buffer = ev.buf }
                vim.keymap.set("n", "<leader>ws", builtin.lsp_dynamic_workspace_symbols, opts)
            end,
        })
    end,
}
