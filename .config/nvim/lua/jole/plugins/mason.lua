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
                "yamlls",
            },
            automatic_installation = true,
        })
        mason_tool_installer.setup({
            ensure_installed = {
                "black",
                "erb-lint",
                "eslint_d",
                "flake8",
                "gofumpt",
                "golangci-lint",
                "golines",
                "isort",
                "jsonlint",
                "latexindent",
                "markdownlint",
                "mypy",
                "prettier",
                "ruff",
                "shfmt",
                "sql-formatter",
                "standardrb",
                "stylelint",
                "stylua",
                "yamllint",
            },
        })
    end,
}
