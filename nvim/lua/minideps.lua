local path_package = vim.fn.stdpath('data') .. '/site/'
local mini_path = path_package .. 'pack/deps/start/mini.nvim'

if not vim.loop.fs_stat(mini_path) then
  vim.cmd('echo "Installing `mini.nvim`" | redraw')
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    '--branch=v0.16.0',
    'https://github.com/nvim-mini/mini.nvim',
    mini_path,
  }
  vim.cmd('packadd mini.nvim | helptags ALL')
  vim.cmd('echo "Installed `mini.nvim`" | redraw')
end

local minideps = require('mini.deps')
minideps.setup { path = { package = path_package } }
return minideps
