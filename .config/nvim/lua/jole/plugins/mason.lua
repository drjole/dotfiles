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
                "rubocop",
                "rust_analyzer",
                "sqlls",
                "taplo",
                "texlab",
            },
            automatic_installation = true,
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "black",
                "erb-lint",
                "flake8",
                "gofumpt",
                "goimports",
                "golines",
                "isort",
                "latexindent",
                "mypy",
                "prettier",
                "ruff",
                "shfmt",
                "sql-formatter",
                "stylelint",
                "stylua",
            },
        })
    end,
}