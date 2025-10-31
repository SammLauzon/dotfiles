return {
  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim',  opts = {} },

  -- Git merge conflict
  {'akinsho/git-conflict.nvim', version = "*", config = true},

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    config = function()
      require("ibl").setup({})
    end,
  },

  {
    "greggh/claude-code.nvim",
      dependencies = {
        "nvim-lua/plenary.nvim", -- Required for git operations
      },
      config = function()
        require("claude-code").setup({
        -- Terminal window settings
          window = {
            split_ratio = 0.4,      -- Percentage of screen for the terminal window (height for horizontal, width for vertical splits)
            position = "vertical",  -- Position of the window: "botright", "topleft", "vertical", "rightbelow vsplit", etc.
            enter_insert = true,    -- Whether to enter insert mode when opening Claude Code
            hide_numbers = true,    -- Hide line numbers in the terminal window
            hide_signcolumn = true, -- Hide the sign column in the terminal window
          },
          -- File refresh settings
          refresh = {
            enable = true,           -- Enable file change detection
            updatetime = 100,        -- updatetime when Claude Code is active (milliseconds)
            timer_interval = 1000,   -- How often to check for file changes (milliseconds)
            show_notifications = true, -- Show notification when files are reloaded
          },
          -- Git project settings
          git = {
            use_git_root = true,     -- Set CWD to git root when opening Claude Code (if in git project)
          },
          -- Command settings
          command = "claude",        -- Command used to launch Claude Code
          -- Keymaps
          keymaps = {
            toggle = {
              normal = "<C-,>",       -- Normal mode keymap for toggling Claude Code, false to disable
              terminal = "<C-,>",     -- Terminal mode keymap for toggling Claude Code, false to disable
            },
            window_navigation = true, -- Enable window navigation keymaps (<C-h/j/k/l>)
            scrolling = true,         -- Enable scrolling keymaps (<C-f/b>) for page up/down
          }
        })
      end,
  },

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  {
    'rcarriga/nvim-notify',
    config = function()
      require("notify").setup({
        background_colour = '#000000',
      })
    end
  },

  {
    'tamton-aquib/duck.nvim',
    config = function()
      vim.keymap.set('n', '<leader>dd', function() require("duck").hatch() end, {})
      vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
      vim.keymap.set('n', '<leader>da', function() require("duck").cook_all() end, {})
    end
  },

  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },

  {
    "ray-x/go.nvim",
    dependencies = {  -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      -- lsp_keymaps = false,
      -- other options
    },
    config = function(lp, opts)
      require("go").setup(opts)
      local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require('go.format').goimports()
        end,
        group = format_sync_grp,
      })
    end,
    event = {"CmdlineEnter"},
    ft = {"go", 'gomod'},
    build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
  },

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  'ntpeters/vim-better-whitespace',

  {
    -- `lazydev` configures Lua LSP for your Neovim config, runtime and plugins
    -- used for completion, annotations and signatures of Neovim apis
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
}
