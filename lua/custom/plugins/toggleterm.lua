return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    lazy = false,
    opts = {
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      autochdir = false,
      -- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
      direction = 'horizontal',
      name = 'bash',
      width = 20,
    },
    keys = {
      { '<leader>\\\\', ':TermSelect<cr>', desc = 'List Terminals' },
      {
        '<leader>\\r',
        function()
          local new_name = vim.fn.input { prompt = 'Terminal name: ' }

          if new_name == nil or new_name == '' then
          else
            vim.fn.execute('ToggleTermSetName ' .. new_name)
          end
        end,
        desc = '[R]ename terminal',
      },
    },
  },
}
