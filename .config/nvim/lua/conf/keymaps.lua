-- General Keymaps
vim.g.mapleader = " " --Master key
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set
local opts = {noremap = true, silent = true }

-- Navigation
map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', opts) -- Searchs for files with Telecope
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', opts) -- Searchs for text in files with Telescope
map('n', '<leader>fb', '<cmd>Telescope buffers<cr>', opts) -- List open buffers 
map('n', '<leader>fh', '<cmd>Telescope help_tag<cr>', opts) -- Help Neovim
map('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>', opts) -- LSP diagnostics

map('n', '<leader>et', ':NvimTreeToggle<cr>', opts) -- File explorer
map('n', '<leader>ef', ':NvimTreeFocus<cr>', opts) -- File explorer

-- Colorscheme
--Dark (tokyonight)
--light (other)
-- Tabs
map('n', '<leader>tn', ':tabnew<cr>', opts) -- Create new tab
map('n', '<leader>tc', ':tabclose<cr>', opts) -- Close tab

-- Create Window 
map('n', '<C-s>', ':split', opts) -- Split window
map('n', '<C-c>', ':close', opts) -- Close window

-- Windows Movement
map('n', '<C-h>', '<C-w>h', opts) --
map('n', '<C-j>', '<C-w>j', opts) -- Down
map('n', '<C-k>', '<C-w>k', opts) -- Up
map('n', '<C-l>', '<C-w>l', opts) --

-- Save and Close
map('n', '<leader>w', ':w<cr>', opts) -- Save file
map('n', '<leader>q', ':q<cr>', opts) -- Close window
