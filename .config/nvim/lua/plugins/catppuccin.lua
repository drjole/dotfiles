return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    integrations = {
      blink_cmp = true,
      copilot_vim = true,
      fidget = true,
      harpoon = true,
      nvim_surround = true,
      snacks = true,
    },
  },
  init = function()
    vim.cmd([[colorscheme catppuccin]])
  end,
}
