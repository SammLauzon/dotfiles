return {
   --Git related plugins
   'tpope/vim-fugitive',
   vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = '[g]it [s]tatus' }),
}
