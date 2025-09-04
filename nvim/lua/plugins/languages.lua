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

require('conform').setup {
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
  format_on_save = function(bufnr)
    return vim.tbl_contains(
      { 'fish', 'go', 'json', 'lua', 'toml', 'yaml' },
      vim.bo[bufnr].filetype
    ) and {}
  end,
}
vim.o.formatexpr = 'v:lua.require("conform").formatexpr()'
