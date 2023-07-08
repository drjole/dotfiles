return {
  'jay-babu/mason-null-ls.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  lazy = false,
  dependencies = {
    'williamboman/mason.nvim',
    'jose-elias-alvarez/null-ls.nvim',
  },
  config = function()
    require('mason').setup()
    local null_ls = require 'null-ls'
    local formatters = null_ls.builtins.formatting
    local linters = null_ls.builtins.diagnostics
    null_ls.setup {
      sources = {
        linters.luacheck.with { extra_args = { '--globals', 'vim' } },
        formatters.stylua,
      },
    }
    require('mason-null-ls').setup {
      ensure_installed = nil,
      automatic_installation = true,
    }
  end,
}
