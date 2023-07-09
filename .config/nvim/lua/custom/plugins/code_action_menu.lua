return {
  'weilbith/nvim-code-action-menu',
  cmd = 'CodeActionMenu',
  config = function()
    vim.g.code_action_menu_window_border = 'single'
    vim.g.code_action_menu_show_details = false
  end,
}
