return {
  -- LSP Configuration & Plugins
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs to stdpath for neovim
    'williamboman/mason.nvim',
    'williamboman/mason-lspconfig.nvim',

    -- Useful status updates for LSP
    -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
    { 'j-hui/fidget.nvim', opts = {} },

    -- Additional lua configuration, makes nvim stuff amazing!
    'folke/neodev.nvim',
  },
  config = function()
    -- [[ Configure LSP ]]
    --  This function gets run when an LSP connects to a particular buffer.
    local on_attach = function(_, bufnr)
      -- In this case, we create a function that lets us more easily define mappings specific
      -- for LSP related items. It sets the mode, buffer and description for us each time.
      local nmap = function(keys, func, desc)
        if desc then
          desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
      end

      nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
      nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

      nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
      nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
      nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
      nmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
      nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
      nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')
      vim.keymap.set('i', '<c-k>', vim.lsp.buf.signature_help, { desc = "Signature Help" })
      nmap("<leader>ca", vim.lsp.buf.code_action, '[C]ode [A]ction')

      -- See `:help K` for why this keymap
      nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
      nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

      -- Lesser used LSP functionality
      nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
      nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
      nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
      nmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, '[W]orkspace [L]ist Folders')

    end

    -- document existing key chains
    local wk = require('which-key')
    wk.add({
      { "<leader>c", group = "[C]ode" },
      { "<leader>c_", hidden = true },
      { "<leader>d", group = "[D]ocument" },
      { "<leader>d_", hidden = true },
      { "<leader>g", group = "[G]it" },
      { "<leader>g_", hidden = true },
      { "<leader>h", group = "[H]arpoon" },
      { "<leader>h_", hidden = true },
      { "<leader>r", group = "[R]ename" },
      { "<leader>r_", hidden = true },
      { "<leader>s", group = "[S]earch" },
      { "<leader>s_", hidden = true },
      { "<leader>w", group = "[W]orkspace" },
      { "<leader>w_", hidden = true },
      -- ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
      -- ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
      -- ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
      -- ['<leader>h'] = { name = '[H]arpoon', _ = 'which_key_ignore' },
      -- ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
      -- ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
      -- ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
    })

    -- mason-lspconfig requires that these setup functions are called in this order
    -- before setting up the servers.
    require('mason').setup()
    require('mason-lspconfig').setup()

    local servers = {
      lua_ls = {
        Lua = {
          workspace = { checkThirdParty = false },
          telemetry = { enable = false },
        },
      },
      robotframework_ls = {
        filetypes = { 'robot', 'resource' },
        robot = {
          language_server = {
            python = "/home/slauzon/.pyenv/versions/3.12.7/envs/kts_robot/bin/python"

          },
          pythonpath = {
            "/home/slauzon/repo/kts_robot/tests_libraries",
            "/home/slauzon/repo/kts_robot",
            "/home/slauzon/robot_libspec"
            -- "/home/slauzon/repo/test_libraries"
          },
          loadVariablesFromArgumentsFile = "/home/slauzon/repo/kts_robot/tests_libraries/tools/config/all_variables.robot",
          python = {
            executable = "/home/slauzon/.pyenv/versions/3.12.7/envs/kts_robot/bin/python"
          },
          completions = {
            keywords = {
              format = "all lower"
            }
          },
          libraries = {
            libdoc = {
              preGenerate = {
                "/home/slauzon/repo/kts_robot/tests_libraries/libraries/kinova_shared_libraries/link_test_jig_interfaces/KR27108.py"
              }
            }
          },
          lint = {
            keywordResolvesToMultipleKeywords = false,
          }
        },
      },
      groovyls = {
        filetypes = { 'groovy', 'jenkinsfile' },
        groovy = {
          classpath = {
            "/home/slauzon/repo/kts_robot/jenkins/"
          },
        },
      },
    }

    vim.keymap.set('n', '<leader>=', vim.lsp.buf.format, { desc = 'Format File' })
    vim.lsp.handlers['textDocument/publishDiagnostics'] =
        vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
          underline = false
        })

    -- Setup neovim lua configuration
  require('neodev').setup()

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

    -- Ensure the servers above are installed
    local mason_lspconfig = require 'mason-lspconfig'

    mason_lspconfig.setup {
      ensure_installed = vim.tbl_keys(servers),
    }

    mason_lspconfig.setup_handlers {
      function(server_name)
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end,
    }
  end,
}
