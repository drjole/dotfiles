function _G.get_oil_winbar()
    local dir = require("oil").get_current_dir()
    if dir then
        dir = dir:gsub("/$", "")
        local cwd = vim.fn.getcwd()
        if dir == cwd then
            return vim.fn.fnamemodify(dir, ":~:."):gsub("^" .. cwd, ".")
        end
        return vim.fn.fnamemodify(dir, ":~:."):gsub("^" .. cwd, ".")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    "stevearc/oil.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
        { "<leader>n", "<cmd>Oil<cr>", desc = "Open oil" },
    },
    opts = {
        default_file_explorer = true,
        skip_confirm_for_simple_edits = true,
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()",
        },
        view_options = {
            show_hidden = true,
            natural_order = true,
        },
    },
}
