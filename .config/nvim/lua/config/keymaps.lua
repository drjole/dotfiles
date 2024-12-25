-- Execute lua
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<cr>")
vim.keymap.set("n", "<leader>x", ":.lua<cr>")
vim.keymap.set("v", "<leader>x", ":lua<cr>")

-- Center view when navigating
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "}", "}zz")
vim.keymap.set("n", "{", "{zz")

-- Move lines
vim.keymap.set("n", "<M-j>", "<cmd>m .+1<cr>==")
vim.keymap.set("n", "<M-k>", "<cmd>m .-2<cr>==")
vim.keymap.set("i", "<M-j>", "<esc><cmd>m .+1<cr>==gi")
vim.keymap.set("i", "<M-k>", "<esc><cmd>m .-2<cr>==gi")
vim.keymap.set("v", "<M-j>", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<cr>gv=gv")

-- Navigate quickfix
vim.keymap.set("n", "<C-M-j>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<C-M-k>", "<cmd>cprev<cr>")

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux new-window tmux-sessionizer<cr>")
