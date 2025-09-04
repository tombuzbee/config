local minideps = require('minideps')
minideps.add {
  source = 'neovim/nvim-lspconfig',
  checkout = 'v2.4.0',
}
minideps.add {
  source = 'stevearc/conform.nvim',
  checkout = 'v9.1.0',
}

vim.lsp.config('*', { root_markers = { '.git', '.jj' } })
vim.lsp.enable {
  'bashls',
  'fish_lsp',
  'gopls',
  'lua_ls',
  'pylsp',
  'systemd_ls',
  'taplo',
}

local conform = require('conform')
conform.setup {
  default_format_opts = { timeout_ms = 5000 },
  formatters_by_ft = {
    fish = { 'fish_indent' },
    go = { 'gofmt', lsp_format = 'fallback' },
    json = { 'jq' },
    lua = { 'stylua' },
    python = { 'black' },
    toml = { 'taplo' },
    yaml = { 'yamlfmt' },
    ['_'] = { 'trim_whitespace' },
  },
  format_on_save = {},
}

vim.o.formatexpr = "v:lua.require'conform'.formatexpr({ 'timeout_ms': 5000 })"
vim.keymap.set('n', 'gQ', conform.format)

vim.api.nvim_set_hl(0, 'fishOption', { link = '@variable.parameter.builtin' })
