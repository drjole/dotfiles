-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Write buffer
vim.keymap.set('n', '<C-s>', vim.cmd.write, { desc = 'Write current buffer' })
vim.keymap.set('n', '<leader>q', vim.cmd.quitall, { desc = 'Quit all buffers' })
vim.keymap.set('n', '<leader>c', vim.cmd.quit, { desc = 'Quit current buffer' })

-- Toggle file tree
vim.keymap.set('n', '<leader>e', vim.cmd.NeoTreeFocusToggle, { desc = 'Toggle file tree' })

-- Move selected block up or down respecting context
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Quality of life
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')
