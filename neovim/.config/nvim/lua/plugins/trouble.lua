return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
    {silent = true, noremap = true}
  )
}
