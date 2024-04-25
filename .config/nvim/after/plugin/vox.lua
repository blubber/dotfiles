vim.opt.runtimepath:append '/Users/tiemo/src/vox.nvim'

local vox_config = {
  rate = 1.2,

  sources = {
    lnum = {
      rate = 1.5,
    },
    line = { muted = true },
  },
}
require('vox').setup(vox_config)

require('vox2').setup()

vim.api.nvim_create_user_command('VoxReload', function()
  package.loaded.vox = nil
  package.loaded.vox2 = nil
  require('vox').setup(vox_config)
  require('vox2').setup()
end, {})
