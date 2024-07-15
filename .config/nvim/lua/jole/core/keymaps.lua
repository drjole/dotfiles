-- Center view when navigating
vim.keymap.set("n", "n", "nzzzv", { desc = "Move to next match and center view" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Move to previous match and center view" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Move half page down and center view" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Move half page up and center view" })
vim.keymap.set("n", "}", "}zz", { desc = "Move to next paragraph and center view" })
vim.keymap.set("n", "{", "{zz", { desc = "Move to previous paragraph and center view" })

-- Move lines
vim.keymap.set("n", "<M-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
vim.keymap.set("n", "<M-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })
vim.keymap.set("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move line down in insert mode" })
vim.keymap.set("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move line up in insert mode" })
vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv", { desc = "Move selection up" })

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new-window tmux-sessionizer<CR>", { desc = "Open tmux-sessionizer" })

-- Other keymaps
vim.keymap.set("n", "<leader>n", function()
    -- Don't do anything if we are already in the file explorer
    if vim.api.nvim_get_option_value("filetype", {}) == "netrw" then
        return
    end

    -- Otherwise, open the file explorer and search/select the current file
    local current_file_name = vim.fn.expand("%:p:t")
    vim.cmd.Explore()
    if current_file_name then
        vim.fn.search("^" .. current_file_name .. "$")
    end
end, { desc = "Open file explorer" })
