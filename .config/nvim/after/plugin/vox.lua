local vox_config = {
  rate = 1.2,

  sources = {
    lnum = {
      rate = 1.5,
    },
    line = { muted = true },
  },
}
-- require('vox').setup(vox_config)
--
-- vim.api.nvim_create_user_command('VoxReload', function()
--   package.loaded.vox = nil
--   require('vox').setup(vox_config)
-- end, {})
--
