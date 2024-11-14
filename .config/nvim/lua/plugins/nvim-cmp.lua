return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        {
            "L3MON4D3/LuaSnip",
            build = "make install_jsregexp",
        },
        "saadparwaiz1/cmp_luasnip",
        {
            "roobert/tailwindcss-colorizer-cmp.nvim",
            opts = {
                color_square_width = 2,
            },
        },
    },
    event = { "InsertEnter", "CmdlineEnter" },
    config = function()
        local cmp = require("cmp")
        local defaults = require("cmp.config.default")()

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-r>"] = cmp.mapping.scroll_docs(-4),
                ["<C-f>"] = cmp.mapping.scroll_docs(4),
                ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"] = cmp.mapping.abort(),
                ["<C-y>"] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = "lazydev" },
                { name = "nvim_lsp" },
                { name = "luasnip" },
                { name = "path" },
            }, {
                { name = "buffer" },
            }),
            sorting = defaults.sorting,
            formatting = {
                format = require("tailwindcss-colorizer-cmp").formatter,
            },

        })

        cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = "buffer" },
            },
        })

        cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = "path" },
            }, {
                { name = "cmdline" },
            }),
            matching = { disallow_symbol_nonprefix_matching = false },
        })

        local ls = require "luasnip"

        vim.snippet.expand = ls.lsp_expand

        ---@diagnostic disable-next-line: duplicate-set-field
        vim.snippet.active = function(filter)
            filter = filter or {}
            filter.direction = filter.direction or 1

            if filter.direction == 1 then
                return ls.expand_or_jumpable()
            else
                return ls.jumpable(filter.direction)
            end
        end

        ---@diagnostic disable-next-line: duplicate-set-field
        vim.snippet.jump = function(direction)
            if direction == 1 then
                if ls.expandable() then
                    return ls.expand_or_jump()
                else
                    return ls.jumpable(1) and ls.jump(1)
                end
            else
                return ls.jumpable(-1) and ls.jump(-1)
            end
        end

        vim.snippet.stop = ls.unlink_current

        -- ================================================
        --      My Configuration
        -- ================================================
        ls.config.set_config {
            history = true,
            updateevents = "TextChanged,TextChangedI",
            override_builtin = true,
        }

        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
            loadfile(ft_path)()
        end

        vim.keymap.set({ "i", "s" }, "<c-k>", function()
            return vim.snippet.active { direction = 1 } and vim.snippet.jump(1)
        end, { silent = true })

        vim.keymap.set({ "i", "s" }, "<c-j>", function()
            return vim.snippet.active { direction = -1 } and vim.snippet.jump(-1)
        end, { silent = true })
    end,
}
