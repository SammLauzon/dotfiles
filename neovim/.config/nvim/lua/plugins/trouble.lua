return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  vim.keymap.set("n", "<leader>xt", function() require("trouble").toggle() end, { desc = '[T]oggle' }),
  vim.keymap.set("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end, { desc = '[W]orkspace Diagnostics' }),
  vim.keymap.set("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end, { desc = '[D]ocument Diagnostics' }),
  vim.keymap.set("n", "<leader>xq", function() require("trouble").toggle("quickfix") end, { desc = '[Q]uickfix' }),
  vim.keymap.set("n", "<leader>xl", function() require("trouble").toggle("loclist") end, { desc = '[L]oclist' }),
}
