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
    special_char_voice = 'special',
  },

  -- postprocess = function(utterances)
  --   local result = {}
  --   local ft = vim.bo.filetype
  --
  --   for _, u in ipairs(utterances) do
  --     if ft == 'help' or not (u.event.type == 'CursorMoved' and u.source == 'line') then
  --       table.insert(result, u)
  --     end
  --   end
  --
  --   return result
  -- end,
}
require('vox').setup(vox_config)

vim.api.nvim_create_user_command('VoxReload', function()
  for k, _ in pairs(package.loaded) do
    if string.match(k, '^vox') ~= nil then
      package.loaded[k] = nil
    end
  end

  require('vox').setup(vox_config)
end, {})
