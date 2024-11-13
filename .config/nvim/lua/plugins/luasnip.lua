return {
    "L3MON4D3/LuaSnip",
    build = "make install_jsregexp",
    keys = {
        {
            "C-k",
            function()
                if require("luasnip").expand_or_jumpable() then
                    require("luasnip").expand_or_jump()
                end
            end,
            mode = { "i", "s" },
            desc = "Next LuaSnip node",
        },
        {
            "C-j",
            function()
                if require("luasnip").jumpable(-1) then
                    require("luasnip").jump(-1)
                end
            end,
            mode = { "i", "s" },
            desc = "Previous LuaSnip node",
        },
    },
    config = function()
        for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/snippets/*.lua", true)) do
            loadfile(ft_path)()
        end
    end,
}
