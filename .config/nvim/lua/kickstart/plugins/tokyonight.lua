return {
  { -- You can easily change to a different colorscheme.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    init = function()
      vim.cmd.colorscheme 'tokyonight-night'

      vim.cmd.hi 'Comment gui=italic guifg=#33ccee'
      vim.cmd.hi 'Normal guibg=black'
      vim.cmd.hi 'ColorColumn guibg=#292e42'
      vim.cmd.hi 'CursorLine guibg=none gui=underline'
      vim.cmd.hi 'LineNr guifg=#ff9e64 gui=none'
      vim.cmd.hi 'CursorLineNr gui=bold guifg=#ffff44'

      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*:i',
        command = 'hi CursorLine guibg=black gui=none',
      })
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = 'i:*',
        command = 'hi CursorLine gui=underline',
      })
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = '*:i',
        command = 'hi Whitespace guibg=#442200',
      })
      vim.api.nvim_create_autocmd('ModeChanged', {
        pattern = 'i:*',
        command = 'hi Whitespace guibg=#cc5500',
      })
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
