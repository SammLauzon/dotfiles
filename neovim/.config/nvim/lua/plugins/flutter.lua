return {
  'akinsho/flutter-tools.nvim',
  requires = {
    'nvim-lua/plenary.nvim',
    'stevearc/dressing.nvim', -- optional for vim.ui.select
  },
  config = function()
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
      nmap("<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

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

      -- Create a command `:Format` local to the LSP buffer
      vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
      end, { desc = 'Format current buffer with LSP' })
      vim.keymap.set('n', '<leader>ff', ':Format<cr>', { desc = '[F]ormat [F]ile' })
    end

    -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)


    require("flutter-tools").setup {
      decorations = {
        statusline = {
          device = true,
        }
      },
      widget_guides = {
        enabled = true,
      },
      flutter_path = '/home/samuel/snap/flutter/common/flutter/bin/flutter',
      lsp = {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
          enableSnippets = true,
          renameFilesWithClasses = "always",
          updateImportsOnRename = true,
          completeFunctionCalls = true,
          lineLength = 100,
        },
      }
    }
    vim.keymap.set('n', '<leader>fs', ':FlutterRun<cr>', { desc = '[F]lutter [S]tart Project' })
    vim.keymap.set('n', '<leader>fr', ':FlutterRestart<cr>', { desc = '[F]lutter [R]estart Project' })
  end,
}
