return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      float = {
        padding = 4,
      }
    })
    vim.keymap.set("n", "<leader>oo", "<CMD>Oil<CR>", { desc = "[o]pen [o]il" })
    vim.keymap.set("n", "<leader>of", require("oil").toggle_float, { desc = "[o]pen [f]loat" })
    require('which-key').register {
      ['<leader>o'] = { name = '[O]il', _ = 'which_key_ignore' },
    }
  end,
}
