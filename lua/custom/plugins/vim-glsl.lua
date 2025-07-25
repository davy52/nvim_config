vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  pattern = { '*.vs', '*.fs' },
  command = 'set ft=glsl',
})

return {
  'tikhomirov/vim-glsl',
  lazy = false,
}
