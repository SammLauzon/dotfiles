return {
  'akinsho/flutter-tools.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
    local on_attach = require('plugins.lsp').on_attach
    local capabilities = require('plugins.lsp').on_attach
    require("flutter-tools").setup {
      flutter_path = '/home/samuel/snap/flutter/common/flutter/bin/flutter',
      lsp = {
        on_attach = on_attach,
        capabilities = capabilities
      }
    }
  end,
}


