local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- remap leader key
keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank to system clipboard
keymap({"n", "v"}, "<leader>y", '"+y', opts)

-- paste from system clipboard
keymap({"n", "v"}, "<leader>p", '"+p', opts)

-- better indent handling
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- move text up and down
keymap("v", "J", ":m .+1<CR>==", opts)
keymap("v", "K", ":m .-2<CR>==", opts)
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)

-- paste preserves primal yanked piece
keymap("v", "p", '"_dP', opts)

-- removes highlighting after escaping vim search
keymap("n", "<Esc>", "<Esc>:noh<CR>", opts)


-- general keymaps
-- Terminal
keymap({"n", "v"}, "<leader>tt", "<cmd>lua require('vscode').action('workbench.action.terminal.toggleTerminal')<CR>")

-- Editor
keymap({"n", "v"}, "<leader>k", "<cmd>lua require('vscode').action('editor.action.showHover')<CR>")
keymap({"n", "v"}, "<leader>ca", "<cmd>lua require('vscode').action('editor.action.codeAction')<CR>")
keymap({"n"}, "<leader>cr", "<cmd>lua require('vscode').action('editor.action.rename')<CR>")

-- LSP
keymap({"n"}, "<leader>cs", "<cmd>lua require('vscode').action('workbench.action.gotoSymbol')<CR>")

-- Files
keymap({"n", "v"}, "<leader>sf", "<cmd>lua require('vscode').action('workbench.action.quickOpen')<CR>")
keymap('n', '<Leader>sg', "<cmd>lua require('vscode').action('workbench.action.findInFiles')<CR>")

-- Others
keymap({"n", "v"}, "<leader>nd", "<cmd>lua require('vscode').action('notifications.clearAll')<CR>")
keymap('n', '<Leader>e', "<cmd>lua require('vscode').action('workbench.action.toggleSidebarVisibility')<CR>")
keymap({"n", "v"}, "<leader>cp", "<cmd>lua require('vscode').action('workbench.action.showCommands')<CR>")
keymap({"n"}, "<leader>zt", "<cmd>lua require('vscode').action('workbench.action.toggleZenMode')<CR>")



-- Git keymaps
keymap({"n"}, "<leader>gs", "<cmd>lua require('vscode').action('workbench.view.scm')<CR>")


-- harpoon keymaps
keymap({"n", "v"}, "<leader>ha", "<cmd>lua require('vscode').action('vscode-harpoon.addEditor')<CR>")
keymap({"n", "v"}, "<leader>hm", "<cmd>lua require('vscode').action('vscode-harpoon.editorQuickPick')<CR>")
keymap({"n", "v"}, "<leader>he", "<cmd>lua require('vscode').action('vscode-harpoon.editEditors')<CR>")
keymap({"n", "v"}, "<leader>h1", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor1')<CR>")
keymap({"n", "v"}, "<leader>h2", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor2')<CR>")
keymap({"n", "v"}, "<leader>h3", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor3')<CR>")
keymap({"n", "v"}, "<leader>h4", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor4')<CR>")
keymap({"n", "v"}, "<leader>h5", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor5')<CR>")
keymap({"n", "v"}, "<leader>h6", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor6')<CR>")
keymap({"n", "v"}, "<leader>h7", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor7')<CR>")
keymap({"n", "v"}, "<leader>h8", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor8')<CR>")
keymap({"n", "v"}, "<leader>h9", "<cmd>lua require('vscode').action('vscode-harpoon.gotoEditor9')<CR>")

-- project manager keymaps
keymap({"n", "v"}, "<leader>pa", "<cmd>lua require('vscode').action('projectManager.saveProject')<CR>")
keymap({"n", "v"}, "<leader>pm", "<cmd>lua require('vscode').action('projectManager.listProjectsNewWindow')<CR>")
keymap({"n", "v"}, "<leader>pe", "<cmd>lua require('vscode').action('projectManager.editProjects')<CR>")

-- vsnetrw
keymap({"n"}, "-", "<cmd>lua require('vscode').action('vsnetrw.open')<CR>")
