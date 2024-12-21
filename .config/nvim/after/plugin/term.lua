vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('custom-term', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.cmd.tnoremap '<Esc> <C-\\><C-n>'
  end,
})
