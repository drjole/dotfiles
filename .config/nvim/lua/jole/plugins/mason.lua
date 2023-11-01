return {
    "williamboman/mason.nvim",
    dependencies = {
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local mason_tool_installer = require("mason-tool-installer")

        mason.setup({})
        mason_lspconfig.setup({
            ensure_installed = {
                "docker_compose_language_service",
                "dockerls",
                "gopls",
                "lua_ls",
                "pyright",
                "rust_analyzer",
                "texlab",
            },
            automatic_installation = true,
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "black",
                "gofumpt",
                "goimports",
                "golines",
                "isort",
                "latexindent",
                "shfmt",
                "sql-formatter",
                "stylua",
            },
        })
    end,
}
