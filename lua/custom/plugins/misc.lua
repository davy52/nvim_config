return {
  vim.keymap.set('n', '<leader>e', '<cmd>Ex<cr>', { desc = '[e]xplore' }),
  vim.keymap.set('n', '<leader>E', '<cmd>e.<cr>', { desc = '[E]xplore cwd' }),
}
