package.path = package.path .. ";/home/iskry/.config/nvim/?.lua"

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Load configurations
require('settings')
require('plugins')
require('keymaps')
require('lsp')
