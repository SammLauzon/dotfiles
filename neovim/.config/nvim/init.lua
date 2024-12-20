--[[
    Samuel Lauzon's Neovim Configuration
    GitHub: https://github.com/SammLauzon
--]]

if vim.g.vscode then
    -- VSCode Neovim
    require('vscode_keymaps')

else
    -- Improve starting time
    vim.loader.enable()
    -- Enable Transparent Background
    -- highlight Normal ctermbg=NONE guibg=NONE

    require('config.options')
    require('config.mappings')
    require('config.lazy')
    require('config.filemapping')
    require('config.utils')
end

