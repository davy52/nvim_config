vim.opt.showtabline = 2
return {
  {
    'crispgm/nvim-tabline',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = true,
    opts = {
      show_index = true, -- show tab index
      show_modify = true, -- show buffer modification indicator
      show_icon = false, -- show file extension icon
      fnamemodify = ':t', -- file name modifier string
      -- can be a function to modify buffer name
      modify_indicator = ' +', -- modify indicator
      no_name = 'No name', -- no name buffer name
      brackets = { '[', ']' }, -- file name brackets surrounding
      inactive_tab_max_length = 0, -- max length of inactive tab titles, 0 to ignore
    },
  },

  vim.keymap.set('n', '<leader>tt', '<cmd>tabnew<cr>', { desc = '[T]ab new [T]ab' }),
  vim.keymap.set('n', '<leader>tc', '<cmd>tabclose<cr>', { desc = '[T]ab [C]lose' }),
  vim.keymap.set('n', '<leader>to', '<cmd>tabonly<cr>', { desc = '[T]ab [O]nly this left' }),
  vim.keymap.set('n', '<S-l>', '<cmd>tabnext<cr>', { desc = 'Tab next' }),
  vim.keymap.set('n', '<S-h>', '<cmd>tabnext -<cr>', { desc = 'Tab previous' }),
}
