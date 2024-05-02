vim.opt.runtimepath:append '/Users/tiemo/src/vox.nvim'

local backend = require 'vox.backend'

local vox_config = {
  backend = backend.setup {
    routing = {
      lnum = 'fast',
      line = 'medium',
      text = 'medium',
      virt_text = 'slow',
      meta = 'fast',
    },
  },

  sources = {
    lnum = {
      rate = 1.5,
    },
    line = { muted = true },
  },
}
require('vox').setup(vox_config)

vim.api.nvim_create_user_command('VoxReload', function()
  package.loaded.vox = nil
  require('vox').setup(vox_config)
end, {})
