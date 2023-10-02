-- Leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Options
vim.opt.clipboard = "unnamedplus" -- Sync with system clipboard
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
vim.opt.cursorline = true -- Enable highlighting of the current line
vim.opt.ignorecase = true -- Ignore case
vim.opt.mouse = "a" -- Enable mouse mode
vim.opt.number = true -- Print line number
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.opt.smartcase = true -- Don't ignore case with capitals
vim.opt.smartindent = true -- Insert indents automatically
vim.opt.termguicolors = true -- True color support
vim.opt.undofile = true -- Save undo history to a file
vim.opt.undolevels = 10000 -- Maximum number of changes that can be undone
vim.opt.wrap = false -- Disable line wrap
