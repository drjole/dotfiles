return {
  colorscheme = "catppuccin",
  plugins = {
    { "catppuccin/nvim", name = "catppuccin" }
  },
  polish = function()
    vim.opt.guifont = "JetBrainsMono Nerd Font Mono:h13"
    vim.treesitter.language.register("json", "har")

    local function set_us_layout()
      os.execute("setxkbmap us_intl")
    end

    local function set_de_layout()
      os.execute("setxkbmap de")
    end

    vim.api.nvim_create_autocmd("VimEnter", {
      callback = set_us_layout
    })

    vim.api.nvim_create_autocmd({ "InsertLeave", "CmdlineLeave" }, {
      callback = set_us_layout
    })

    vim.api.nvim_create_autocmd({ "InsertEnter", "CmdlineEnter" }, {
      callback = set_de_layout
    })

    vim.api.nvim_create_autocmd("VimLeave", {
      callback = set_de_layout
    })

    vim.api.nvim_create_autocmd("FocusLost", {
      callback = set_de_layout
    })

    vim.api.nvim_create_autocmd("FocusGained", {
      callback = function()
        if vim.api.nvim_get_mode()["mode"] == "n" then
          set_us_layout()
        end
      end
    })
  end
}
