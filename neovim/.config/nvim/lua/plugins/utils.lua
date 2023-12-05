return {

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    config = function()
      require("ibl").setup({
        exclude = {
          filetypes = {
            "dashboard", }
        }
      })
    end,
  },

  {
    "L3MON4D3/LuaSnip",
	-- follow latest release.
	version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = "make install_jsregexp"
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup({
        background_colour = '#000000',
      })
    end
  },
  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },
}
