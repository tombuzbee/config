require('minideps').add {
  source = 'nvim-mini/mini.nvim',
  checkout = 'v0.16.0',
}

require('mini.basics').setup {
  options = { basic = false },
  autocommands = { relnum_in_visual_mode = true },
}
require('mini.completion').setup()
require('mini.files').setup { mappings = { close = '<Esc>' } }
require('mini.icons').setup()
require('mini.indentscope').setup()
require('mini.jump').setup()
require('mini.jump2d').setup()
require('mini.keymap').setup()
require('mini.misc').setup()
require('mini.move').setup {
  mappings = { left = 'H', down = 'J', up = 'K', right = 'L' },
}
require('mini.notify').setup()
require('mini.operators').setup()
require('mini.pairs').setup()
require('mini.pick').setup()
require('mini.statusline').setup()
require('mini.surround').setup()

MiniFiles.config.options.permanent_delete = true
vim.keymap.set(
  'n',
  '<Leader>',
  function() MiniFiles.open(vim.api.nvim_buf_get_name(0)) end
)

MiniIndentscope.config.draw.animation = MiniIndentscope.gen_animation.none()
MiniIndentscope.config.options.try_as_border = true
MiniIndentscope.config.symbol = '▏'
vim.api.nvim_set_hl(0, 'MiniIndentscopeSymbol', { link = 'NonText' })

MiniKeymap.map_multistep('i', '<Tab>', { 'pmenu_next' })
MiniKeymap.map_multistep('i', '<S-Tab>', { 'pmenu_prev' })
MiniKeymap.map_multistep('i', '<CR>', { 'pmenu_accept', 'minipairs_cr' })
MiniKeymap.map_multistep('i', '<BS>', { 'minipairs_bs' })

MiniMisc.setup_restore_cursor()
MiniMisc.setup_termbg_sync()

vim.keymap.set('n', '<Leader>f', function() MiniPick.builtin.files() end)

local clue = require('mini.clue')
clue.setup {
  clues = {
    clue.gen_clues.builtin_completion(),
    clue.gen_clues.g(),
    clue.gen_clues.marks(),
    clue.gen_clues.registers(),
    clue.gen_clues.windows(),
    clue.gen_clues.z(),
  },
  triggers = {
    { mode = 'n', keys = '<Leader>' },
    { mode = 'x', keys = '<Leader>' },
    { mode = 'i', keys = '<C-x>' },
    { mode = 'n', keys = 'g' },
    { mode = 'x', keys = 'g' },
    { mode = 'n', keys = "'" },
    { mode = 'n', keys = '`' },
    { mode = 'x', keys = "'" },
    { mode = 'x', keys = '`' },
    { mode = 'n', keys = '"' },
    { mode = 'x', keys = '"' },
    { mode = 'i', keys = '<C-r>' },
    { mode = 'c', keys = '<C-r>' },
    { mode = 'n', keys = '<C-w>' },
    { mode = 'n', keys = 'z' },
    { mode = 'x', keys = 'z' },
  },
}
