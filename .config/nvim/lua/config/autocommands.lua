-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Enable spell in LaTeX files
vim.api.nvim_create_autocmd("BufEnter", {
  group = vim.api.nvim_create_augroup("LatexSpell", { clear = true }),
  pattern = { "*.tex" },
  callback = function()
    vim.opt_local.spell = true
  end,
})
