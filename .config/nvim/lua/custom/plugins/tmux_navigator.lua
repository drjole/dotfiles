return {
  'christoomey/vim-tmux-navigator',
  config = function()
    vim.keymap.set('n', '<C-h>', '<cmd> TmuxNavigateLeft<CR>', { desc = 'tmux navigate to window left' })
    vim.keymap.set('n', '<C-j>', '<cmd> TmuxNavigateDown<CR>', { desc = 'tmux navigate to window down' })
    vim.keymap.set('n', '<C-k>', '<cmd> TmuxNavigateUp<CR>', { desc = 'tmux navigate to window up' })
    vim.keymap.set('n', '<C-l>', '<cmd> TmuxNavigateRight<CR>', { desc = 'tmux navigate to window right' })
  end,
}
