return {
  {
    'rose-pine/neovim',
    name = 'rose-pine',
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'rose-pine'
    end,
  },
  require('rose-pine').setup({
    disable_background = true
  }),
  vim.api.nvim_set_hl(0, "Normal", {bg = "none"}),
  vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})

}

