return {
  -- vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { desc = '[B]uffer [D]elete' }),
  vim.keymap.set('n', '<leader>bd', function()
    if vim.bo.modified then
      local choice = vim.fn.confirm('Save before closing?', '&Yes\n&No\n&Cancel', 1, 'Info')
      if choice == 1 then
        vim.cmd.write()
        vim.cmd.bd()
      elseif choice == 2 then
        vim.cmd.bd { bang = true }
      else
        return
      end
    else
      vim.cmd.bd()
    end
  end, { desc = '[B]uffer [D]elete' }),

  --FIXME: better delete all and all butthis one
  vim.keymap.set('n', '<leader>ba', '<cmd>%bd!|e .<cr>', { desc = '[B]uffer delete [A]ll' }),
  vim.keymap.set('n', '<leader>bo', '<cmd>%bd!|e#<cr>', { desc = '[B]uffer leave [o]ne' }),
}
