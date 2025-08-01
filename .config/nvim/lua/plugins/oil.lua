function _G.get_oil_winbar()
    local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
    local dir = require("oil").get_current_dir(bufnr)
    if dir then
        return vim.fn.fnamemodify(dir, ":~")
    else
        -- If there is no current directory (e.g. over ssh), just show the buffer name
        return vim.api.nvim_buf_get_name(0)
    end
end

return {
    "stevearc/oil.nvim",
    dependencies = {
        "echasnovski/mini.icons",
    },
    lazy = false,
    keys = {
        { "-",     "<cmd>Oil<cr>" },
        { "<a-h>", function() require("oil").toggle_hidden() end },
    },
    opts = {
        skip_confirm_for_simple_edits = true,
        win_options = {
            winbar = "%!v:lua.get_oil_winbar()",
        },
    },
}
