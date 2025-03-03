-- Set space as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- A workaround to prevent errors with :Inspect
vim.hl = vim.highlight

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

require 'options'
require 'keymaps'
require 'lazy-bootstrap'
require 'lazy-plugins'

vim.api.nvim_create_autocmd({ 'BufEnter', 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    if vim.fn.mode() ~= 'c' then
      vim.cmd 'checktime'
    end
  end,
})

-- vim: ts=2 sts=2 sw=2 et
