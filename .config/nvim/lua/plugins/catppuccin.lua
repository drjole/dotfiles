return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      integrations = {
        blink_cmp = true,
        copilot_vim = true,
        fidget = true,
        harpoon = true,
        nvim_surround = true,
        snacks = true,
      },
    })

    vim.cmd([[colorscheme catppuccin]])
  end,
}
