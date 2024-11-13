require("luasnip.session.snippet_collection").clear_snippets("eruby")

local luasnip = require("luasnip")

local s = luasnip.snippet
local i = luasnip.insert_node

local fmt = require("luasnip.extras.fmt").fmt

luasnip.add_snippets("eruby", {
    s("erb", fmt([[
        <%= {} %>{}
    ]], { i(1), i(0) })),

    s("erbif", fmt([[
        <% if {} %>
            {}
        <% else %>
            {}
        <% end %>{}
    ]], { i(1), i(2), i(3), i(0) })),
})
