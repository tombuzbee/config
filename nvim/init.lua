vim.o.breakindent = true
vim.o.colorcolumn = '+0'
vim.o.completeopt = 'menuone,noselect,nosort'
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.infercase = true
vim.o.linebreak = true
vim.o.list = true
vim.o.listchars = 'tab:» ,trail:·,extends:❯,precedes:❮,nbsp:␣'
vim.o.mouse = 'a'
vim.o.number = true
vim.o.pumblend = 20
vim.o.scrolloff = 3
vim.o.shiftwidth = 0
vim.o.shortmess = 'clTOWotFC'
vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.smartcase = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.virtualedit = 'block'
vim.o.whichwrap = 'h,l,<,>,[,]'
vim.o.winblend = 20

vim.g.mapleader = ' '

vim.keymap.set('n', '/', '/\\v')
vim.keymap.set('n', '<Esc>', vim.cmd.nohlsearch)
vim.keymap.set('n', '<C-w>\\', vim.cmd.vsplit)
vim.keymap.set('n', '<C-w>=', vim.cmd.split)

require('minideps').add {
  source = 'rebelot/kanagawa.nvim',
  checkout = 'debe915',
}
vim.cmd.colorscheme('kanagawa')

require('plugins.languages')
require('plugins.mini')
require('plugins.multicursor')
