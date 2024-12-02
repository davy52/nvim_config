return {
  vim.keymap.set('n', '<leader>;h', '<cmd>split<cr>', { desc = '[H]orizontal spit' }),
  vim.keymap.set('n', '<leader>;v', '<cmd>vsplit<cr>', { desc = '[V]ertical spit' }),
  vim.keymap.set('n', '<M-,>', '<cmd>vert res -5<cr>', { desc = 'split wider' }),
  vim.keymap.set('n', '<M-.>', '<cmd>vert res +5<cr>', { desc = 'split thinner' }),
  vim.keymap.set('n', '<M-->', '<cmd>res -5<cr>', { desc = 'split shorter' }),
  vim.keymap.set('n', '<M-=>', '<cmd>res +5<cr>', { desc = 'split taller' }),
}
