local mini_plugins = {
    icons = {},
    statusline = {},
    surround = {},
    trailspace = {},
}

local spec = {}
for name, opts in pairs(mini_plugins) do
    table.insert(spec, {
        "echasnovski/mini." .. name,
        version = false,
        lazy = false,
        opts = opts,
    })
end

return spec
