require('minideps').add {
  source = 'jake-stewart/multicursor.nvim',
  checkout = 'd6477ed',
}

local mc = require('multicursor-nvim')
mc.setup()

vim.keymap.set('n', '<C-LeftMouse>', mc.handleMouse)
vim.keymap.set({ 'n', 'x' }, 'C', function() mc.lineAddCursor(1) end)
vim.keymap.set({ 'n', 'x' }, '<A-C>', function() mc.lineAddCursor(-1) end)
vim.keymap.set('x', 's', mc.matchCursors)
vim.keymap.set('n', '<Leader>C', mc.searchAllAddCursors)

mc.addKeymapLayer(function(layerSet)
  layerSet({ 'n', 'x' }, '<Left>', mc.prevCursor)
  layerSet({ 'n', 'x' }, '<Right>', mc.nextCursor)
  layerSet({ 'n', 'x' }, ',', mc.clearCursors)
end)
