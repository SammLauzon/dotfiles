--[[
    Samuel Lauzon's Neovim Configuration
    GitHub: https://github.com/SammLauzon
--]]

-- Improve starting time
vim.loader.enable()
-- Enable Transparent Background
-- highlight Normal ctermbg=NONE guibg=NONE

require('config.options')
require('config.mappings')
require('config.lazy')
require('config.filemapping')
require('config.utils')

