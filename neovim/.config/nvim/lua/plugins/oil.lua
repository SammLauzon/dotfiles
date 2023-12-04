return {
  'stevearc/oil.nvim',
  opts = {},
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = true,
      view_options = {
        -- Show files and directories that start with "."
        show_hidden = true,
      },
      float = {
        padding = 4
      }
    })
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "[o]pen [o]il" })
  end,
}
