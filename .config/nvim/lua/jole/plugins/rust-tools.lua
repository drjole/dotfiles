return {
    "simrat39/rust-tools.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "hrsh7th/cmp-nvim-lsp",
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local rt = require("rust-tools")
        local cmp_nvim_lsp = require("cmp_nvim_lsp")

        local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
        for type, icon in pairs(signs) do
            local hl = "DiagnosticSign" .. type
            vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
        end

        local capabilities = cmp_nvim_lsp.default_capabilities()
        local opts = { noremap = true, silent = true }
        local on_attach = function(_, bufnr)
            opts.buffer = bufnr

            vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
            vim.keymap.set("n", "<space>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
            vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
            vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)
            vim.keymap.set("n", "K", rt.hover_actions.hover_actions, opts)
            vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
            vim.keymap.set("n", "L", vim.lsp.buf.signature_help, opts)
            vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
            vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
            vim.keymap.set("n", "<space>wl", function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, opts)
            vim.keymap.set("n", "<space>D", "<cmd>Telescope lsp_type_definitions<CR>", opts)
            vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
            vim.keymap.set({ "n", "v" }, "<space>ca", rt.code_action_group.code_action_group, opts)
            vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<CR>", opts)
        end

        rt.setup({
            server = {
                capabilities = capabilities,
                on_attach = on_attach,
            },
        })
    end,
}
