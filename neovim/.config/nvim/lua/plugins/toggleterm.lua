return {
  "akinsho/toggleterm.nvim",
  tag = "*",
  config = true,
  vim.keymap.set('n', "<leader>tt", "<cmd>ToggleTerm direction=float<CR>", { desc = "[T]oggle [T]erminal"}),
  vim.keymap.set('n', "<leader>gpp", function()
      local count = vim.v.count1
      require("toggleterm").exec("git push", count, 12)
    end,
    { desc = "[g]it [p]ush" }),
  vim.keymap.set('n', "<leader>gpf", function()
      local count = vim.v.count1
      require("toggleterm").exec("git push -f", count, 12)
    end,
    { desc = "[g]it [p]ush [f]orce" }),
  vim.keymap.set('n', "<leader>gP", function()
      local count = vim.v.count1
      require("toggleterm").exec("git Pull", count, 12)
    end,
    { desc = "[g]it [P]ull" }),
}
