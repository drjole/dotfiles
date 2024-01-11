-- Diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

-- Center view when navigating
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz")

-- Move lines
vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv")

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- DAP
vim.keymap.set("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>")
vim.keymap.set("n", "<F5>", "<cmd>DapContinue<CR>")
vim.keymap.set("n", "<F6>", "<cmd>DapStepOut<CR>")
vim.keymap.set("n", "<F7>", "<cmd>DapStepInto<CR>")
vim.keymap.set("n", "<F8>", "<cmd>DapStepOver<CR>")
