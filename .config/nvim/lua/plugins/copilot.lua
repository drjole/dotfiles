return {
  "github/copilot.vim",
  keys = {
    { "<C-j>", 'copilot#Accept("\\<CR>")', mode = "i", expr = true, replace_keycodes = false },
  },
  lazy = false,
  init = function()
    vim.g.copilot_no_tab_map = true
  end,
  config = function()
    vim.cmd([[Copilot disable]])
  end,
}
