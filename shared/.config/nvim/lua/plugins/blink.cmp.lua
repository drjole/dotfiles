return {
    "saghen/blink.cmp",
    version = "1.*",
    lazy = false,
    opts = {
        keymap = {
            preset = "default",
        },
        signature = {
            enabled = true,
        },
        sources = {
            default = { "lsp", "path", "buffer" },
        },
    },
}
