
-- Highlight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Autocommand group for fold persistence
vim.api.nvim_create_augroup("SaveFolds", { clear = true })

-- Save folds when leaving the buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  group = "SaveFolds",
  pattern = "*.*",
  command = "mkview"
})

-- Restore folds when entering the buffer
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "SaveFolds",
  pattern = "*.*",
  command = "silent! loadview"
})
