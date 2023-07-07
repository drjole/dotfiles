return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require('telescope.builtin')
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            vim.cmd.colorscheme "catppuccin"
        end
    },
    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate",
        config = function()
            require 'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query",
                    "rust", "python", "ruby", "go", "javascript", "css", "html" },
                sync_install = false,
                auto_install = true,
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    },
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v2.x',
            lazy = true,
            config = function()
                require('lsp-zero.settings').preset({})
            end
        },
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
            config = function()
                require('lsp-zero.cmp').extend()

                local cmp = require('cmp')
                local cmp_action = require('lsp-zero.cmp').action()

                cmp.setup({
                    mapping = {
                        ['<CR>'] = cmp.mapping.confirm({ select = false }),
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
                        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
                        ['<Tab>'] = cmp_action.tab_complete(),
                        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
                    }
                })
            end
        },
        {
            'neovim/nvim-lspconfig',
            cmd = 'LspInfo',
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
                {
                    'williamboman/mason.nvim',
                    build = function()
                        pcall(vim.cmd, 'MasonUpdate')
                    end,
                },
            },
            config = function()
                local lsp = require('lsp-zero')

                lsp.on_attach(function(client, bufnr)
                    lsp.default_keymaps({ buffer = bufnr })
                    lsp.buffer_autoformat()
                end)

                lsp.ensure_installed({
                    'lua_ls',
                    'rust_analyzer',
                })

                lsp.nvim_workspace()

                lsp.setup()
            end
        }
    },
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local null_ls = require("null-ls")

            null_ls.setup({
                sources = {
                    null_ls.builtins.formatting.stylua,
                },
            })
        end
    },
}
