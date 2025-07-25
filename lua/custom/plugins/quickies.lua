vim.api.nvim_create_autocmd('QuickFixCmdPost', {
  group = vim.api.nvim_create_augroup('QuickFixQOL', { clear = false }),
  command = 'cw',
})

vim.cmd [[
cnoreabbrev W w
cnoreabbrev make make!
cnoreabbrev grep grep!
]]

return {}
