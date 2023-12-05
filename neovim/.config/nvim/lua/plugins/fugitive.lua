return {
   --Git related plugins
   'tpope/vim-fugitive',
   vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[g]it [s]tatus' }),
   vim.keymap.set('n', '<leader>gP', function()
      vim.cmd.Git('pull')
   end, { desc = '[g]it [P]ull' }),
   vim.keymap.set('n', '<leader>gpp', function()
      vim.cmd.Git('push')
   end, { desc = '[g]it [p]ush' }),
   vim.keymap.set('n', '<leader>gpf', ":Git push -f<cr>", { desc = '[g]it [p]ush [f]orce' }),
}
