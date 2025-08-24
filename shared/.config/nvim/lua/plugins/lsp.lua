return {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
        "ibhagwan/fzf-lua",
    },
    opts = {
        ensure_installed = {
            "docker_compose_language_service",
            "dockerls",
            "herb_ls",
            "lua_ls",
            "ruby_lsp",
            "tailwindcss",
            "ts_ls",
        },
    },
    init = function()
        vim.lsp.config("lua_ls", {
            settings = {
                Lua = {
                    format = {
                        defaultConfig = {
                            call_arg_parentheses = "keep",
                            quote_style = "double",
                            trailing_table_separator = "smart",
                        },
                    },
                    workspace = {
                        library = vim.api.nvim_get_runtime_file("", true),
                    },
                },
            },
        })

        vim.lsp.config("herb_ls", {
            filetypes = { "html", "eruby" },
        })

        vim.lsp.config("ruby_lsp", {
            init_options = {
                formatter = "rubocop",
                linters = {
                    "rubocop",
                },
            },
        })

        vim.lsp.config("tailwindcss", {
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
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("my.lsp", {}),
            callback = function(args)
                local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

                if client:supports_method("textDocument/definition") then
                    vim.keymap.set("n", "gd", function()
                        vim.lsp.buf.definition({ bufnr = args.buf, id = client.id })
                    end)
                end
                if client:supports_method("textDocument/formatting") then
                    vim.keymap.set("n", "<leader>f", function()
                        vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                    end)
                end
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
                            vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
                        end,
                    })
                end
            end,
        })
    end,
}
