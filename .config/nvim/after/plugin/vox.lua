vim.opt.runtimepath:append '/Users/tiemo/src/vox.nvim'

local vox = require 'vox'

vox.setup {
  telescope = true,
  opts = { telescope = true },
  backend = require('vox.voxd_backend').setup {
    routing = {
      linenr = 'fast',
      line = 'medium',
      diagnostic = 'medium',
      meta = 'fast',
      special = 'fast',
      ['special.open'] = 'open',
      ['special.close'] = 'close',
    },
  },
}

local function map(key, nodes)
  vim.keymap.set({ 'n', 'i' }, string.format('<C-s>%s', key), function()
    vox.speak(nodes)
  end)
end

map('d', { vox.diagnostics })
map('f', { vox.filename })

vim.keymap.set('n', 'w', function()
  vim.api.nvim_feedkeys('w', 'n', false)
  vox.suspend()
  vox.speak(vox.word())
end, { noremap = true, silent = true })
